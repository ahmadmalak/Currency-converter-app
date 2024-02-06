import 'package:auto_route/auto_route.dart';
import 'package:currency_converter_app/blocs/currency/currency_bloc.dart';
import 'package:currency_converter_app/blocs/local_currency/local_currency_cubit.dart';
import 'package:currency_converter_app/models/currency.dart';
import 'package:currency_converter_app/screens/widgets/currency_drop_item.dart';
import 'package:currency_converter_app/screens/widgets/saved_currency_item.dart';
import 'package:currency_converter_app/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/convert_currency_dto.dart';

@RoutePage()
class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({super.key});

  @override
  State<CurrencyConverterPage> createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  
  // Initial values
  Currency fromCurrency = Currency.usd();
  Currency toCurrency = Currency.euro();
  String amount = "100.00";
  double convertedAmount = 0.0;

  CurrencyBloc get currencyBloc => context.read();

  LocalCurrencyCubit get localCurrencyCubit => context.read();
  final txtController = TextEditingController(text: "100.00");

  @override
  void initState() {
    super.initState();
    currencyBloc.onFetchCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter'),
      ),
      body: BlocBuilder<CurrencyBloc, CurrencyState>(
        builder: (context, state) {
          if (state is CurrencyStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CurrencyStateError) {
            return Center(
              child: Text(
                state.error.toString(),
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          if (state is CurrencyStateLoaded) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // From currency dropdown
                    DropdownButtonFormField<Currency>(
                      value: fromCurrency,
                      items: state.currencies.map((currency) {
                        return DropdownMenuItem(
                          value: currency,
                          child: CurrencyDropItem(
                            currency: currency,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() => fromCurrency = value!);
                      },
                    ),
                    // To currency dropdown
                    DropdownButtonFormField<Currency>(
                      value: toCurrency,
                      items: state.currencies.map((currency) {
                        return DropdownMenuItem(
                          value: currency,
                          child: CurrencyDropItem(
                            currency: currency,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) => setState(() => toCurrency = value!),
                    ),
                    // Amount input field
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: txtController,
                      onChanged: (value) {
                        amount = value;
                      },
                      decoration: const InputDecoration(labelText: 'Amount'),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    // Convert button

                    AppButton(
                      text: 'Convert',
                      onPressed: handleConvertButtonPressed,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    // Display converted amount
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey[200],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            'Converted amount: $convertedAmount ${toCurrency.code}'),
                      ),
                    ),

                    const SizedBox(height: 40),
                    BlocBuilder<LocalCurrencyCubit, LocalCurrencyState>(
                      builder: (context, state) {
                        if (state is LocalCurrencyLoaded) {
                          return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Saved Currencies'),
                                ...state.data
                                    .map(
                                      (e) => SavedCurrencyItem(
                                        dto: e,
                                      ),
                                    )
                                    .toList(),
                              ]);
                        }
                        return const SizedBox();
                      },
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  // Handle conversion button press
  void handleConvertButtonPressed() async {
    final validValue = validateInput(amount);
    if (validValue == null) return;
    try {
      final conversionRate = await currencyBloc.fetchConversionRate(
        ConvertCurrencyDto(
          toCurrency: toCurrency,
          fromCurrency: fromCurrency,
          amount: validValue,
        ),
      );
      setState(() {
        convertedAmount = validValue * conversionRate;
      });
      await localCurrencyCubit.refresh();
    } catch (error) {
      rethrow;
      // Handle errors gracefully (e.g., show error message to user)
    }
  }

  ///it reruns [null] if failed to check
  ///it reruns [double] for valid check
  double? validateInput(String amount) {
    if (amount.isEmpty) return null;
    final value = double.parse(amount);
    if (value.isNegative) return null;
    return value;
  }
}

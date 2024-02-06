import 'package:bloc/bloc.dart';
import 'package:currency_converter_app/models/convert_currency_dto.dart';
import 'package:currency_converter_app/models/currency.dart';
import 'package:currency_converter_app/repositories/currency_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'currency_state.dart';

@injectable
class CurrencyBloc extends Cubit<CurrencyState> {
  CurrencyBloc({required this.currencyRepository})
      : super(CurrencyStateLoading());
  final CurrencyRepo currencyRepository;

  double get calculatedResult => 0.0;
  late List<Currency> currenciesList;

  void onFetchCurrencies() async {
    try {
      final currencies = await currencyRepository.getCurrencies();
      currenciesList = currencies;
      emit(CurrencyStateLoaded(currencies: currencies));
    } catch (error) {
      emit(
        CurrencyStateError(
          error: Exception(error),
        ),
      );
      rethrow;
    }
  }

  Future<double> fetchConversionRate(ConvertCurrencyDto dto) {
    return currencyRepository.convertCurrency(dto);
  }
}

// currency_converter_test.dart

import 'package:currency_converter_app/blocs/currency/currency_bloc.dart';
import 'package:currency_converter_app/models/currency.dart';
import 'package:currency_converter_app/network_config/network.dart';
import 'package:currency_converter_app/repositories/currency_imp_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Test mocks
class MockCurrencyConverterBloc extends Mock implements CurrencyBloc {}

// Tests
void main() {
  group('Currency converter tests', () {
    // Initialize test objects
    CurrencyImpRepository currencyConverter = CurrencyImpRepository(
      remoteDataSource: RemoteCurrency(),
    );

    late MockCurrencyConverterBloc mockBloc;
    late Currency currencyConverterModel;

    setUp(() {
      // Initialize mocks
      mockBloc = MockCurrencyConverterBloc();
      currencyConverterModel = const Currency(
          symbol: "\$",
          name: "US Dollar",
          symbolNative: "\$",
          decimalDigits: 2,
          rounding: 0,
          code: "USD",
          namePlural: "US dollars",
          type: "fiat");
    });

    test('fetchCurrencies returns a list of currencies', () async {
      // Mocks success
      when(mockBloc.stream).thenAnswer((_) => Stream.fromIterable([
            CurrencyStateLoaded(currencies: [currencyConverterModel])
          ]));

      // Act
      await currencyConverter.getCurrencies();

      // Assert
      expect(mockBloc.state, isA<CurrencyStateLoaded>());
    });

    test('fetchCurrencies fails', () async {
      // Mocks errors
      when(mockBloc.stream).thenAnswer((_) => Stream.fromIterable([
            CurrencyStateError(error: Exception('Failed to fetch currencies'))
          ]));

      // Act
      await currencyConverter.getCurrencies();

      // Assert
      expect(mockBloc.state, isA<CurrencyStateError>());
    });
  });
}

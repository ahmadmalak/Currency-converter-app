import '../models/convert_currency_dto.dart';
import '../models/currency.dart';

abstract class CurrencyRepo {
  Future<double> convertCurrency(ConvertCurrencyDto dto);

  Future<void> saveCurrencyRate(SaveConvertCurrencyDto dto);

  Future<List<SaveConvertCurrencyDto>?> getSavedCurrencyRate();

  Future<List<Currency>> getCurrencies();
}

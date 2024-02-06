import 'dart:convert';

import 'package:currency_converter_app/network_config/network.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/convert_currency_dto.dart';
import '../models/currency.dart';
import 'currency_repo.dart';

@Injectable(as: CurrencyRepo)
class CurrencyImpRepository extends CurrencyRepo {
  final _storageKey = "kListOfTrans";
  final RemoteCurrency remoteDataSource;

  CurrencyImpRepository({
    required this.remoteDataSource,
  });

  @override
  Future<double> convertCurrency(ConvertCurrencyDto dto) async {
    final rate = await remoteDataSource.fetchRate(
      dto.fromCurrency.code,
      dto.toCurrency.code,
    );
    await saveCurrencyRate(SaveConvertCurrencyDto(
      convertCurrencyDto: dto,
      rate: rate,
    ));
    return rate;
  }

  @override
  Future<List<Currency>> getCurrencies() async {
    return remoteDataSource.fetchCurrencies();
  }

  @override
  Future<void> saveCurrencyRate(SaveConvertCurrencyDto dto) async {
    final prefs = await SharedPreferences.getInstance();
    final oldData = await getSavedCurrencyRate();
    if (oldData == null) {
      ///if no data just add the new one here!
      await prefs.setStringList(_storageKey, [jsonEncode(dto.toMap())]);
      return;
    }

    ///save the new one first then the add the old one!
    await prefs.setStringList(_storageKey, [
      jsonEncode(dto.toMap()),
      jsonEncode(oldData.first.toMap()),
    ]);
  }

  @override
  Future<List<SaveConvertCurrencyDto>?> getSavedCurrencyRate() async {
    final prefs = await SharedPreferences.getInstance();
    final res = prefs.getStringList(_storageKey);
    if (res == null) return null;
    return res
        .map((e) => SaveConvertCurrencyDto.fromMap(jsonDecode(e.toString())))
        .toList();
  }
}

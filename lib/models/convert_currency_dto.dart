import 'package:currency_converter_app/models/currency.dart';

class ConvertCurrencyDto {
  final Currency fromCurrency;
  final Currency toCurrency;
  final double amount;

  const ConvertCurrencyDto({
    required this.fromCurrency,
    required this.toCurrency,
    required this.amount,
  });

  Map<String, dynamic> toMap() {
    return {
      'fromCurrency': fromCurrency.toMap(),
      'toCurrency': toCurrency.toMap(),
      'amount': amount,
    };
  }

  factory ConvertCurrencyDto.fromMap(Map<String, dynamic> map) {
    return ConvertCurrencyDto(
      fromCurrency: Currency.fromMap(map['fromCurrency']),
      toCurrency: Currency.fromMap(map['toCurrency']),
      amount: map['amount'] as double,
    );
  }
}

class SaveConvertCurrencyDto {
  final double rate;
  final ConvertCurrencyDto convertCurrencyDto;

//<editor-fold desc="Data Methods">
  const SaveConvertCurrencyDto({
    required this.rate,
    required this.convertCurrencyDto,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SaveConvertCurrencyDto &&
          runtimeType == other.runtimeType &&
          rate == other.rate &&
          convertCurrencyDto == other.convertCurrencyDto);

  @override
  int get hashCode => rate.hashCode ^ convertCurrencyDto.hashCode;

  @override
  String toString() {
    return 'SaveConvertCurrencyDto{ rate: $rate, convertCurrencyDto: $convertCurrencyDto,}';
  }

  SaveConvertCurrencyDto copyWith({
    double? rate,
    ConvertCurrencyDto? convertCurrencyDto,
  }) {
    return SaveConvertCurrencyDto(
      rate: rate ?? this.rate,
      convertCurrencyDto: convertCurrencyDto ?? this.convertCurrencyDto,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'rate': rate,
      'convertCurrencyDto': convertCurrencyDto.toMap(),
    };
  }

  factory SaveConvertCurrencyDto.fromMap(Map<String, dynamic> map) {
    return SaveConvertCurrencyDto(
      rate: map['rate'] as double,
      convertCurrencyDto: ConvertCurrencyDto.fromMap(map['convertCurrencyDto']),
    );
  }

}

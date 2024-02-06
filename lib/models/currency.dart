class Currency {
  final String symbol;
  final String name;
  final String symbolNative;
  final int decimalDigits;
  final int rounding;
  final String code;
  final String namePlural;
  final String type;

  const Currency({
    required this.symbol,
    required this.name,
    required this.symbolNative,
    required this.decimalDigits,
    required this.rounding,
    required this.code,
    required this.namePlural,
    required this.type,
  });

  String get flagUrl =>
      "https://flagcdn.com/16x12/${code.toLowerCase().substring(0, 2)}.png";

  Currency.usd()
      : symbol = "\$",
        name = "US Dollar",
        symbolNative = "\$",
        decimalDigits = 2,
        rounding = 0,
        code = "USD",
        namePlural = "US dollars",
        type = "fiat";

  Currency.euro()
      : symbol = "€",
        name = "Euro",
        symbolNative = "€",
        decimalDigits = 2,
        rounding = 0,
        code = "EUR",
        namePlural = "Euros",
        type = "fiat";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Currency &&
          runtimeType == other.runtimeType &&
          symbol == other.symbol &&
          name == other.name &&
          symbolNative == other.symbolNative &&
          decimalDigits == other.decimalDigits &&
          rounding == other.rounding &&
          code == other.code &&
          namePlural == other.namePlural &&
          type == other.type);

  @override
  int get hashCode =>
      symbol.hashCode ^
      name.hashCode ^
      symbolNative.hashCode ^
      decimalDigits.hashCode ^
      rounding.hashCode ^
      code.hashCode ^
      namePlural.hashCode ^
      type.hashCode;

  @override
  String toString() {
    return 'Currency{ symbol: $symbol, name: $name, symbolNative: $symbolNative, decimalDigits: $decimalDigits, rounding: $rounding, code: $code, namePlural: $namePlural, type: $type,}';
  }

  Currency copyWith({
    String? symbol,
    String? name,
    String? symbolNative,
    int? decimalDigits,
    int? rounding,
    String? code,
    String? namePlural,
    String? type,
  }) {
    return Currency(
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      symbolNative: symbolNative ?? this.symbolNative,
      decimalDigits: decimalDigits ?? this.decimalDigits,
      rounding: rounding ?? this.rounding,
      code: code ?? this.code,
      namePlural: namePlural ?? this.namePlural,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'symbol': symbol,
      'name': name,
      'symbol_native': symbolNative,
      'decimal_digits': decimalDigits,
      'rounding': rounding,
      'code': code,
      'name_plural': namePlural,
      'type': type,
    };
  }

  factory Currency.fromMap(Map<String, dynamic> map) {
    return Currency(
      symbol: map['symbol'] as String,
      name: map['name'] as String,
      symbolNative: map['symbol_native'] as String,
      decimalDigits: map['decimal_digits'] as int,
      rounding: map['rounding'] as int,
      code: map['code'] as String,
      namePlural: map['name_plural'] as String,
      type: map['type'] as String,
    );
  }

//</editor-fold>
}

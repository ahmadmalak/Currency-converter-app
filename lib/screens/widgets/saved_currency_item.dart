import 'package:flutter/material.dart';

import '../../models/convert_currency_dto.dart';

class SavedCurrencyItem extends StatelessWidget {
  final SaveConvertCurrencyDto dto;

  const SavedCurrencyItem({
    super.key,
    required this.dto,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "${dto.convertCurrencyDto.fromCurrency.code.toString()} To ${dto.convertCurrencyDto.toCurrency.code.toString()}",
      ),
      subtitle:
          Text("Amount ${dto.convertCurrencyDto.amount} Rate ${dto.rate}"),
    );
  }
}

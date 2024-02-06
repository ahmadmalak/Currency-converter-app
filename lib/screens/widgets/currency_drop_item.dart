import 'package:cached_network_image/cached_network_image.dart';
import 'package:currency_converter_app/models/currency.dart';
import 'package:flutter/material.dart';

class CurrencyDropItem extends StatelessWidget {
  final Currency currency;

  const CurrencyDropItem({super.key, required this.currency});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImage(
          imageUrl: currency.flagUrl,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(currency.code),
      ],
    );
  }
}

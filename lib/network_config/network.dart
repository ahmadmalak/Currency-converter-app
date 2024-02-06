import 'dart:convert';

import 'package:currency_converter_app/models/currency.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
class RemoteCurrency {
  static const String _endPoint = "https://api.freecurrencyapi.com/v1";
  static const String _apiKey =
      'fca_live_5OtC7w4YvQRVp9JT8oldz02yp6sOLsc8Kt3qr7az';

  /// Fetches the exchange rates from the API
  /// and returns a [Future] of the response body
  Future<List<Currency>> fetchCurrencies() async {
    final prefs = await SharedPreferences.getInstance();
    final localData = prefs.getString("Currencies");
    if (localData != null) {
      final dataAsMap = jsonDecode(localData) as List;
      return dataAsMap.map((e) => Currency.fromMap(e)).toList();
    }
    //  fetch the rates from the API
    final response = await http
        .get(Uri.parse("$_endPoint/currencies?apikey=$_apiKey&currencies="));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'] as Map;
      await prefs.setString("Currencies", jsonEncode(data.values.toList()));
      return data.values.map((e) => Currency.fromMap(e)).toList();
    } else {
      throw Exception("Failed to load rates");
    }
  }

  Future<double> fetchRate(
    String from,
    String to,
  ) async {
    // fetch the rates from the API
    // base_currency means from currency
    // currencies means to currency
    final response = await http.get(
      Uri.parse(
        "$_endPoint/latest?apikey=$_apiKey&currencies=$to&base_currency=$from",
      ),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'] as Map;
      return double.parse(data.values.first.toString());
    } else {
      throw Exception("Failed to load rates");
    }
  }
}

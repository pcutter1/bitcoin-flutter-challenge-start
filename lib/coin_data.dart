import 'dart:convert';
import 'package:bitcoin_ticker/api_key.dart';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';


class CoinData {

  String apiKey = APIKey().getAPIKey();

  Future<dynamic> getCoinData(String currency) async {
    NetworkHelper networkHelper = NetworkHelper('$coinAPIURL/BTC/$currency?apikey=$apiKey');
    var coinData = await networkHelper.getData();
    return coinData;
  }
}

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);

    } else {
      print(response.statusCode);
    }
  }

}
//TODO: Add your imports here.
import 'package:http/http.dart' as http;
import 'dart:convert';

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

const bitcoinAverageURL =
    'https://apiv2.bitcoinaverage.com/indices/global/ticker';

class CoinData {
  //TODO: Create your getCoinData() method here.
  Future<double> getCoinData() async {
    double coinPrice = 0;
    http.Response coinInfoResponse =
        await http.get(bitcoinAverageURL + '/BTCUSD');
    if (coinInfoResponse.statusCode == 200) {
      var coinInfo = jsonDecode(coinInfoResponse.body);
      coinPrice = coinInfo['last'];
    } else {
      print('coinInfoResponse.statusCode: ');
      print(coinInfoResponse.statusCode);
      throw 'Error in getCoinData()';
    }
    return coinPrice;
  }
}

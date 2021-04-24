import 'dart:convert';
import 'package:http/http.dart' as http;

class AddressApi {
  Future<Map> get({int cep}) async {
    Uri url = Uri.parse("https://viacep.com.br/ws/$cep/json/");

    http.Response response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    print("Address Api -> Response: ${response.body}");

    if (response.statusCode != 200) {
      print(response.statusCode);
      throw Exception(response.statusCode);
    }

    Map result = json.decode(utf8.decode(response.bodyBytes));

    return result;
  }
}

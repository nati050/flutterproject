import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projectfluttar/models/LaureateModel.dart';
import 'package:projectfluttar/models/countrymodel1.dart';





class CountryService {






  Future<countrysModel> getCountris() async {
    final response = await http.get(Uri.parse('http://api.nobelprize.org/v1/country.json'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      print(jsonData);
      return countrysModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load user');
    }
  }



  Future<LaureateList> getLaureate(String bornCity) async {
    final response = await http.get(Uri.parse('http://api.nobelprize.org/v1/laureate.json?bornCity=${bornCity}&gender=All'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      print(jsonData);
      return LaureateList.fromJson(jsonData);
    } else {
      throw Exception('Failed to load user');
    }
  }
}














// Future<void> fetchData() async {
//   final url = 'https://api.example.com/data';
//   final headers = {
//     'Content-Type': 'application/json',
//     'Authorization': 'Bearer YOUR_AUTH_TOKEN',
//   };

//   final response = await http.get(Uri.parse(url), headers: headers);

//   if (response.statusCode == 200) {
//     // Process the response data
//     print(response.body);
//   } else {
//     // Handle error
//     print('Request failed with status: ${response.statusCode}');
//   }
// }

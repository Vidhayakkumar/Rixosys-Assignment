import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rixosys/model/list_model.dart';

class ApiService {
  Future<ListModel> getListData() async {
    const String listApi ='https://api.rawg.io/api/games?key=90710a402f4a49cabc76e0ca2f3012db';

    try {
      final response = await http.get(Uri.parse(listApi));

      if (response.statusCode == 200) {
        final listData = jsonDecode(response.body);
        return ListModel.fromJson(listData);
      } else {
        throw Exception("Failed to load data. Status code: ${response.statusCode}");
      }
    } catch (err) {
      throw Exception("Error fetching list data: $err");
    }
  }
}

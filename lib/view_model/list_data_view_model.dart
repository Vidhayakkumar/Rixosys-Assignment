import 'package:flutter/cupertino.dart';
import 'package:rixosys/apiServices/api_service.dart';
import 'package:rixosys/model/list_model.dart';

class ListDataViewModel with ChangeNotifier {
  final ApiService _apiService = ApiService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  ListModel? _listModel;
  ListModel? get listData => _listModel;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> getListData() async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      _listModel = await _apiService.getListData();
      print("Data fetched: $_listModel");

    } catch (err) {
      _errorMessage = err.toString();
      print("Error: $_errorMessage");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

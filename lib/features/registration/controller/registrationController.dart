import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:myapp/features/registration/model/stateModel.dart';
import 'package:myapp/features/registration/repository/registrationRepository.dart';
import 'package:myapp/core/utils/shared/component/widgets/customToast.dart';

class RegistrationController extends ChangeNotifier {
  final _api = RegistrationRepository();
  bool isLoading = false;

  //state api
  var stateModel = StateModel();
  var stateList = <StateModel>[];
  var selectedStateId = '';
  var selectedStateName = '';
  Future<void> stateApi() async {
    try {
      isLoading = true;
      notifyListeners();
      final response = await _api.stateApi();
      CustomToast.showCustomErrorToast(message: "data :${response['status']}");
      if (response != null && response['status'] == 200) {
        final List<dynamic> responseData = response['data'];
        CustomToast.showCustomToast(message: "ok ${response['data']}");
        stateList =
            responseData.map((json) => StateModel.fromJson(json)).toList();
        notifyListeners();
      } else if (response != null && response['status'] == 400) {
        stateModel = StateModel.fromJson(response['data']);
        notifyListeners();
      } else {
        CustomToast.showCustomToast(message: "Unexpected error occurred");
        notifyListeners();
      }
    } catch (e) {
      CustomToast.showCustomErrorToast(message: "message :$e ");
      if (kDebugMode) {
        print("Error $e");
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void setSelectedState(String? id, String? name) {
    selectedStateId = id ?? '';
    selectedStateName = name ?? '';
    notifyListeners();
  }
}

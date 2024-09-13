import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/core/utils/shared/component/widgets/customToast.dart';
import 'package:myapp/features/login/model/LoginModel.dart';
import 'package:myapp/features/login/repository/LoginRepository.dart';

class LoginController extends ChangeNotifier {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  bool passwordVisible = true;

  void toggle() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  final _api = LoginRepository();
  var loginModel = LoginModel();
  Future<void> userLoginApi() async {
    try {
      isLoading = true;
      notifyListeners();
      var data = {
        "username": email.text.trim(),
        "password": password.text.trim()
      };
      final response = await _api.loginApi(data);

      if (response != null && response['status'] == 200) {
        loginModel = LoginModel.fromJson(response['data']);
        CustomToast.showCustomToast(message: "Login successful");
        notifyListeners();
      } else if (response != null && response['status'] == 400) {
        loginModel = LoginModel.fromJson(response['data']);
        CustomToast.showCustomToast(
            message: "Login failed: ${loginModel.message ?? ''}");
        notifyListeners();
      } else {
        CustomToast.showCustomToast(message: "Unexpected error occurred");
        notifyListeners();
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error $e");
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

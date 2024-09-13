import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  Future<bool?> showToastMsg(String message) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER_LEFT,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: 16.0,
      webBgColor: "linear-gradient(to right, #000000, #434343)",
      webPosition: "center",
    );
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
        showToastMsg("Login successful");
      } else if (response != null && response['status'] == 400) {
        loginModel = LoginModel.fromJson(response['data']);
        showToastMsg("Login failed: ${loginModel.message ?? ''}");
      } else {
        showToastMsg("Unexpected error occurred");
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

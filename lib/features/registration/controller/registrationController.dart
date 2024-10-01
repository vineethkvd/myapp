import 'package:flutter/foundation.dart';
import 'package:myapp/features/registration/model/districtModel.dart';
import 'package:myapp/features/registration/model/stateModel.dart';
import 'package:myapp/features/registration/repository/registrationRepository.dart';
import 'package:myapp/core/utils/shared/component/widgets/customToast.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

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
      if (response != null && response['status'] == 200) {
        final List<dynamic> responseData = response['data'];
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
      if (kDebugMode) {
        print("Error $e");
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  //district api
  var districtModel = DistrictModel();
  var districtList = <DistrictModel>[];
  var selectedDistrictId = '';
  var selectedDistrictName = '';
  Future<void> districtApi({required String stateId}) async {
    try {
      isLoading = true;
      notifyListeners();
      final response = await _api.districtApi(stateId: stateId);
      if (response != null && response['status'] == 200) {
        final List<dynamic> responseData = response['data'];
        districtList =
            responseData.map((json) => DistrictModel.fromJson(json)).toList();
        notifyListeners();
      } else if (response != null && response['status'] == 400) {
        districtModel = DistrictModel.fromJson(response['data']);
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

  void selectDistrict({required String stateId}) {
    districtApi(stateId: stateId).then(
      (value) {
        selectedDistrictId = '';
      },
    );
    notifyListeners();
  }
  XFile? image;
  Future<void> uploadImage() async {
    try {
    if (!kIsWeb) {
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        await Permission.storage.request();
      }

      if (await Permission.storage.request().isGranted) {
        final ImagePicker picker = ImagePicker();
        final XFile? image =
            await picker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          this.image = image;
          notifyListeners();
        }
      } else {
        CustomToast.showCustomToast(message: 'Permission denied');
      }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error uploading image: $e');
      }
      CustomToast.showCustomToast(message: 'Error uploading image');
    }
  }

}

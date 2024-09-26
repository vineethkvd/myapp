import 'package:myapp/core/helpers/network/api_endpoints.dart';
import 'package:myapp/core/helpers/network/network_api_services.dart';

class RegistrationRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> stateApi() async {
    dynamic response = await _apiService.getApi(ApiEndPoints.state);
    return response;
  }

  Future<dynamic> districtApi({required String stateId}) async {
    dynamic response =
        await _apiService.getApi(ApiEndPoints.district + stateId);
    return response;
  }
}

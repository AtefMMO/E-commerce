import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/model/api/api_constants.dart';
import 'package:ecommerce/data/model/request/register_request.dart';
import 'package:ecommerce/domain/failures.dart';
import 'package:http/http.dart' as http;

import '../request/login_request.dart';
import '../response/login_response_dto.dart';
import '../response/register_resoponse_dto.dart';

class ApiManager {
  ApiManager._();
  static ApiManager? _instance;
  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  Future<Either<Failures, RegisterResponeDto>> register(String name,
      String email, String password, String rePassword, String phone) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.registerApi);
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var registerBody = RegisterRequest(
        name: name,
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone,
      );
      var response = await http.post(url, body: registerBody.toJson());
      var registerResponse =
          RegisterResponeDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(registerResponse);
      } else {
        return Left(ServerError(
            errorMessage: registerResponse.error != null
                ? registerResponse!.error!.msg
                : registerResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'please check Internet Connection'));
    }
  }

  Future<Either<Failures, LoginResponseDto>> login(
      String email, String password) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.loginApi);
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network.
      var loginBody = LoginRequest(email: email, password: password);
      var respone = await http.post(url, body: loginBody.toJson());
      var LoginResponse = LoginResponseDto.fromJson(jsonDecode(respone.body));
      if (respone.statusCode >= 200 && respone.statusCode < 300) {
        return Right(LoginResponse);
      } else {
        return Left(ServerError(errorMessage: LoginResponse.message ?? ""));
      }
    } else {
      return left(
          NetworkError(errorMessage: 'please check ur internet connection'));
    }
  }
}

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

import '../Utils/api_constants.dart';
import '../src/commonWidgets/snak_bar_widget.dart';

class DioServices {
  static final DioServices _dioServices = DioServices._internal();

  factory DioServices() {
    return _dioServices;
  }

  DioServices._internal() {
    dio = Dio(BaseOptions(
        baseUrl: Apis.baseUrl,
        connectTimeout: const Duration(milliseconds: 6000)));
    dio.interceptors.add(RetryInterceptor(
      dio: dio,
      logPrint: print,
      retries: 3,
    ));
  }

  late Dio dio;
  var token = "195|5PxDxxPjHQ8GwVGUYhSKCAR1jNYWHYqPHr2H5pqq";

  Future<Response> post(String endPoint,
      {dynamic body, bool addAuthHeader = true}) async {
    // String userToken = await HiveLocalStorage.readHiveValue<String>(
    //       boxName: TextUtils.userTokenBox,
    //       key: TextUtils.userTokenKey,
    //     ) ??
    //     '';
    try {
      var headers = {
        "Accept": "application/json",
        'Authorization': 'Bearer ${Apis.accessToken}',
      };
      log("Start ===========================");

      log("${dio.options.baseUrl}$endPoint ");
      var response = await dio.post(endPoint,
          data: body, options: Options(headers: headers));
      log(response.toString());
      log("End ===========================");
      return response;
    } on SocketException catch (e) {
      log('Timeout');
      showErrorSnackBarMessage(
        message: "No internet connection",
      );
      // Utils.showToast('No internet connection');
      throw ('No internet');
    } on DioError catch (e) {
      bool noInternet = e.error is SocketException;
      log("No internet==>$noInternet");
      log(e.toString());
      if (!noInternet && e.response!.statusCode == 401) {
        log(e.toString());

        throw ('User not authorised. Please login again');
      }
      if (noInternet) {
        log('Timeout');
        throw ('No internet connection');
      }
      if (e.response?.data != null) {
        log(e.response!.data.toString());
        throw (e.response!.data);
      }
      return e.response!;
    }
  }

  Future<Response> get(String endPoint,
      {dynamic body, bool addAuthHeader = true}) async {
    // String userToken = await HiveLocalStorage.readHiveValue<String>(
    //       boxName: TextUtils.userTokenBox,
    //       key: TextUtils.userTokenKey,
    //     ) ??
    //     '';
    try {
      var headers = {
        "Accept": "application/json",
        'Authorization': 'Bearer ${Apis.accessToken}',
        // if (addAuthHeader) "Authorization": token
        //  "Bearer ${Provider.of<UserModelProvider>(RoutesUtils.cNavigatorState.currentState!.context, listen: false).userModel.token}"
      };
      log("Start ===========================");
      //log(headers.toString());
      log("${dio.options.baseUrl}$endPoint ");
      var response = await dio.get(endPoint,
          data: body, options: Options(headers: headers));
      log(response.toString());
      log("End ===========================");
      return response;
    } on SocketException catch (e) {
      log('Timeout');
      showErrorSnackBarMessage(
        message: "No internet connection",
      );
      // Utils.showToast('No internet connection');
      throw ('No internet');
    } on DioError catch (e) {
      bool noInternet = e.error is SocketException;
      log("No internet==>$noInternet");
      log(e.toString());
      if (!noInternet && e.response!.statusCode == 401) {
        log(e.toString());

        throw ('User not authorised. Please login again');
      }
      if (noInternet) {
        log('Timeout');
        throw ('No internet connection');
      }
      if (e.response?.data != null) {
        log(e.response!.data.toString());
        throw (e.response!.data);
      }
      return e.response!;
    }
  }
}

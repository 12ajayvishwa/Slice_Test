import 'dart:async';
import 'dart:convert';
import 'package:slice/core/constants/app_export.dart';
import 'package:slice/utils/notification_service.dart';
import 'package:slice/main.dart';
import '../core/apiClient/api_client.dart';
import '../core/apiClient/http_response.dart';
import '../core/constants/api_network.dart';
import '../utils/internet_connectivity_controller.dart';
import '../core/constants/session_manager.dart';
import '../routes/app_routes.dart';
import '../widgets/custom_toast.dart';

class AuthController extends GetxController {
  NetworkHttpServices api = NetworkHttpServices();
  final rxRequestStatus = EventStatus.success.obs;
  TextEditingController otpController = TextEditingController();

  bool isResendAgain = false;
  // ignore: unused_field
  late Timer _timer;
  RxInt start = 30.obs;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        // ignore: unrelated_type_equality_checks
        if (start == 0) {
          timer.cancel();
        } else {
          start--;
        }
      },
    );
  }

  //Text Controllers
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isPasswordVisible = true.obs;
  var isAuthenticated = true.obs;

// Password visible/invisible function
  togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

//Login Function
  login() async {
    var payload = {
      "email": emailController.value.text,
      "password": passwordController.value.text,
    };
    rxRequestStatus.value = EventStatus.loading;
    try {
      var value = await api.post(ApiNetwork.login, payload, false);
      if (value['success'] == true) {
        Get.toNamed(AppRoutes.LOGIN_VERIFICATION,
            arguments: emailController.value.text);
        showSuccessToast(toast, value["message"]);

        rxRequestStatus.value = EventStatus.success;
      } else {
        showErrorToast(toast, value["message"]);
        rxRequestStatus.value = EventStatus.error;
      }
    } catch (e) {
      showErrorToast(toast, e.toString());

      rxRequestStatus.value = EventStatus.error;
    }
  }

//SingUp Function
  signUp() async {
    var payload = {
      "first_name": firstNameController.value.text,
      "last_name": lastNameController.value.text,
      "email": emailController.value.text,
      "phoneNumber": phoneController.value.text,
      "password": "123456",
      "country_id": "1"
    };
    rxRequestStatus.value = EventStatus.loading;
    try {
      var value = await api.post(ApiNetwork.signUp, payload, false);

      if (value['status'] == 200) {
        Get.offAllNamed(AppRoutes.LOGIN);

        showSuccessToast(toast, value["message"]);
        rxRequestStatus.value = EventStatus.success;
      } else {
        showErrorToast(toast, value["message"]);
        rxRequestStatus.value = EventStatus.error;
      }
    } catch (e) {
      showErrorToast(toast, e.toString());
      rxRequestStatus.value = EventStatus.error;
    }
  }

//opt verification function
  otpVerification(
    String email,
  ) async {
    var payload = {
      "email": email,
      "otp": otpController.value.text.toString(),
      "deviceToken": deviceToken.toString(),
      "deviceType": deviceType,
      "deviceName": deviceName,
      "IpAdderss": ipAddress.toString(),
      "latitude": currentPosition!.latitude.toString(),
      "longitude": currentPosition!.longitude.toString(),
    };
    rxRequestStatus.value = EventStatus.loading;
    try {
      var value = await api.post(ApiNetwork.otpVerification, payload, false);

      if (value['status'] == 200) {
        await SessionManager.setToken(value['result']['accessToken']);
        await SessionManager.setUserName(value['result']['first_name']);
        await SessionManager.setEmail(value['result']['email']);
        Get.offAllNamed(AppRoutes.DASHBOARD);
        showSuccessToast(toast, value["message"]);
        rxRequestStatus.value = EventStatus.success;
      } else {
        showErrorToast(toast, value["message"]);
        rxRequestStatus.value = EventStatus.error;
      }
    } catch (e) {
      showErrorToast(toast, e.toString());
      rxRequestStatus.value = EventStatus.error;
    }
  }

  logout() async {
    rxRequestStatus.value = EventStatus.loading;

    try {
      final response = await api.get(ApiNetwork.logout);
      if (response["success"] == true) {
        SessionManager.removeToken();
        rxRequestStatus.value = EventStatus.success;
        Get.offAllNamed(AppRoutes.LOGIN);
      } else if (response["status"] == 401) {
        SessionManager.removeToken();
        rxRequestStatus.value = EventStatus.success;
        Get.offAllNamed(AppRoutes.LOGIN);
      }
    } catch (e) {
      rxRequestStatus.value = EventStatus.error;
      print(e);
    }
  }

  dataClear() {
    firstNameController.clear();
    lastNameController.clear();
    phoneController.clear();
    emailController.clear();
    passwordController.clear();
    otpController.clear();
  }
}

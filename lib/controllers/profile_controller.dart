import 'dart:convert';

import 'package:geocoding/geocoding.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:slice/core/apiClient/http_response.dart';
import 'package:slice/core/constants/api_network.dart';
import 'package:slice/core/constants/app_export.dart';
import 'package:slice/models/user_activity_model.dart';
import 'package:slice/routes/app_routes.dart';
import 'package:slice/utils/notification_service.dart';
import 'package:slice/widgets/custom_toast.dart';

import '../core/apiClient/api_client.dart';
import '../core/constants/session_manager.dart';
import '../presentation/profile/login_activity.dart';
import '../widgets/custom_alert_dialog.dart';

String? longTime;


class ProfileController extends GetxController {
  NetworkHttpServices api = NetworkHttpServices();
  final rxRequestStatus = EventStatus.success.obs;
  UserActivityModel? userData;
  RxString address = ''.obs;

  allDeviceLogout(String accessId) async {
    rxRequestStatus.value = EventStatus.loading;
    var payload = {"access_id": accessId};
    try {
      final response =
          await api.post(ApiNetwork.logoutDevice, jsonEncode(payload), true);
      if (response["success"] == true) {
        rxRequestStatus.value = EventStatus.success;
        Get.offAllNamed(AppRoutes.LOGIN);
        SessionManager.removeToken();
      } else if (response["status"] == 401) {
        rxRequestStatus.value = EventStatus.success;
        Get.offAllNamed(AppRoutes.LOGIN);
        SessionManager.removeToken();
      }
    } catch (e) {
      rxRequestStatus.value = EventStatus.error;
      print(e);
    }
  }

  getCurrentUser() async {
    rxRequestStatus.value = EventStatus.loading;
    try {
      final response = await api.get(ApiNetwork.getCurrentUser);
      if (response["status"] == 200) {
        var matchingUser = response['result'].firstWhere(
          (e) => e["deviceToken"] == deviceToken,
          orElse: () => null,
        );

        if (matchingUser != null) {
          userData = UserActivityModel.fromJson(matchingUser);
        }
        rxRequestStatus.value = EventStatus.success;
      } else if (response["status"] == 401) {
        SessionManager.removeToken();
        Get.dialog(
          PlaceholderDialog(
            title: "unauthorized",
            message: "your login session expired",
            icon: Icons.sentiment_dissatisfied,
            button: "Ok",
            onPressed: () {
              Get.offAllNamed(AppRoutes.LOGIN);
            },
          ),
          barrierDismissible: false,
        );
        rxRequestStatus.value = EventStatus.success;
      }
    } catch (e) {
      rxRequestStatus.value = EventStatus.error;
      print(e);
    }
  }

  getAddressFromLatLng(double latitude, double longitude) async {
    var status = await Permission.location.request();
    if (status == PermissionStatus.granted) {
      await placemarkFromCoordinates(latitude, longitude)
          .then((List<Placemark> placemarks) {
        Placemark place = placemarks[0];
        address.value = "${place.locality}";
      }).catchError((e) {
        showErrorToast(toast, e.toString());
      });
    } else {
      // Handle the case where the user denies permission
      showWarrningToast(toast, "Permission denied");
    }
  }
}

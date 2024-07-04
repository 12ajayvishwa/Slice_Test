import 'package:slice/core/apiClient/http_response.dart';
import 'package:slice/core/constants/app_export.dart';

import '../core/apiClient/api_client.dart';
import '../core/constants/api_network.dart';
import '../core/constants/session_manager.dart';
import '../models/order_model.dart';
import '../routes/app_routes.dart';
import '../widgets/custom_alert_dialog.dart';
import '../widgets/custom_toast.dart';

class OrderController extends GetxController {
  NetworkHttpServices api = NetworkHttpServices();
  final rxRequestStatus = EventStatus.success.obs;

  // List<OrderModel> orderList = <OrderModel>[].obs;

  List<OrderModel> buyData = [];
  List<OrderModel> saleData = [];

  getOrders() async {
    rxRequestStatus.value = EventStatus.loading;
    try {
      var value = await api.get(ApiNetwork.order);

      if (value['success'] == true) {
        var buySliceData = value['result']['buy'];
        var sellSliceData = value['result']['sale'];

        buySliceData.forEach((data) {
          buyData.add(OrderModel.fromJson(data));
        });
        sellSliceData.forEach((data) {
          saleData.add(OrderModel.fromJson(data));
        });
        rxRequestStatus.value = EventStatus.success;
      } else if (value["status"] == 401) {
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
      } else {
        showErrorToast(toast, value["message"]);
        rxRequestStatus.value = EventStatus.error;
      }
    } catch (e) {
      showErrorToast(toast, e.toString());

      rxRequestStatus.value = EventStatus.error;
    }
  }
}

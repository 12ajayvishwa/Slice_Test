import 'package:slice/models/order_model.dart';
import 'package:slice/presentation/order/widget/card_widget.dart';
import '../../../core/constants/app_export.dart';

class SaleDataWidget extends StatelessWidget {
  List<OrderModel> saleData;
  SaleDataWidget({super.key, required this.saleData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: saleData.length,
      itemBuilder: (context, index) {
        return CardWidget(orderData: saleData[index]);
      },
    );
  }
}

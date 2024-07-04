import 'package:slice/core/constants/app_export.dart';
import 'package:slice/models/order_model.dart';
import 'package:slice/presentation/order/widget/card_widget.dart';
import 'package:slice/widgets/text_style.dart';

// ignore: must_be_immutable
class BuyOrderWidget extends StatelessWidget {
  List<OrderModel> buyData;
  BuyOrderWidget({super.key, required this.buyData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: buyData.length,
      itemBuilder: (context, index) {
        if (buyData.isEmpty) {
          return Center(
            child: Text(
              "you don't have Buy Data",
              style: AppTextStyles.bodyText,
            ),
          );
        }
        return CardWidget(orderData: buyData[index]);
      },
    );
  }
}

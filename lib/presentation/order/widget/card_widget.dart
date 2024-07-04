import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slice/models/order_model.dart';

import '../../../core/constants/app_export.dart';
import '../../../core/constants/color_constant.dart';
import '../../../widgets/text_style.dart';
import 'package:intl/intl.dart';

class CardWidget extends StatelessWidget {
  OrderModel orderData;
  CardWidget({super.key, required this.orderData});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: AppColors.whiteA700,
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      shape: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            5.r,
          )),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    width: 50.w,
                    height: 50.h,
                    margin: EdgeInsets.symmetric(vertical: 20.h),
                    decoration: BoxDecoration(
                      color: AppColors.kprimary,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: const Center(
                        child: Text("SL", style: AppTextStyles.headline))),
                SizedBox(
                  width: 10.w,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    orderData.tokenName.toString(),
                    style: AppTextStyles.bodyText,
                  ),
                  Text(
                    DateFormat('MMMM dd, yyyy ').format(orderData.date!) +
                        orderData.time.toString(),
                    style: AppTextStyles.smallText,
                  ),
                ]),
              ],
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                width: 140.w,
                child: Text(
                  "Quantity : ${orderData.quantity}",
                  style: AppTextStyles.smallText,
                ),
              ),
              Text(
                "Price : ${NumberFormat('0.####').format(orderData.slicePrice)} / SL",
                style: AppTextStyles.smallText
                    .copyWith(color: Colors.green, fontWeight: FontWeight.w800),
              ),
              Text(
                "Total : ${NumberFormat.simpleCurrency(name: orderData.currency).currencySymbol} ${orderData.price}",
                style: AppTextStyles.smallText,
              ),
              Text(
                "Status : ${orderData.status == "completed" ? "Completed" : "Failed"}",
                style: AppTextStyles.smallText.copyWith(
                    color: orderData.status == "completed"
                        ? Colors.green
                        : Colors.red,
                    fontWeight: FontWeight.w800),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

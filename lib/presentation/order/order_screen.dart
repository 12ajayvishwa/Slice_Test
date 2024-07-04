import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slice/core/constants/app_export.dart';
import 'package:slice/controllers/order_controller.dart';
import 'package:slice/presentation/order/widget/buy_order_widget.dart';
import 'package:slice/presentation/order/widget/sell_order_widget.dart';
import 'package:slice/core/constants/color_constant.dart';
import 'package:slice/widgets/custom_toast.dart';

import '../../core/apiClient/http_response.dart';
import '../../widgets/custom_circular_loader.dart';
import '../../widgets/text_style.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with TickerProviderStateMixin {
  OrderController orderController = Get.put(OrderController());

  static List<Tab> tabs = <Tab>[
    const Tab(
      text: "Buy",
    ),
    const Tab(
      text: 'Sell',
    ),
  ];
  late TabController _tabController;
  int? tabIndex = 0;
  @override
  void initState() {
    toast.init(context);
    orderController.getOrders();
    _tabController = TabController(vsync: this, length: tabs.length);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(10.h),
            child: TabBar(
                indicatorColor: AppColors.kprimary,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 3.h,
                physics: const NeverScrollableScrollPhysics(),
                labelStyle: AppTextStyles.text16BlackBold.copyWith(
                  fontSize: 14.sp,
                ),
                onTap: (value) {
                  print(value);
                  setState(() {
                    tabIndex = value;
                  });
                },
                indicatorPadding: const EdgeInsets.all(0),
                labelColor: AppColors.kprimary,
                unselectedLabelColor: AppColors.gray,
                controller: _tabController,
                tabs: tabs),
          ),
        ),
        body: Obx(() {
          if (orderController.rxRequestStatus.value == EventStatus.loading) {
            return  CustomLoading();
          }
          if (orderController.buyData.isEmpty) {
            return Center(
              child: Text(
                "you don't have Buy/Sale Data",
                style: AppTextStyles.bodyText,
              ),
            );
          }
          return TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                BuyOrderWidget(
                  buyData: orderController.buyData,
                ),
                SaleDataWidget(saleData: orderController.saleData)
              ]);
        }));
  }
}

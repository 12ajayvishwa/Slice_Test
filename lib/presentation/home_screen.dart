// ignore_for_file: avoid_unnecessary_containers
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slice/controllers/profile_controller.dart';
import 'package:slice/core/constants/app_export.dart';
import 'package:slice/core/constants/session_manager.dart';
import 'package:slice/core/constants/color_constant.dart';
import 'package:slice/widgets/custom_toast.dart';
import 'package:slice/widgets/text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProfileController profileController = Get.put(ProfileController());
  @override
  void initState() {
    profileController.getCurrentUser();
  
    toast.init(context);
    super.initState();
  }

  List<Widget> items = [
    Container(
      height: 200.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.kprimary,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
          child: Text(
        "Image",
        style: AppTextStyles.headline.copyWith(color: AppColors.whiteA700),
      )),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: Container(
            child: Text(
          'Hi, ${SessionManager.getUserName()} 🙂',
        )),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: AppColors.whiteA700,
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.black900.withOpacity(0.2),
                          blurRadius: 5)
                    ]),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      operationWidget(Icons.wallet, "Add Funds"),
                      operationWidget(Icons.currency_bitcoin, "Buy Slice"),
                      operationWidget(Icons.add, "Add Price Alert")
                    ]),
              ),
            ),
            CarouselSlider(
                items: items,
                options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.2.h,
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    //enableInfiniteScroll: items.length > 1,
                    scrollPhysics: const AlwaysScrollableScrollPhysics()
                    // items.length > 1
                    //     ? null
                    //     : const NeverScrollableScrollPhysics(),
                    )),
            SizedBox(
              height: 30.h,
            ),
            const Text(
              "Crypto Made Easy",
              style: AppTextStyles.headline,
            ),
            const Text(
              "Crypto concept simplified with slice learn",
              style: AppTextStyles.smallText,
            ),
            SizedBox(
              height: 15.h,
            ),
            CarouselSlider(
                items: items,
                options: CarouselOptions(
                    autoPlay: items.length > 1,
                    aspectRatio: 2.h,
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    //enableInfiniteScroll: items.length > 1,
                    scrollPhysics: const AlwaysScrollableScrollPhysics()
                    // items.length > 1
                    //     ? null
                    //     : const NeverScrollableScrollPhysics(),
                    )),
          ],
        ),
      ),
    );
  }

  operationWidget(IconData icon, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r),
            color: AppColors.kprimary,
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          value,
          style: AppTextStyles.bodyText,
        )
      ]),
    );
  }
}

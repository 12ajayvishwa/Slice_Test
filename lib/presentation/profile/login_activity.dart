import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slice/controllers/profile_controller.dart';
import 'package:slice/core/apiClient/http_response.dart';
import 'package:slice/core/constants/app_export.dart';
import 'package:slice/main.dart';
import 'package:slice/utils/internet_connectivity_controller.dart';
import 'package:slice/widgets/custom_circular_loader.dart';
import '../../controllers/auth_controller.dart';
import '../../core/constants/color_constant.dart';
import '../../widgets/text_style.dart';

class LoginActivity extends StatefulWidget {
  const LoginActivity({super.key});

  @override
  State<LoginActivity> createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity> {
  AuthController authController = Get.put(AuthController());
  ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    profileController.getAddressFromLatLng(
        double.parse(profileController.userData!.latitude),
        double.parse(profileController.userData!.longitude));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Login Activity",
            style: AppTextStyles.title2,
          ),
        ),
        body: Obx(() {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Card(
                  surfaceTintColor: AppColors.whiteA700,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Image.asset("assets/image/phonelogout.png",
                            height: 300.h, width: 100.w),
                        Expanded(
                            child: Column(
                          children: [
                            SizedBox(
                              width: 220.w,
                              child: Center(
                                child: Text(
                                  "${profileController.userData!.deviceName} : ${profileController.userData!.deviceType.toString().capitalizeFirst} $version",
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.bodyText,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 220.w,
                              child: Center(
                                child: Text(
                                  "IP : ${profileController.userData!.ipAdderss}",
                                  style: AppTextStyles.text16Black400
                                      .copyWith(color: AppColors.gray),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 220.w,
                              child: Center(
                                child: Text(
                                  "Login : ${profileController.userData!.loginTime} : ${profileController.address.value}",
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.text16Black400
                                      .copyWith(color: AppColors.gray),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            authController.rxRequestStatus.value ==
                                    EventStatus.loading
                                ? CustomLoading()
                                : InkWell(
                                    onTap: () {
                                      authController.logout();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.w, vertical: 15.h),
                                      decoration: BoxDecoration(
                                          color: AppColors.kprimary,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(
                                        "Log out",
                                        style: AppTextStyles.text14White400,
                                      ),
                                    ),
                                  )
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: AppColors.kprimary),
                      ),
                    ),
                    onPressed: () {
                      profileController.allDeviceLogout(
                          profileController.userData!.accessId);
                    },
                    child: profileController.rxRequestStatus.value ==
                            EventStatus.loading
                        ? CustomLoading()
                        : const Text(
                            "Logout From All Device",
                            style: TextStyle(color: Colors.black),
                          )),
              ],
            ),
          );
        }));
  }
}

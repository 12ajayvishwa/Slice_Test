import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slice/widgets/custom_circular_loader.dart';
import '../../../core/constants/app_export.dart';
import '../../core/apiClient/http_response.dart';
import '../../core/constants/color_constant.dart';
import '../../widgets/custom_eleveted_button.dart';
import '../../widgets/custom_pin_code_field.dart';
import '../../widgets/custom_toast.dart';
import '../../widgets/text_style.dart';
import '../../controllers/auth_controller.dart';

// ignore_for_file: must_be_immutable
class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final authController = AuthController();
  final email = Get.arguments;

  final _formKey = GlobalKey<FormState>();
  bool isResendAgain = false;
  bool isVerified = false;
  var isRegister = Get.arguments;
  String code = '';
  bool isLoading = false;
  late Timer _timer;
  int _start = 30;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            isLoading = false;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    toast.init(context);
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    //mediaQueryData = MediaQuery.of(context);
    //Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Otp Verification",
            style: AppTextStyles.headline,
          ),
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(
                    left: 30.w,
                    top: 64.h,
                    right: 30.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Opacity(
                          opacity: 0.49,
                          child: SizedBox(
                            child: Text("Please enter the code we send you".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: AppTextStyles.text14BlackMedium),
                          ),
                        ),
                      ),
                      CustomPinCodeTextField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter otp";
                          }
                          return null;
                        },
                        context: context,
                        margin: EdgeInsets.only(
                          left: 18.h,
                          top: 17.w,
                          right: 17.h,
                        ),
                        controller: authController.otpController,
                        onChanged: (value) {},
                      ),
                      SizedBox(height: 30.h),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: Center(
                            child: _start != 0
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Resend OTP After : ",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        _start.toString(),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ],
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Didn't receive the code ?",
                                          style: AppTextStyles.smallText
                                              .copyWith(fontSize: 14)),
                                      const SizedBox(width: 10),
                                      TextButton(
                                          onPressed: () {
                                            setState(() {
                                              _start = 30;

                                              startTimer();
                                              // authController.otpVerification(
                                              //     authController.emailController
                                              //         .value.text);
                                            });
                                          },
                                          child: Text("Resend Again",
                                              style: AppTextStyles.smallText
                                                  .copyWith(
                                                      fontSize: 14,
                                                      color: AppColors.kprimary,
                                                      fontWeight:
                                                          FontWeight.bold)))
                                    ],
                                  )),
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      Obx(() {
                        return authController.rxRequestStatus.value ==
                                EventStatus.loading
                            ? CustomLoading()
                            : CustomElevatedButton(
                                text: "Vetify",
                                buttonTextStyle: AppTextStyles.buttonText,
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    authController.otpVerification(email);
                                  }
                                },
                              );
                      }),
                      SizedBox(height: 5.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

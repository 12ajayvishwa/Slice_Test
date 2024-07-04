import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slice/core/apiClient/http_response.dart';
import '../../routes/app_routes.dart';
import '../../core/constants/color_constant.dart';
import '../../widgets/custom_circular_loader.dart';
import '../../widgets/custom_eleveted_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/custom_toast.dart';
import '../../widgets/text_style.dart';
import '../../controllers/auth_controller.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  AuthController controller = Get.put(AuthController());

  @override
  void initState() {
    toast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: AppColors.whiteA700,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 60.h),
                    child: Text(
                      "App Logo",
                      style: AppTextStyles.headline2,
                    ),
                  ),
                  SizedBox(
                    // height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomTextFormField(
                          labelText: "Username",
                          hintText: "Username",
                          prefix: Icon(
                            Icons.person,
                            color: AppColors.kprimary,
                          ),
                          validator: (value) =>
                              value!.isEmpty ? "Please enter username" : null,
                          controller: controller.emailController,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Obx(() => CustomTextFormField(
                              obscureText: controller.isPasswordVisible.value,
                              suffix: IconButton(
                                onPressed: () {
                                  controller.togglePasswordVisibility();
                                },
                                icon: Icon(
                                  controller.isPasswordVisible.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: controller.isPasswordVisible.value
                                      ? AppColors.kprimary
                                      : Colors.grey,
                                ),
                              ),
                              prefix: Icon(
                                Icons.lock,
                                color: AppColors.kprimary,
                              ),
                              controller: controller.passwordController,
                              labelText: "Password",
                              hintText: "Password",
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter password";
                                }
                                return null;
                              },
                            )),
                        SizedBox(
                          height: 40.h,
                        ),
                        Obx(() {
                          return controller.rxRequestStatus.value ==
                                  EventStatus.loading
                              ?  CustomLoading()
                              : CustomElevatedButton(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      controller.login();
                                    }
                                    // Get.toNamed(
                                    //     AppRoutes.LOGIN_VERIFICATION);
                                  },
                                  text: "Login ",
                                );
                        }),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 80.w,
                                  height: 3,
                                  color: Colors.grey,
                                ),
                                const Text(
                                  " OR ",
                                  style: AppTextStyles.smallText,
                                ),
                                Container(
                                  width: 80.w,
                                  height: 3,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Don\'t have an account?',
                                    style: AppTextStyles.smallText
                                        .copyWith(fontSize: 16)),
                                TextButton(
                                  onPressed: () {
                                    Get.toNamed(AppRoutes.SIGN_UP);
                                  },
                                  child: Text(
                                    "Signup",
                                    style: AppTextStyles.smallText.copyWith(
                                        fontSize: 16,
                                        color: AppColors.black900,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Ellips extends StatelessWidget {
  const Ellips({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 184.h,
      width: 194.w,
      decoration:
          BoxDecoration(color: AppColors.whiteA700, shape: BoxShape.circle),
    );
  }
}

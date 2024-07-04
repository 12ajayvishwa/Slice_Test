import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slice/core/apiClient/http_response.dart';
import 'package:slice/core/constants/color_constant.dart';
import 'package:slice/widgets/custom_circular_loader.dart';
import 'package:slice/widgets/text_style.dart';
import '../../core/constants/app_export.dart';
import '../../routes/app_routes.dart';
import '../../widgets/custom_eleveted_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../controllers/auth_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  AuthController authController = Get.put(AuthController());

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Signup",
          style: AppTextStyles.headline,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                if (authController.rxRequestStatus.value ==
                    EventStatus.loading) {
                  return CustomLoading();
                }
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    children: [
                      CustomTextFormField(
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Username is required.";
                          }
                          return null;
                        },
                        controller: authController.firstNameController,
                        prefix: Icon(
                          Icons.person,
                          color: AppColors.kprimary,
                        ),
                        labelText: "Name",
                        hintText: "Name",
                      ),
                      SizedBox(height: 10.h),
                      CustomTextFormField(
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "last name is required.";
                          }
                          return null;
                        },
                        controller: authController.lastNameController,
                        prefix: Icon(
                          Icons.person,
                          color: AppColors.kprimary,
                        ),
                        labelText: "Last name",
                        hintText: "Last name",
                      ),
                      SizedBox(height: 10.h),
                      CustomTextFormField(
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Email is required.";
                          }
                          return null;
                        },
                        controller: authController.emailController,
                        prefix: Icon(Icons.email, color: AppColors.kprimary),
                        labelText: "Email",
                        hintText: "Email",
                      ),
                      SizedBox(height: 10.h),
                      CustomTextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter phone no.";
                          }
                          return null;
                        },
                        maxLength: 10,
                        textInputType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: authController.phoneController,
                        prefix: Icon(Icons.phone, color: AppColors.kprimary),
                        labelText: "Phone",
                        hintText: "Phone",
                      ),
                      SizedBox(height: 20.h),
                      authController.rxRequestStatus.value ==
                              EventStatus.loading
                          ? CustomLoading()
                          : CustomElevatedButton(
                              text: "Submit",
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  authController.signUp();
                                }
                              }),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        width: MediaQuery.of(Get.context!).size.width,
                        alignment: Alignment.center,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 80.w,
                                height: 3.h,
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
                        width: MediaQuery.of(Get.context!).size.width,
                        alignment: Alignment.center,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Already have an account?',
                                  style: AppTextStyles.smallText
                                      .copyWith(fontSize: 16)),
                              TextButton(
                                onPressed: () {
                                  Get.toNamed(AppRoutes.LOGIN);
                                },
                                child: Text(
                                  "Login",
                                  style: AppTextStyles.smallText.copyWith(
                                      fontSize: 16,
                                      color: AppColors.kprimary,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

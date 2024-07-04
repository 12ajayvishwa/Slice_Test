import 'dart:async';
import 'package:slice/core/constants/session_manager.dart';
import 'package:slice/routes/names.dart';
import 'package:slice/core/constants/color_constant.dart';
import '../../core/constants/app_export.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    check(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kprimary,
      body: const Center(
        child: Text(
          "Slice",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }

  check(BuildContext context) {
    final String? accessToken = SessionManager.getToken();

    if (accessToken != null) {
      Timer(const Duration(seconds: 3),
          () => Get.offAndToNamed(AppRoutes.DASHBOARD));
    } else {
      Timer(
          const Duration(seconds: 3), () => Get.offAndToNamed(AppRoutes.LOGIN));
    }
  }
}

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/constants/app_export.dart';
import '../core/constants/color_constant.dart';

class CustomLoading extends StatelessWidget {
  Color? color;

   CustomLoading({super.key,this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height: 30.h,
      width: 30.w,
      child: Center(
        child: CircularProgressIndicator(
          color: color??AppColors.kprimary,
        ),
      ))
    );
  }
}

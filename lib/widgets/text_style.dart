
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/constants/app_export.dart';
import '../core/constants/color_constant.dart';

class AppTextStyles {
  static const TextStyle largeTitile =
      TextStyle(fontSize: 34.0, color: Colors.black, fontFamily: "Poppins");
  static const TextStyle title1 =
      TextStyle(fontSize: 28.0, color: Colors.black, fontFamily: "Poppins");
  static const TextStyle title2 =
      TextStyle(fontSize: 22.0, color: Colors.black, fontFamily: "Poppins");
  static const TextStyle title3 =
      TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: "Poppins");
  static const TextStyle headline = TextStyle(
    fontSize: 17.0,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontFamily: "Poppins",
  );

  static TextStyle headline2 = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w600,
    color: AppColors.kprimary,
    fontFamily: "Poppins",
  );
  static TextStyle textFieldLabel = TextStyle(
    fontSize: 14.0.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xff848A94),
    fontFamily: "Poppins",
  );

  static  TextStyle bodyText =
      TextStyle(fontSize: 16.0.sp, color: Colors.black, fontFamily: "Poppins");
  static TextStyle hintText = TextStyle(
      fontSize: 16.0.sp, color: AppColors.hintText, fontFamily: "Poppins");
  static const TextStyle smallText =
      TextStyle(fontSize: 12.0, color: Colors.grey, fontFamily: "Poppins");
  static  TextStyle buttonText = TextStyle(
    fontSize: 16.0.sp,
    color: Colors.white,
  );
  //FIGMA TEXT
  static TextStyle appBarHeadingText = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.headingText,
    fontFamily: "Poppins",
  );

  static TextStyle text32Black600 = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.black900,
    fontFamily: "Poppins",
  );
  static TextStyle text20BlackBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.black900,
    fontFamily: "Poppins",
  );
  static TextStyle text20BlackRaguler = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.black900,
    fontFamily: "Poppins",
  );
  static TextStyle text18Black600 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.black900,
    fontFamily: "Poppins",
  );
  static TextStyle text18Black800 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.black900,
    fontFamily: "Poppins",
  );
  static TextStyle text18White600 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteA700,
    fontFamily: "Poppins",
  );
  static TextStyle text16BlackRaguler = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.black900,
    fontFamily: "Poppins",
  );
  static TextStyle text16Black600 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.black900,
    fontFamily: "Poppins",
  );
  static TextStyle text16Black400 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.black900,
    fontFamily: "Poppins",
  );
  static TextStyle text16Gray400 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.gray,
    fontFamily: "Poppins",
  );
  static TextStyle text16BlackBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.black900,
    fontFamily: "Poppins",
  );
 
 
  static TextStyle text10White400 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteA700,
    fontFamily: "Poppins",
  );
  static TextStyle text15White500 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteA700,
    fontFamily: "Poppins",
  );
  static TextStyle text20WhiteSemiBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteA700,
    fontFamily: "Poppins",
  );

  static TextStyle text14WhiteBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteA700,
    fontFamily: "Poppins",
  );
  static TextStyle text14White400 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteA700,
    fontFamily: "Poppins",
  );
  static TextStyle text14BlackMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.headingText,
    fontFamily: "Poppins",
  );
  static TextStyle text11WhiteRegular = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.whiteA700,
    fontFamily: "Poppins",
  );
  static TextStyle text12WhiteRegular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.whiteA700,
    fontFamily: "Poppins",
  );

  // Add more text styles as needed

  // Example of a method that combines multiple text styles
  static TextStyle combineStyles(TextStyle baseStyle,
      {double? fontSize, Color? color}) {
    return baseStyle.copyWith(
      fontSize: fontSize ?? baseStyle.fontSize,
      color: color ?? baseStyle.color,
    );
  }
}

import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:slice/widgets/text_style.dart';
import '../core/constants/app_export.dart';
import '../core/constants/color_constant.dart';

// ignore: must_be_immutable
class CustomPinCodeTextField extends StatelessWidget {
  CustomPinCodeTextField(
      {Key? key,
      required this.context,
      required this.onChanged,
      this.alignment,
      this.margin,
      this.controller,
      this.textStyle,
      this.hintStyle,
      this.validator,
      this.mainAxisAlignment,
      this.length})
      : super(
          key: key,
        );

  final Alignment? alignment;

  final EdgeInsetsGeometry? margin;

  final MainAxisAlignment? mainAxisAlignment;

  final BuildContext context;

  final TextEditingController? controller;

  final TextStyle? textStyle;

  final TextStyle? hintStyle;

  Function(String) onChanged;

  final FormFieldValidator<String>? validator;

  final int? length;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: pinCodeTextFieldWidget,
          )
        : pinCodeTextFieldWidget;
  }

  Widget get pinCodeTextFieldWidget => Padding(
        padding: margin ?? EdgeInsets.zero,
        child: PinCodeTextField(
          mainAxisAlignment:
              mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
          appContext: context,
          controller: controller,
          length: length ?? 4,
          keyboardType: TextInputType.number,
          textStyle: textStyle ?? AppTextStyles.bodyText,
          hintStyle: hintStyle ?? AppTextStyles.bodyText,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          enableActiveFill: true,
          pinTheme: PinTheme(
            fieldHeight: 55.h,
            fieldWidth: 55.w,
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(10.h),
            inactiveColor: AppColors.kprimary.withOpacity(0.25),
            activeColor: AppColors.kprimary.withOpacity(0.25),
            inactiveFillColor: AppColors.whiteA700.withOpacity(0.85),
            activeFillColor: AppColors.whiteA700.withOpacity(0.85),
            selectedFillColor: AppColors.whiteA700.withOpacity(0.85),

            borderWidth: 2,
            //selectedColor: Colors.transparent,
          ),
          onChanged: (value) => onChanged(value),
          validator: validator,
        ),
      );
}

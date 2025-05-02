import 'package:event_planing_app/ui/home/provider/theme_provider.dart';
import 'package:event_planing_app/utils/app_color.dart';
import 'package:event_planing_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

typedef MyValiadatorFunction = String? Function(String?)?;

class CustomTextformField extends StatelessWidget {
  CustomTextformField(
      {super.key,
      this.borderColor,
      this.hintText,
      this.labelText,
      this.hinttextStyle,
      this.prefixicon,
      this.maxLines,
      this.controllerText,
      this.validator,
      this.suffixicon,
      this.keyBordType,
      this.obscureText,
      });
  MyValiadatorFunction validator;
  Color? borderColor;
  String? hintText;
  String? labelText;
  int? maxLines;
  TextStyle? hinttextStyle, lebeltextStyle;
  Widget? prefixicon, suffixicon;
  TextEditingController? controllerText;
  TextInputType? keyBordType;
  bool? obscureText;
  @override
  Widget build(BuildContext context) {
    var themeProvidet = Provider.of<ThemeProvider>(context);
    return TextFormField(
      keyboardType:keyBordType??TextInputType.text ,

      //this to make the text appering or not
      obscureText:obscureText??false ,
      obscuringCharacter: '*',
      validator: validator,
      cursorColor: AppColor.primeColordark,
      maxLines: maxLines ?? 1,
      controller: controllerText,
      decoration: InputDecoration(
        prefixIcon: prefixicon,
        prefixIconColor: themeProvidet.courrentThem == ThemeMode.dark
            ? AppColor.whiteColor
            : AppColor.colorBlack,
        suffixIcon: suffixicon,
        suffixIconColor: themeProvidet.courrentThem == ThemeMode.dark
            ? AppColor.whiteColor
            : AppColor.colorBlack,
        hintText: hintText,
        labelText: labelText,
        hintStyle: hinttextStyle ?? AppStyles.inter16grey,
        labelStyle: lebeltextStyle ?? AppStyles.inter16grey,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: borderColor ?? AppColor.grey,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: borderColor ?? AppColor.grey,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppColor.red,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppColor.red,
            width: 1,
          ),
        ),
      ),
    );
  }
}

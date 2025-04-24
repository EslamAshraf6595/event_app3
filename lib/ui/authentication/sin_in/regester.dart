import 'package:event_planing_app/ui/authentication/Login/log_in.dart';
import 'package:event_planing_app/ui/home/provider/language_provider.dart';
import 'package:event_planing_app/ui/home/provider/theme_provider.dart';
import 'package:event_planing_app/ui/widget/custom_elevatedbuttom.dart';
import 'package:event_planing_app/ui/widget/custom_textForm_field.dart';
import 'package:event_planing_app/ui/widget/togleSwitch.dart';
import 'package:event_planing_app/utils/app_color.dart';
import 'package:event_planing_app/utils/app_styles.dart';
import 'package:event_planing_app/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Register extends StatefulWidget {
  Register({super.key});
  static const routRegester = 'regester';
  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).focusColor,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.creat_acount,
          style: themeProvider.courrentThem == ThemeMode.light
              ? AppStyles.bold20black.copyWith(fontSize: 15)
              : AppStyles.bold20white
                  .copyWith(color: AppColor.mainColordark, fontSize: 15),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.1),
                child: Container(
                  height: height * 0.25,
                  decoration: BoxDecoration(
                    color: AppColor
                        .whiteColor, //dont forget to change the color to the dark mode.
                  ),
                  child: Image.asset(AppAssets.logoLight),
                ),
              ),
              Form(
                  key: widget.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextformField(
                        prefixicon: Icon(Icons.person),
                        hintText: AppLocalizations.of(context)!.name,
                        controllerText: widget.nameController,
                        validator: (name) {
                          if (name!.isEmpty) {
                            return AppLocalizations.of(context)!.enter_name;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      CustomTextformField(
                        prefixicon: Icon(HeroIcons.envelope),
                        hintText: AppLocalizations.of(context)!.email,
                        controllerText: widget.emailController,
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return AppLocalizations.of(context)!.enter_email;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      CustomTextformField(
                        prefixicon: Icon(HeroIcons.lock_closed),
                        hintText: AppLocalizations.of(context)!.password,
                        suffixicon: Icon(HeroIcons.eye_slash),
                        controllerText: widget.passwordController,
                        validator: (password) {
                          if (password == null || password.isEmpty) {
                            return AppLocalizations.of(context)!.enter_password;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      CustomTextformField(
                        prefixicon: Icon(HeroIcons.lock_closed),
                        hintText: AppLocalizations.of(context)!.reset_password,
                        suffixicon: Icon(HeroIcons.eye_slash),
                        controllerText: widget.rePassword,
                        validator: (rePassword) {
                          if (rePassword == null || rePassword.isEmpty) {
                            return AppLocalizations.of(context)!
                                .enter_repassword;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      CustomElevatedbuttom(
                          text: AppLocalizations.of(context)!.creat_acount,
                          onButtonClick: Regester),
                      SizedBox(
                        height: height * 0.02,
                      ),
                    ],
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: height * 0.02),
                      side:
                          BorderSide(color: AppColor.primeColordark, width: 2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      backgroundColor: Theme.of(context).focusColor),
                  onPressed: () {
                    //make asign his acount using google
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.15),
                    child: Row(
                      children: [
                        Brand(
                          Brands.google,
                          size: 25,
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Text(
                          AppLocalizations.of(context)!.login_google,
                          style: languageProvider.currentLanguage == "en"
                              ? AppStyles.meduim18dark
                              : AppStyles.meduim10dark,
                        )
                      ],
                    ),
                  )),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                margin: EdgeInsets.symmetric(vertical: height * 0.01),
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                      text: AppLocalizations.of(context)!.have_acount,
                      style: AppStyles.bold10black),
                  WidgetSpan(
                      child: GestureDetector(
                    onTap: () {
                      //make a logic for ctreat the new acount
                    },
                    child: Text(AppLocalizations.of(context)!.login,
                        style: AppStyles.bold10Dark),
                  ))
                ])),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              //i edite here
              CustomToggleSwitch(
                toggleType: ToggleType.language,
              ),
              SizedBox(
                height: height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void Regester() {
    if (widget.formKey.currentState!.validate() == true)
      Navigator.of(context).pushNamed(LogIn.routeLogin);
  }
}

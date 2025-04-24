import 'package:event_planing_app/ui/authentication/sin_in/regester.dart';
import 'package:event_planing_app/ui/home/provider/language_provider.dart';
import 'package:event_planing_app/ui/introdction/Intordction1.dart';
import 'package:event_planing_app/ui/widget/custom_elevatedbuttom.dart';
import 'package:event_planing_app/ui/widget/custom_textForm_field.dart';
import 'package:event_planing_app/ui/widget/togleSwitch.dart';
import 'package:event_planing_app/utils/app_color.dart';
import 'package:event_planing_app/utils/app_styles.dart';
import 'package:event_planing_app/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});
  static const routeLogin = 'log in';

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool isUSSelected = true;
  bool isAmerican = false;
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
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
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextformField(
                      controllerText: emailController,
                      prefixicon: Icon(HeroIcons.envelope),
                      hintText: AppLocalizations.of(context)!.email,
                      validator: (email) {
                        if (email!.isEmpty) {
                          return AppLocalizations.of(context)!.enter_email;
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    CustomTextformField(
                      controllerText: passwordController,
                      prefixicon: Icon(HeroIcons.lock_closed),
                      hintText: AppLocalizations.of(context)!.password,
                      suffixicon: Icon(HeroIcons.eye_slash),
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
                    Row(
                      children: [
                        Spacer(),
                        Text.rich(TextSpan(children: [
                          WidgetSpan(
                              child: GestureDetector(
                            onTap: () {
                              //make a logic for the forget passowrd
                            },
                            child: Text(
                                AppLocalizations.of(context)!.forget_pasword,
                                style: AppStyles.bold10Dark),
                          ))
                        ])),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    CustomElevatedbuttom(
                        text: AppLocalizations.of(context)!.login,
                        onButtonClick: Login),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                margin: EdgeInsets.symmetric(vertical: height * 0.01),
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                      text: AppLocalizations.of(context)!.no_acount,
                      style: AppStyles.bold10black),
                  WidgetSpan(
                      child: GestureDetector(
                    onTap: () {
                      //make a logic for ctreat the new acount
                      Navigator.of(context).pushNamed(Register.routRegester);
                    },
                    child: Text(AppLocalizations.of(context)!.creat_acount,
                        style: AppStyles.bold10Dark),
                  ))
                ])),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.03, vertical: height * 0.03),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 2,
                      endIndent: width * 0.02,
                      indent: width * 0.02,
                      color: AppColor.primeColordark,
                    )),
                    Text(AppLocalizations.of(context)!.or),
                    Expanded(
                        child: Divider(
                      thickness: 2,
                      endIndent: width * 0.02,
                      indent: width * 0.02,
                      color: AppColor.primeColordark,
                    )),
                  ],
                ),
              ),
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

  void Login() {
    //to home Page
    if (formKey.currentState!.validate() == true) {
      Navigator.of(context).pushReplacementNamed(Intordction1.routItro1);
    }
  }
}

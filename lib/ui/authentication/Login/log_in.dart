import 'package:event_planing_app/fireBaseUtils.dart';
import 'package:event_planing_app/ui/authentication/sin_in/regester.dart';
import 'package:event_planing_app/ui/home/home_screen.dart';
import 'package:event_planing_app/ui/home/provider/language_provider.dart';
import 'package:event_planing_app/ui/home/provider/my_user.dart';
import 'package:event_planing_app/ui/widget/custom_elevatedbuttom.dart';
import 'package:event_planing_app/ui/widget/custom_textForm_field.dart';
import 'package:event_planing_app/ui/widget/togleSwitch.dart';
import 'package:event_planing_app/utils/app_color.dart';
import 'package:event_planing_app/utils/app_styles.dart';
import 'package:event_planing_app/utils/assets_manager.dart';
import 'package:event_planing_app/utils/dialog_Uutils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});
  static const routeLogin = 'login';

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool isUSSelected = true;
  bool isAmerican = false;
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController =
      TextEditingController(text: 'eslam@gmail.com');
  TextEditingController passwordController =
      TextEditingController(text: '123456');
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    //var themeProvider = Provider.of<ThemeProvider>(context);
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
                      keyBordType: TextInputType.emailAddress,
                      validator: (email) {
                        if (email == null || email.trim().isEmpty) {
                          return AppLocalizations.of(context)!.enter_email;
                        }
                        final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(email);
                        if (!emailValid) {
                          return 'Invalid Email Pattern';
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
                      suffixicon: GestureDetector(
                          onTap: () {},
                          child: Icon(Icons.remove_red_eye_outlined)),
                      keyBordType: TextInputType.number,

                      //this meeins that the text not appering
                      obscureText: true,
                      validator: (password) {
                        if (password == null || password.trim().isEmpty) {
                          return AppLocalizations.of(context)!.enter_password;
                        }
                        if (password.length < 6) {
                          return "the minimum lenght is 6";
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
                      backgroundColor: Theme.of(context).primaryColor),
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
                              ? AppStyles.meduim18white
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

  void Login() async {
    if (formKey.currentState?.validate() == true) {
      DialogUtils.showMessage(
        context: context,
        message: AppLocalizations.of(context)!.loading_login,
      );
      try {
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        var user = await FireBaseUtils.readUserFromFireStor(
            credential.user?.uid ?? '');
        if (user == null) {
          return;
        }
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.updateUserName(user);
        DialogUtils.hideLoading(context: context);
        DialogUtils.showMessage(
          context: context,
          message: AppLocalizations.of(context)!.login_success,
          title: AppLocalizations.of(context)!.login_success_title,
          posActionName: AppLocalizations.of(context)!.ok_button,
          posAction: () {
            Navigator.of(context).pushReplacementNamed(HomeScreen.routHome);
          },
        );
      } on FirebaseAuthException catch (e) {
        DialogUtils.hideLoading(context: context);
        String errorMessage = '';
        if (e.code == 'user-not-found') {
          errorMessage = AppLocalizations.of(context)!.user_not_found_error;
        } else if (e.code == 'wrong-password') {
          errorMessage = AppLocalizations.of(context)!.wrong_password_error;
        } else {
          errorMessage =
              e.message ?? AppLocalizations.of(context)!.login_error_title;
        }
        DialogUtils.showMessage(
          context: context,
          message: errorMessage,
          title: AppLocalizations.of(context)!.login_error_title,
          posActionName: AppLocalizations.of(context)!.ok_button,
        );
      } catch (e) {
        DialogUtils.hideLoading(context: context);
        DialogUtils.showMessage(
          context: context,
          message: e.toString(),
          title: AppLocalizations.of(context)!.login_error_title,
          posActionName: AppLocalizations.of(context)!.ok_button,
        );
      }
    }
  }
}

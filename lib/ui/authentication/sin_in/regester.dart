import 'package:event_planing_app/fireBaseUtils.dart';
import 'package:event_planing_app/model/my_user.dart';
import 'package:event_planing_app/ui/home/provider/language_provider.dart';
import 'package:event_planing_app/ui/home/provider/my_user.dart';
import 'package:event_planing_app/ui/home/provider/theme_provider.dart';
import 'package:event_planing_app/ui/introdction/Intordction1.dart';
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
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Register extends StatefulWidget {
  Register({super.key});
  static const routRegester = 'regester';
  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController(text: 'eslam');
  TextEditingController emailController =
      TextEditingController(text: 'eslam@gmail.com');
  TextEditingController passwordController =
      TextEditingController(text: '123456');
  TextEditingController rePassword = TextEditingController(text: '123456');
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
                        prefixicon: Icon(HeroIcons.lock_closed),
                        hintText: AppLocalizations.of(context)!.password,
                        suffixicon: Icon(HeroIcons.eye_slash),
                        controllerText: widget.passwordController,
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
                      CustomTextformField(
                        prefixicon: Icon(HeroIcons.lock_closed),
                        hintText: AppLocalizations.of(context)!.reset_password,
                        suffixicon: Icon(HeroIcons.eye_slash),
                        controllerText: widget.rePassword,

                        keyBordType: TextInputType.number,

                        //this meeins that the text not appering
                        obscureText: true,
                        validator: (password) {
                          if (password == null || password.trim().isEmpty) {
                            return AppLocalizations.of(context)!
                                .enter_repassword;
                          }
                          if (password.length < 6) {
                            return "the minimum lenght is 6";
                          }
                          if (password != widget.passwordController.text) {
                            return "Re-Password does Not match Passord";
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

  void Regester() async {
    if (widget.formKey.currentState!.validate() == true) {
      DialogUtils.showMessage(
        context: context,
        message: AppLocalizations.of(context)!.loading_register,
      );
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: widget.emailController.text,
          password: widget.passwordController.text,
        );

        //to set the data to MyUser class to FireBaseFireStore.
        MyUser myUser = MyUser(
            id: credential.user!.uid ?? '',
            name: widget.nameController.text,
            email: widget.emailController.text);
        await FireBaseUtils.addUserToFirestore(
            myUser); //don't missing it becuase if you don't add it no data will be add
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.updateUserName(myUser);
        DialogUtils.hideLoading(context: context);
        DialogUtils.showMessage(
          context: context,
          message: AppLocalizations.of(context)!.register_success,
          title: AppLocalizations.of(context)!.register_success_title,
          posActionName: AppLocalizations.of(context)!.ok_button,
          posAction: () {
            Navigator.of(context).pushReplacementNamed(Intordction1.routItro1);
          },
        );
      } on FirebaseAuthException catch (e) {
        DialogUtils.hideLoading(context: context);
        String errorMessage = '';
        if (e.code == 'weak-password') {
          errorMessage = AppLocalizations.of(context)!.weak_password_error;
        } else if (e.code == 'email-already-in-use') {
          errorMessage = AppLocalizations.of(context)!.email_in_use_error;
        } else {
          errorMessage =
              e.message ?? AppLocalizations.of(context)!.register_error_title;
        }
        DialogUtils.showMessage(
          context: context,
          message: errorMessage,
          title: AppLocalizations.of(context)!.register_error_title,
          posActionName: AppLocalizations.of(context)!.ok_button,
        );
      } catch (e) {
        DialogUtils.hideLoading(context: context);
        DialogUtils.showMessage(
          context: context,
          message: e.toString(),
          title: AppLocalizations.of(context)!.register_error_title,
          posActionName: AppLocalizations.of(context)!.ok_button,
        );
      }
    }
  }
}

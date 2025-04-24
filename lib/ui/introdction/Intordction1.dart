import 'package:event_planing_app/ui/home/provider/language_provider.dart';
import 'package:event_planing_app/ui/home/provider/theme_provider.dart';
import 'package:event_planing_app/ui/introdction/intro_controle.dart';
import 'package:event_planing_app/ui/widget/custom_elevatedbuttom.dart';
import 'package:event_planing_app/ui/widget/togleSwitch.dart';
import 'package:event_planing_app/utils/app_color.dart';
import 'package:event_planing_app/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Intordction1 extends StatefulWidget {
  const Intordction1({super.key});

  @override
  State<Intordction1> createState() => _Page1State();
  static const routItro1 = 'Intordction1';
}

class _Page1State extends State<Intordction1> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<LanguageProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    int _selectedLang = 0;
    String _currentlanguage = 'en';
    return Container(
      color: themeProvider.courrentThem == ThemeMode.light
          ? AppColor.whiteColor
          : AppColor.mainColordark,
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            SizedBox(
              width: double.infinity,
              height: height * 0.6,
              child: Image.asset(
                AppAssets.onbordinglight1,
                fit: BoxFit.contain,
              ),
            ),
            // SizedBox(height: height * 0.01),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  AppLocalizations.of(context)!.experience,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontSize: 15),
                  // textAlign: TextAlign.start,
                ),
              ],
            ),
            SizedBox(height: height * 0.01),
            Text(
              AppLocalizations.of(context)!.choose,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontSize: 13),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context)!.language,
                    style: Theme.of(context).textTheme.headlineLarge),
                CustomToggleSwitch(
                  toggleType: ToggleType.language,
                ),
              ],
            ),
            SizedBox(height: height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context)!.theme,
                    style: Theme.of(context).textTheme.headlineLarge),
                //to do the change theam
                CustomToggleSwitch(
                  toggleType: ToggleType.theme,
                ),
              ],
            ),
            SizedBox(height: height * 0.03),
            // ElevatedButton(
            //   //go to the introdction screen1
            //   onPressed: () {},
            //   child: Text(AppLocalizations.of(context)!.start),
            //   style: ElevatedButton.styleFrom(
            //       fixedSize: Size(width, height * 0.06),
            //       backgroundColor: Theme.of(context).primaryColor,
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(16))),
            // )
            CustomElevatedbuttom(
              text: AppLocalizations.of(context)!.start,
              onButtonClick: introControle,
            ),
            SizedBox(
              height: height * 0.01,
            ),
          ],
        ),
      ),
    );
  }

  void introControle() {
    Navigator.of(context).pushReplacementNamed(IntroControle.routIntro);
  }

  // Widget SelctedLanguage(String text) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Text(
  //         text,
  //         style: Theme.of(context).textTheme.headlineLarge,
  //       ),
  //     ],
  //   );
  // }

  // Widget UnslectedLanuage(String text) {
  //   return Row(
  //     children: [
  //       Text(
  //         text,
  //         style: Theme.of(context)
  //             .textTheme
  //             .headlineLarge
  //             ?.copyWith(color: Colors.black),
  //       ),
  //     ],
  //   );
  // }
}

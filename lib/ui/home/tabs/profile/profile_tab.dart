import 'package:event_planing_app/ui/home/provider/language_provider.dart';
import 'package:event_planing_app/ui/home/provider/theme_provider.dart';
import 'package:event_planing_app/ui/home/tabs/profile/theme_Bottom_sheet.dart';
import 'package:event_planing_app/utils/app_color.dart';
import 'package:event_planing_app/utils/app_styles.dart';
import 'package:event_planing_app/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

import 'language_Bottom_sheet.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<LanguageProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: languageProvider.currentLanguage == 'ar'
                ? BorderRadius.only(bottomRight: Radius.circular(45))
                : BorderRadius.only(bottomLeft: Radius.circular(45))),
        backgroundColor: AppColor.primeColordark,
        toolbarHeight: height * 0.185,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.013),
                  height: height * 0.145,
                  width: width * 0.27,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: languageProvider.currentLanguage == 'en'
                          ? BorderRadius.only(
                              topRight: Radius.circular(40),
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40))
                          : BorderRadius.only(
                              topLeft: Radius.circular(40),
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40)),
                      image: DecorationImage(
                          image: AssetImage(
                            AppAssets.testImageProfile,
                          ),
                          fit: BoxFit.cover)),
                ),
                IconButton(
                    onPressed: () {
                      //make it pick from the phone;
                    },
                    icon: Icon(
                      Clarity.camera_solid,
                      color: AppColor.whiteColor,
                      size: 25,
                    ))
              ],
            ),
            SizedBox(
              width: width * 0.025,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'John Safwat',
                    style: AppStyles.inter24white,
                    softWrap: true,
                    //or
                    //overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: height * 0.015,
                  ),
                  Text(
                    "JohnSafwat@gamil.com",
                    style: AppStyles.inter16white,
                    softWrap: true,
                    // overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: height * 0.01,
        ),
        Padding(
          padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
          child: Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        InkWell(
          onTap: () {
            showLanguageBottomSheet();
          },
          child: Container(
            //arabic
            margin: EdgeInsets.symmetric(horizontal: width * 0.04),
            width: width,
            height: height * 0.06,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColor.primeColordark, width: 2)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      languageProvider.currentLanguage == 'en'
                          ? AppLocalizations.of(context)!.english
                          : AppLocalizations.of(context)!.arabic,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 30,
                      color: AppColor.primeColordark,
                    )
                  ]),
            ),
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Padding(
          padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
          child: Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        InkWell(
          onTap: () {
            showThemeBottomSheet();
            setState(() {});
          },
          child: Container(
            //theme
            margin: EdgeInsets.symmetric(horizontal: width * 0.04),
            width: width,
            height: height * 0.06,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColor.primeColordark, width: 2)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      themeProvider.courrentThem == ThemeMode.light
                          ? AppLocalizations.of(context)!.light
                          : AppLocalizations.of(context)!.dark,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 30,
                      color: AppColor.primeColordark,
                    )
                  ]),
            ),
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
          child: ElevatedButton(
            onPressed: () {
              // make log out from the app/or your acount
            },
            child: Row(
              children: [
                Icon(
                  EvaIcons.log_out,
                  size: 25,
                  color: AppColor.whiteColor,
                ),
                SizedBox(
                  width: width * 0.015,
                ),
                Text(
                  AppLocalizations.of(context)!.logout,
                  style: AppStyles.regular20white,
                ),
              ],
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.01, horizontal: width * 0.05)),
          ),
        ),
        SizedBox(
          height: height * 0.04,
        )
      ]),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageButtomShet());
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => ThemeButtomShet());
  }
}

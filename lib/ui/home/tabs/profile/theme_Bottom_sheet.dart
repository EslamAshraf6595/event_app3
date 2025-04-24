
import 'package:event_planing_app/ui/home/provider/language_provider.dart';
import 'package:event_planing_app/ui/home/provider/theme_provider.dart';
import 'package:event_planing_app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ThemeButtomShet extends StatefulWidget {
  const ThemeButtomShet({super.key});

  @override
  State<ThemeButtomShet> createState() => _LanguageButtomShetState();
}

class _LanguageButtomShetState extends State<ThemeButtomShet> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvide = Provider.of<ThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.03, vertical: height * 0.02),
          child: InkWell(
            onTap: () {
              themeProvide.changeThemeMode(ThemeMode.light);
            },
            child: themeProvide.courrentThem == ThemeMode.light
                ? SelctedLanguage(AppLocalizations.of(context)!.light)
                : UnslectedLanuage(AppLocalizations.of(context)!.light),
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: InkWell(
            onTap: () {
              themeProvide.changeThemeMode(ThemeMode.dark);
            },
            child: themeProvide.courrentThem == ThemeMode.dark
                ? SelctedLanguage(AppLocalizations.of(context)!.dark)
                : UnslectedLanuage(AppLocalizations.of(context)!.dark),
          ),
        ),
      ],
    );
  }

  Widget SelctedLanguage(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Icon(
          Icons.check,
          size: 30,
          color: AppColor.primeColordark,
        ),
      ],
    );
  }

  Widget UnslectedLanuage(String text) {
    return Row(
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}

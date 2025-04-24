
import 'package:event_planing_app/ui/home/provider/language_provider.dart';
import 'package:event_planing_app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LanguageButtomShet extends StatefulWidget {
  const LanguageButtomShet({super.key});

  @override
  State<LanguageButtomShet> createState() => _LanguageButtomShetState();
}

class _LanguageButtomShetState extends State<LanguageButtomShet> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvide = Provider.of<LanguageProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.03, vertical: height * 0.02),
          child: InkWell(
            onTap: () {
              languageProvide.changeLanguage('en');
            },
            child: languageProvide.currentLanguage == 'en'
                ? SelctedLanguage(AppLocalizations.of(context)!.english)
                : UnslectedLanuage(AppLocalizations.of(context)!.english),
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: InkWell(
            onTap: () {
              languageProvide.changeLanguage('ar');
            },
            child: languageProvide.currentLanguage == 'ar'
                ? SelctedLanguage(AppLocalizations.of(context)!.arabic)
                : UnslectedLanuage(AppLocalizations.of(context)!.arabic),
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

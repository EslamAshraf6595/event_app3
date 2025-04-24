import 'package:event_planing_app/ui/home/home_screen.dart';
import 'package:event_planing_app/ui/home/provider/theme_provider.dart';
import 'package:event_planing_app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IntroControle extends StatefulWidget {
  const IntroControle({Key? key}) : super(key: key);

  static const routIntro = 'Introduction';

  @override
  State<IntroControle> createState() => _IntroControleState();
}

class _IntroControleState extends State<IntroControle> {
  PageController controlePage = PageController();
  int currentPage = 0;

  List<String> images = [
    "assets/images/onboarding light 2.png",
    "assets/images/onboarding light 3.png",
    "assets/images/onboarding light 4.png"
  ];

  @override
  void initState() {
    super.initState();
    controlePage.addListener(() {
      setState(() {
        currentPage = controlePage.page!.round();
      });
    });
  }

  @override
  void dispose() {
    controlePage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<String> contentScrean = [
      AppLocalizations.of(context)!.find_events_that_inspire_you,
      AppLocalizations.of(context)!.effortless_event_planning,
      AppLocalizations.of(context)!.connect_with_friends_share_moments,
    ];
    List<String> titleScrean = [
      AppLocalizations.of(context)!.title_1,
      AppLocalizations.of(context)!.title_2,
      AppLocalizations.of(context)!.title_3,
    ];
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controlePage,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: height * 0.1),
                    SizedBox(
                      height: height * 0.43,
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    Text(
                      titleScrean[index],
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(fontSize: 16),
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      contentScrean[index],
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                              fontSize: 13,
                              color:
                                  themeProvider.courrentThem == ThemeMode.light
                                      ? AppColor.colorBlack
                                      : AppColor.whiteColor),
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: 20,
            left: 30,
            child: FloatingActionButton(
              heroTag: "backHero",
              onPressed: () {
                if (currentPage > 0) {
                  controlePage.previousPage(
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInOut,
                  );
                }
              },
              backgroundColor: Colors.white,
              shape: const CircleBorder(
                side: BorderSide(color: Colors.blue),
              ),
              child: const Icon(Icons.arrow_back, color: Colors.blue),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 30,
            child: FloatingActionButton(
              heroTag: "nextHero",
              onPressed: () {
                if (currentPage == 2) {
                  Navigator.of(context)
                      .pushReplacementNamed(HomeScreen.routHome);
                } else {
                  controlePage.nextPage(
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInOut,
                  );
                }
              },
              backgroundColor: Colors.white,
              shape: const CircleBorder(
                side: BorderSide(color: Colors.blue),
              ),
              child: Icon(
                currentPage == 2 ? Icons.check : Icons.arrow_forward,
                color: Colors.blue,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.85),
            child: SmoothPageIndicator(
              controller: controlePage,
              count: 3,
              effect: const WormEffect(
                activeDotColor: AppColor.primeColordark,
                dotHeight: 10,
                dotWidth: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

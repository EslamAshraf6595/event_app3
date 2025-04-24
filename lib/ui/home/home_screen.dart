import 'package:event_planing_app/ui/home/tabs/favorite/favorite_tab.dart';
import 'package:event_planing_app/ui/home/tabs/home/add_event.dart';
import 'package:event_planing_app/ui/home/tabs/home/home_tab.dart';
import 'package:event_planing_app/ui/home/tabs/map/map_tab.dart';
import 'package:event_planing_app/utils/app_color.dart';
import 'package:event_planing_app/utils/assets_manager.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'tabs/profile/profile_tab.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static const routHome = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> pagesTab = [HomeTab(), MapTab(), FavoriteTab(), ProfileTab()];
  int slectedndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pagesTab[slectedndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
        child: BottomAppBar(
          padding: EdgeInsets.zero,
          shape: CircularNotchedRectangle(),
          notchMargin: 4,
          color: Theme.of(context).primaryColor,
          child: BottomNavigationBar(
            // backgroundColor: AppColor.primeColordark,
            // type: BottomNavigationBarType.fixed,
            currentIndex: slectedndex,
            onTap: (value) {
              setState(() {
                slectedndex = value;
              });
            },
            items: [
              builtBottomNavigationBarItem(
                  unSlectedImageIcon: AppAssets.unslectedHome,
                  label: AppLocalizations.of(context)!.home,
                  index: 0,
                  slectedImageIcon: AppAssets.slectedHome),
              builtBottomNavigationBarItem(
                  unSlectedImageIcon: AppAssets.unslectedMap,
                  label: AppLocalizations.of(context)!.map,
                  index: 1,
                  slectedImageIcon: AppAssets.slectedMap),
              builtBottomNavigationBarItem(
                  unSlectedImageIcon: AppAssets.unslectedFavorite,
                  label: AppLocalizations.of(context)!.favorite,
                  index: 2,
                  slectedImageIcon: AppAssets.slectedFavorite),
              builtBottomNavigationBarItem(
                  unSlectedImageIcon: AppAssets.unslectedProfile,
                  label: AppLocalizations.of(context)!.profile,
                  index: 3,
                  slectedImageIcon: AppAssets.slectedProfile),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddEvet.routeAddEvent);
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: AppColor.whiteColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  BottomNavigationBarItem builtBottomNavigationBarItem(
      {required String label,
      required int index,
      required String slectedImageIcon,
      required String unSlectedImageIcon}) {
    return BottomNavigationBarItem(
        icon: ImageIcon(AssetImage(
            slectedndex == index ? slectedImageIcon : unSlectedImageIcon)),
        label: label);
  }
}

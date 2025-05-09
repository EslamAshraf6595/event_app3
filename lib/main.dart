import 'package:event_planing_app/firebase_options.dart';
import 'package:event_planing_app/ui/authentication/Login/log_in.dart';
import 'package:event_planing_app/ui/authentication/sin_in/regester.dart';
import 'package:event_planing_app/ui/home/home_screen.dart';
import 'package:event_planing_app/ui/home/provider/current_event_provider.dart';
import 'package:event_planing_app/ui/home/provider/eventsProvider.dart';
import 'package:event_planing_app/ui/home/provider/my_user.dart';
import 'package:event_planing_app/ui/home/provider/theme_provider.dart';
import 'package:event_planing_app/ui/home/tabs/home/add_event.dart';
import 'package:event_planing_app/ui/home/tabs/home/edit_event_data.dart';
import 'package:event_planing_app/ui/home/tabs/home/event_detils.dart';
import 'package:event_planing_app/ui/introdction/Intordction1.dart';
import 'package:event_planing_app/ui/introdction/intro_controle.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'ui/home/provider/language_provider.dart';
import 'utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseFirestore.instance
  //     .disableNetwork(); //make the App save data in the local storage
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => EventsProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => CurrentEventProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darktTheme,
      themeMode: themeProvider.courrentThem,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: LogIn.routeLogin,
      routes: {
        Intordction1.routItro1: (context) => Intordction1(),
        IntroControle.routIntro: (context) => IntroControle(),
        HomeScreen.routHome: (context) => HomeScreen(),
        AddEvet.routeAddEvent: (context) => AddEvet(),
        LogIn.routeLogin: (context) => LogIn(),
        Register.routRegester: (context) => Register(),
        EventDetils.routeDetails: (context) => EventDetils(),
        EditEventData.routeEditedata: (context) => EditEventData(),
      },
      locale: Locale(languageProvider.currentLanguage),
    );
  }
}

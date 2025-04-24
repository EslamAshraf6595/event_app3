import 'package:event_planing_app/ui/home/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:event_planing_app/ui/home/provider/language_provider.dart';
import 'package:event_planing_app/utils/app_color.dart';
import 'package:event_planing_app/utils/assets_manager.dart';

enum ToggleType { language, theme }

class CustomToggleSwitch extends StatefulWidget {
  final ToggleType toggleType;

  const CustomToggleSwitch({super.key, required this.toggleType});

  @override
  State<CustomToggleSwitch> createState() => _CustomToggleSwitchState();
}

class _CustomToggleSwitchState extends State<CustomToggleSwitch> {
  int toggleValue = 0;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Tooltip(
        message: _getTooltipMessage(),
        child: AnimatedToggleSwitch<int>.rolling(
          current: toggleValue,
          values: const [0, 1],
          onChanged: (i) {
            setState(() {
              toggleValue = i;
            });
            _handleToggleChange(i);
          },
          iconBuilder: (value, size) => Padding(
            padding: const EdgeInsets.all(4.0),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: ClipOval(
                key: ValueKey(value),
                child: _buildIcon(value),
              ),
            ),
          ),
          borderWidth: 2.5,
          height: 50,
          indicatorSize: const Size(45, 45),
          style: ToggleStyle(
            backgroundColor: Colors.white,
            borderColor: AppColor.primeColorlight,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.2),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleToggleChange(int value) {
    if (widget.toggleType == ToggleType.language) {
      final languageProvider =
          Provider.of<LanguageProvider>(context, listen: false);
      languageProvider.changeLanguage(value == 0 ? 'en' : 'ar');
    } else if (widget.toggleType == ToggleType.theme) {
      final themeProvider =
          Provider.of<ThemeProvider>(context, listen: false);
      themeProvider.changeThemeMode(value == 0 ? ThemeMode.light : ThemeMode.dark);
    }
  }

  String _getTooltipMessage() {
    if (widget.toggleType == ToggleType.language) {
      return toggleValue == 0 ? 'English' : 'Arabic';
    } else {
      return toggleValue == 0 ? 'Light Mode' : 'Dark Mode';
    }
  }

  Widget _buildIcon(int value) {
    if (widget.toggleType == ToggleType.language) {
      return Image.asset(
        value == 0 ? AppAssets.englishFlag : AppAssets.arabicFlag,
        width: 45,
        height: 45,
        fit: BoxFit.cover,
      );
    } else {
      return Icon(
        value == 0 ? Icons.light_mode : Icons.dark_mode,
        color: AppColor.primeColorlight,
        size: 30,
      );
    }
  }
}

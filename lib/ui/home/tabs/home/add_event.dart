import 'package:event_planing_app/fireBaseUtils.dart';
import 'package:event_planing_app/model/firebaseAddEvent.dart';
import 'package:event_planing_app/ui/home/provider/theme_provider.dart';
import 'package:event_planing_app/ui/home/tabs/home/eventTabItem.dart';
import 'package:event_planing_app/ui/widget/costum_TimeOrDate.dart';
import 'package:event_planing_app/ui/widget/custom_elevatedbuttom.dart';
import 'package:event_planing_app/ui/widget/custom_label_text.dart';
import 'package:event_planing_app/ui/widget/custom_textForm_field.dart';
import 'package:event_planing_app/utils/app_color.dart';
import 'package:event_planing_app/utils/app_styles.dart';
import 'package:event_planing_app/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddEvet extends StatefulWidget {
  const AddEvet({super.key});

  static const routeAddEvent = 'add event';

  @override
  State<AddEvet> createState() => _AddEvetState();
}

class _AddEvetState extends State<AddEvet> {
  int selectedTabBar = 0;
  final formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  DateTime? savedate;
  TimeOfDay? saveTime;
  String formatTime = '';
  String eventImage = '';
  var eventName;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final themeProvider = Provider.of<ThemeProvider>(context);

    final List<String> eventsNameList = [
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workShop,
      AppLocalizations.of(context)!.bookClub,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
    ];

    final List<String> eventIconsList = [
      AppAssets.pick,
      AppAssets.pick,
      AppAssets.pick,
      AppAssets.pick,
      AppAssets.pick,
      AppAssets.pick,
      AppAssets.pick,
      AppAssets.pick,
      AppAssets.pick,
      // Bootstrap.bicycle,
      // Bootstrap.gift,
      // Bootstrap.calendar_event,
      // Bootstrap.controller,
      // Bootstrap.briefcase,
      // Bootstrap.book,
      // Bootstrap.image,
      // Bootstrap.sun,
      // Bootstrap.basket,
    ];

    final List<String> eventsImageList = [
      AppAssets.sport,
      AppAssets.birthdayLight,
      AppAssets.meeting,
      AppAssets.gaming,
      AppAssets.workShop,
      AppAssets.bookClub,
      AppAssets.exhibition,
      AppAssets.holiday,
      AppAssets.eating,
    ];

    eventImage = eventsImageList[selectedTabBar];
    eventName = eventIconsList[selectedTabBar];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          AppLocalizations.of(context)!.creat_event,
          style: TextStyle(color: AppColor.primeColordark),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.04, vertical: height * 0.02),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  eventImage,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: height * 0.01),
              SizedBox(
                height: height * 0.1,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: eventsNameList.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTabBar = index;
                      });
                    },
                    child: EventTabBarItem(
                      iconSlectedColor: AppColor.whiteColor,
                      iconUnslectedColor: Theme.of(context).iconTheme.color!,
                      slectedColor: AppStyles.inter16white,
                      unslectedColor:
                          Theme.of(context).textTheme.headlineSmall!,
                      bodyColor: AppColor.primeColordark,
                      borderColor: AppColor.primeColordark,
                      isSlected: selectedTabBar == index,
                      iconData: eventIconsList[index],
                      eventText: eventsNameList[index],
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                      SizedBox(width: height * 0.01),
                ),
              ),
              SizedBox(height: height * 0.01),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DescriptionText(
                        text: AppLocalizations.of(context)!.title_label),
                    SizedBox(height: height * 0.01),
                    CustomTextformField(
                      controllerText: titleController,
                      validator: (text) => text!.isEmpty
                          ? AppLocalizations.of(context)!.validator_title
                          : null,
                      hintText: AppLocalizations.of(context)!.title_hint,
                      hinttextStyle:
                          themeProvider.courrentThem == ThemeMode.light
                              ? AppStyles.inter16grey
                              : AppStyles.meduim16balck,
                      prefixicon: Icon(HeroIcons.pencil_square),
                    ),
                    SizedBox(height: height * 0.01),
                    DescriptionText(
                        text: AppLocalizations.of(context)!.description_label),
                    SizedBox(height: height * 0.01),
                    CustomTextformField(
                      controllerText: descriptionController,
                      validator: (text) => text!.isEmpty
                          ? AppLocalizations.of(context)!.validator_description
                          : null,
                      hintText: AppLocalizations.of(context)!.description_hint,
                      maxLines: 3,
                      hinttextStyle:
                          themeProvider.courrentThem == ThemeMode.light
                              ? AppStyles.inter16grey
                              : AppStyles.meduim16balck,
                    ),
                    SizedBox(height: height * 0.01),
                    CostumTimeordate(
                      ChooseDataOrTime: chooseDate,
                      eventTimeOrDate: savedate == null
                          ? AppLocalizations.of(context)!.choose_date_button
                          : DateFormat("dd/MM/yyyy").format(savedate!),
                      timeOrDate:
                          AppLocalizations.of(context)!.event_date_label,
                      icon: HeroIcons.calendar,
                    ),
                    SizedBox(height: height * 0.01),
                    CostumTimeordate(
                      ChooseDataOrTime: chooseTime,
                      eventTimeOrDate: saveTime == null
                          ? AppLocalizations.of(context)!.choose_time_button
                          : saveTime!.format(context),
                      timeOrDate:
                          AppLocalizations.of(context)!.event_time_label,
                      icon: FontAwesome.clock,
                    ),
                    SizedBox(height: height * 0.01),
                    Text(
                      AppLocalizations.of(context)!.location_label,
                      style: themeProvider.courrentThem == ThemeMode.light
                          ? AppStyles.meduim16balck
                          : AppStyles.inter16white,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColor.primeColordark),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                // choose location
                              },
                              icon: Image.asset(AppAssets.imageLocation)),
                          SizedBox(width: width * 0.01),
                          Text(
                            AppLocalizations.of(context)!.location,
                            style: TextStyle(color: AppColor.primeColordark),
                          ),
                          const Spacer(),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.01),
                            child: IconButton(
                                onPressed: () {
                                  // navigate or confirm location
                                },
                                icon: const Icon(
                                    Icons.arrow_forward_ios_outlined)),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    CustomElevatedbuttom(
                      onButtonClick: addEvent,
                      text: AppLocalizations.of(context)!.add_event,
                    ),
                    SizedBox(height: height * 0.02),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void chooseDate() async {
    final getDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (getDate != null) {
      setState(() {
        savedate = getDate;
      });
    }
  }

  void chooseTime() async {
    final getTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (getTime != null) {
      setState(() {
        saveTime = getTime;
        formatTime = getTime.format(context);
      });
    }
  }

  void addEvent() {
    if (formKey.currentState!.validate() == true) {
      final event = Event(
        eventName: eventName,
        image: eventImage,
        title: titleController.text,
        description: descriptionController.text,
        dateTime: savedate!,
        time: formatTime,
      );

      FireBaseUtils.addEventToFireStor(event).timeout(
        Duration(milliseconds: 500),
        onTimeout: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Event Added Successfully"),
            backgroundColor: Colors.green,
          ));
        },
      ).catchError((errror) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Failed to Add Event"),
          backgroundColor: Colors.red,
        ));
      });
    }
  }
}

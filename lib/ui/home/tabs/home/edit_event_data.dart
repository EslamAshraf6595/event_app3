import 'package:event_planing_app/fireBaseUtils.dart';
import 'package:event_planing_app/model/firebaseAddEvent.dart';
import 'package:event_planing_app/toast_utils.dart';
import 'package:event_planing_app/ui/home/home_screen.dart';
import 'package:event_planing_app/ui/home/provider/current_event_provider.dart';
import 'package:event_planing_app/ui/home/provider/eventsProvider.dart';
import 'package:event_planing_app/ui/home/provider/my_user.dart';
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

class EditEventData extends StatefulWidget {
  EditEventData({super.key,  this.event});
  final Event? event;

  static const routeEditedata = 'edit';

  @override
  State<EditEventData> createState() => _AddEvetState();
}

class _AddEvetState extends State<EditEventData> {
  int selectedTabBar = 0;
  final formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  DateTime? savedate;
  TimeOfDay? saveTime;
  String formatTime = '';
  String eventImage = '';
  String? eventName;

  late EventsProvider enevtListProvider;
  late UserProvider userProvider;
  late CurrentEventProvider currentEventProvider;

  List<String> eventsNameList = [];
  List<String> eventsImageList = [];

  @override
  void initState() {
    super.initState();

    titleController.text = widget.event!.title;
    descriptionController.text = widget.event!.description;
    savedate = widget.event!.dateTime;
    formatTime = widget.event!.time;
    saveTime = _parseTimeOfDay(formatTime);

    eventsNameList = [
      'Sport',
      'Birthday',
      'Meeting',
      'Gaming',
      'Book Club',
      'Exhibition',
      'Holiday',
      'Eating',
      'Workshop',
    ];

    eventsImageList = [
      AppAssets.sport,
      AppAssets.birthdayLight,
      AppAssets.meeting,
      AppAssets.gaming,
      AppAssets.bookClub,
      AppAssets.exhibition,
      AppAssets.holiday,
      AppAssets.eating,
      AppAssets.workShop,
    ];

    selectedTabBar = _getEventIndex(widget.event!.eventName);
    eventName = eventsNameList[selectedTabBar];
    eventImage = eventsImageList[selectedTabBar];
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final themeProvider = Provider.of<ThemeProvider>(context);
    enevtListProvider = Provider.of<EventsProvider>(context);
    userProvider = Provider.of<UserProvider>(context);
    currentEventProvider = Provider.of<CurrentEventProvider>(context);

    final List<String> eventIconsList = List.generate(9, (_) => AppAssets.pick);

    // Localized event names
    eventsNameList = [
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.bookClub,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
      AppLocalizations.of(context)!.workShop,
    ];

    eventName = eventsNameList[selectedTabBar];
    eventImage = eventsImageList[selectedTabBar];

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
        padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.02),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(eventImage, fit: BoxFit.contain),
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
                      unslectedColor: Theme.of(context).textTheme.headlineSmall!,
                      bodyColor: AppColor.primeColordark,
                      borderColor: AppColor.primeColordark,
                      isSlected: selectedTabBar == index,
                      iconData: eventIconsList[index],
                      eventText: eventsNameList[index],
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(width: height * 0.01),
                ),
              ),
              SizedBox(height: height * 0.01),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DescriptionText(text: AppLocalizations.of(context)!.title_label),
                    SizedBox(height: height * 0.01),
                    CustomTextformField(
                      controllerText: titleController,
                      validator: (text) => text!.isEmpty
                          ? AppLocalizations.of(context)!.validator_title
                          : null,
                      hintText: AppLocalizations.of(context)!.title_hint,
                      hinttextStyle: themeProvider.courrentThem == ThemeMode.light
                          ? AppStyles.inter16grey
                          : AppStyles.meduim16balck,
                      prefixicon: Icon(HeroIcons.pencil_square),
                    ),
                    SizedBox(height: height * 0.01),
                    DescriptionText(text: AppLocalizations.of(context)!.description_label),
                    SizedBox(height: height * 0.01),
                    CustomTextformField(
                      controllerText: descriptionController,
                      validator: (text) => text!.isEmpty
                          ? AppLocalizations.of(context)!.validator_description
                          : null,
                      hintText: AppLocalizations.of(context)!.description_hint,
                      maxLines: 3,
                      hinttextStyle: themeProvider.courrentThem == ThemeMode.light
                          ? AppStyles.inter16grey
                          : AppStyles.meduim16balck,
                    ),
                    SizedBox(height: height * 0.01),
                    CostumTimeordate(
                      ChooseDataOrTime: chooseDate,
                      eventTimeOrDate: savedate == null
                          ? AppLocalizations.of(context)!.choose_date_button
                          : DateFormat("dd/MM/yyyy").format(savedate!),
                      timeOrDate: AppLocalizations.of(context)!.event_date_label,
                      icon: HeroIcons.calendar,
                    ),
                    SizedBox(height: height * 0.01),
                    CostumTimeordate(
                      ChooseDataOrTime: chooseTime,
                      eventTimeOrDate: saveTime == null
                          ? AppLocalizations.of(context)!.choose_time_button
                          : saveTime!.format(context),
                      timeOrDate: AppLocalizations.of(context)!.event_time_label,
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
                            icon: Image.asset(AppAssets.imageLocation),
                          ),
                          SizedBox(width: width * 0.01),
                          Text(
                            AppLocalizations.of(context)!.location,
                            style: TextStyle(color: AppColor.primeColordark),
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                            child: IconButton(
                              onPressed: () {
                                // navigate or confirm location
                              },
                              icon: const Icon(Icons.arrow_forward_ios_outlined),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    CustomElevatedbuttom(
                      onButtonClick: updateEvent,
                      text: AppLocalizations.of(context)!.update_event,
                    ),
                    SizedBox(height: height * 0.02),
                  ],
                ),
              ),
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
    final getTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (getTime != null) {
      setState(() {
        saveTime = getTime;
        formatTime = getTime.format(context);
      });
    }
  }

  void updateEvent() {
    if (formKey.currentState!.validate()) {
      if (savedate == null || saveTime == null) {
        ToastUtils.toastMassage(
          backGroundColor: AppColor.red,
          textColor: AppColor.whiteColor,
          massage: AppLocalizations.of(context)!.no_favorites,
        );
        return;
      }

      final userId = userProvider.currentUser!.id!;
      final updatedEvent = Event(
        id: widget.event!.id,
        eventName: eventName!,
        image: eventImage,
        title: titleController.text,
        description: descriptionController.text,
        dateTime: savedate!,
        time: formatTime,
      );

      FireBaseUtils.updateEventInFirestore(updatedEvent, userId).then((value) {
        ToastUtils.toastMassage(
          backGroundColor: Colors.green,
          textColor: AppColor.whiteColor,
          massage: AppLocalizations.of(context)!.eating,
        );
        enevtListProvider.getAllEvents(userId);
        Navigator.of(context).pushReplacementNamed(HomeScreen.routHome);
      }).catchError((error) {
        print("Update Error: $error");
        ToastUtils.toastMassage(
          backGroundColor: AppColor.red,
          textColor: AppColor.whiteColor,
          massage: AppLocalizations.of(context)!.event_Failed,
        );
      });
    }
  }

  int _getEventIndex(String eventName) {
    final index = eventsNameList.indexOf(eventName);
    return index == -1 ? 0 : index;
  }

  TimeOfDay _parseTimeOfDay(String timeStr) {
    final format = DateFormat.jm();
    final dt = format.parse(timeStr);
    return TimeOfDay.fromDateTime(dt);
  }
}

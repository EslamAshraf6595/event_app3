import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
static const String eventColection = 'event_firestore_data';
  String id;
  String image, title, description;
  String eventName;
  DateTime dateTime;
  String time;
  bool isFavorite;
  Event(
      {this.id = '',
      required this.eventName,
      required this.image,
      required this.title,
      required this.description,
      required this.dateTime,
      required this.time,
      this.isFavorite = false});

//to convert from ORM to json
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'eventName': eventName,
      'image': image,
      'title': title,
      'description': description,
      'eventDate':
      dateTime.millisecondsSinceEpoch, //it will return date as an int
      'eventTime': time,
      'isFavorite': isFavorite,
    };
  }

  // to convert from json to ORM
  Event.fromFireStor(Map<String, dynamic> data)
      : this(
            id: data['id'],
            eventName: data['eventName'],
            image: data['image'],
            title: data['title'],
            description: data['description'],
            dateTime: DateTime.fromMillisecondsSinceEpoch(data['eventDate']),
            time: data['eventTime'],
           isFavorite: data['isFavorite']
           );
}

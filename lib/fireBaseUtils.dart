import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planing_app/model/firebaseAddEvent.dart';


class FireBaseUtils {
  static CollectionReference<Event> getEvnetColoection() {
    return FirebaseFirestore.instance
        .collection(Event.eventColection)
        .withConverter<Event>(
          fromFirestore: (snapshot, options) =>
              Event.fromFireStor(snapshot.data()!),
          toFirestore: (event, options) => event.toFirestore(),
        );
  }

  static Future<void> addEventToFireStor(Event event) {
    // FirebaseFirestore.instance
    //     .collection(Event.eventColection)
    //     .withConverter<Event>(
    //       fromFirestore: (snapshot, options) =>
    //           Event.fromFireStor(snapshot.data()!),
    //       toFirestore: (event, options) => event.toFirestore(),
    //     ); i take it and make a new function because i will use it a lot of time
    var eventCollection = getEvnetColoection(); //asign the collection
    DocumentReference<Event> docRefrance =
        eventCollection.doc(); //make a document
    event.id = docRefrance.id;
   // return getEvnetColoection().doc().set(event); if you want to amke it in one line
    return docRefrance.set(event);
  }
}

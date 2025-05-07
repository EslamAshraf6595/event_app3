import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planing_app/model/firebaseAddEvent.dart';
import 'package:event_planing_app/model/my_user.dart';

class FireBaseUtils {
  static CollectionReference<Event> getEvnetColoection(String uId) {
    return getUserCololection().doc(uId)
        .collection(Event.eventColection)
        .withConverter<Event>(
          fromFirestore: (snapshot, options) =>
              Event.fromFireStor(snapshot.data()!),
          toFirestore: (event, options) => event.toFirestore(),
        );

        // FirebaseFirestore.instance
        // .collection(Event.eventColection)
        // .withConverter<Event>(
        //   fromFirestore: (snapshot, options) =>
        //       Event.fromFireStor(snapshot.data()!),
        //   toFirestore: (event, options) => event.toFirestore(),
        // );
  }

  static CollectionReference<MyUser> getUserCololection() {
    return FirebaseFirestore.instance
        .collection(MyUser.coloectionName)
        .withConverter<MyUser>(
          fromFirestore: (snapshot, options) =>
              MyUser.fromFireStor(snapshot.data()!),
          toFirestore: (myUser, options) => myUser.toFirestore(),
        );
  }

  static Future<void> addUserToFireStore(MyUser myUser) {
    return getUserCololection().doc(myUser.id).set(myUser);
  }

  static Future<MyUser?> readUserFromFireStor(String id) async {
    var quarySnapshot = await getUserCololection().doc(id).get();
    return quarySnapshot.data();
  }

  static Future<void> addEventToFireStor(Event event,String uId) {
    // FirebaseFirestore.instance
    //     .collection(Event.eventColection)
    //     .withConverter<Event>(
    //       fromFirestore: (snapshot, options) =>
    //           Event.fromFireStor(snapshot.data()!),
    //       toFirestore: (event, options) => event.toFirestore(),
    //     ); i take it and make a new function because i will use it a lot of time
    var eventCollection = getEvnetColoection(uId); //asign the collection
    DocumentReference<Event> docRefrance =
        eventCollection.doc(); //make a document
    event.id = docRefrance.id;
    // return getEvnetColoection().doc().set(event); if you want to amke it in one line
    return docRefrance.set(event);
  }
static Future<void> updateEventInFirestore(Event event, String userId) {
  final doc = getEvnetColoection(userId).doc(event.id);
  return doc.set(event); // Using .set() instead of .update() ensures full overwrite
}


}

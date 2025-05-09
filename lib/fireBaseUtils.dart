import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planing_app/model/firebaseAddEvent.dart';
import 'package:event_planing_app/model/my_user.dart';

class FireBaseUtils {
  // Get the user's events subcollection with proper conversion
  static CollectionReference<Event> getEventsCollection(String userId) {
    return getUsersCollection()
        .doc(userId)
        .collection(Event.eventColection)
        .withConverter<Event>(
          fromFirestore: (snapshot, _) => Event.fromFireStor(snapshot.data()!),
          toFirestore: (event, _) => event.toFirestore(),
        );
  }

  // Get the main users collection with proper conversion
  static CollectionReference<MyUser> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.coloectionName)
        .withConverter<MyUser>(
          fromFirestore: (snapshot, _) => MyUser.fromFireStor(snapshot.data()!),
          toFirestore: (user, _) => user.toFirestore(),
        );
  }

  // Add a new user to Firestore
  static Future<void> addUserToFirestore(MyUser user) {
    return getUsersCollection().doc(user.id).set(user);
  }

  // Read user data from Firestore
  static Future<MyUser?> readUserFromFirestore(String userId) async {
    final snapshot = await getUsersCollection().doc(userId).get();
    return snapshot.data();
  }

  // Add a new event to Firestore and assign the generated ID
  static Future<void> addEventToFirestore(Event event, String userId) {
    final eventCollection = getEventsCollection(userId);
    final docRef = eventCollection.doc(); // Auto-generate ID
    event.id = docRef.id;
    return docRef.set(event);
  }

 // Update an existing event
  static Future<void> updateEventInFirestore(Event event, String userId) {
    return getEventsCollection(userId).doc(event.id).set(event);
  }

  // Delete an event
  static Future<void> deleteEventFromFirestore(String userId, String eventId) {
    return getEventsCollection(userId).doc(eventId).delete();
  }
}

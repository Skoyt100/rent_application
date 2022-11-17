import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_application/helpers/repository/constant_firebase.dart';

class FirestoreService {
  static Future<void> addHomePhone(String address, String code) async {
    DocumentReference ref =
        FirebaseFirestore.instance.collection('homePhones').doc();
    ref.set({'id': ref.id, 'address': address, 'code': code});
  }

  static Future<bool> initCurrentUser(String uid) async {
    try {
      bool value =
          await fbFirestore.collection('users').doc(uid).get().then((result) {
        if (result.exists) {
          return true;
        } else {
          return false;
        }
      });
      return value;
    } catch (e) {
      return false;
    }
  }

  static Future getUserById(String uid) async {
    DocumentSnapshot doc = await fbFirestore.collection('users').doc(uid).get();
    return doc.data();
  }
}

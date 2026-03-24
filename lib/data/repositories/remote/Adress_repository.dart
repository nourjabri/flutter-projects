import 'package:clickresturant/data/model/address_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AddressRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<AddressModel?> getAddress() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      return null;
    }
    final snap = await firestore.collection("users").doc(uid).get();
    if (!snap.exists || snap.data()?["address"] == null) return null;
    return AddressModel.fromMap(snap.data()!["address"]);
  }

  Future<void> saveAddress(AddressModel address) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) throw "User is not login";
    await firestore.collection("users").doc(uid).set({
      "address": address.tomap(),
    }, SetOptions(merge: true));
  }
}

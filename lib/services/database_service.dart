import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertemp/models/account.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future addUser(String companyName, String ownerName, String phoneNumber,
      String townCity, String pinCode, int district) async {
    bool success;
    await users
        .doc(uid)
        .set({
          "CompanyName": companyName,
          "OwnerName": ownerName,
          "PhoneNumber": phoneNumber,
          "TownCity": townCity,
          "PinCode": pinCode,
          "District": district.toString()
        })
        .then((value) => success = true)
        .catchError((error) => success = false);
    return success;
  }

  Account _accountFromSnapshot(DocumentSnapshot snapshot) {
    return Account(
        firstName: snapshot.data()["FirstName"] ?? '',
        lastName: snapshot.data()["LastName"] ?? '',
        companyName: snapshot.data()["CompanyName"] ?? '',
        ownerName: snapshot.data()["OwnerName"] ?? '',
        phonenumber: snapshot.data()["PhoneNumber"] ?? '',
        townCity: snapshot.data()["TownCity"] ?? '',
        pinCode: snapshot.data()["PinCode"] ?? '',
        districtNumber: snapshot.data()["District"] ?? '');
  }

  Future<Account> get getUserInfos {
    return users.doc(uid).get().then((value) => _accountFromSnapshot(value));
  }

  Future<DocumentSnapshot> getUserInfo(String uid) async {
    return await users.doc(uid).get();
  }
}

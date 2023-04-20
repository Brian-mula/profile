import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:payroll/models/usersModel.dart';

class UsersController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference users = FirebaseFirestore.instance.collection("users");

// ! get a stream of all users
  // Stream get allUsers => _firestore.collection('users').snapshots();
  Stream<List<UsersModel>> allUser() {
    return users.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return UsersModel.fromJson(
            doc as DocumentSnapshot<Map<String, dynamic>>);
      }).toList();
    });
  }

// ! add a new user
// will usually take place during registration
  Future<void> addUser(UsersModel usersModel) async {
    try {
      await users
          .add({"username": usersModel.username, "email": usersModel.email});
    } catch (e) {
      print(e.toString());
    }
  }

  // !edit the existing user
  //  wil majorly be done by admins

  Future<void> edituser(UsersModel usersModel, String id) async {
    try {
      await users
          .doc(id)
          .update({'username': usersModel.username, 'email': usersModel.email});
    } catch (e) {
      print(e.toString());
    }
  }
}

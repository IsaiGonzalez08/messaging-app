import 'package:app_mensajeria/domain/models/User/repository/user_repository.dart';
import 'package:app_mensajeria/domain/models/User/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<UserModel> loginUser(String email, String password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user != null) {
        DocumentSnapshot userData =
            await firestore.collection('users').doc(user.uid).get();

        if (userData.exists) {
          return UserModel.fromJson({
            'id': user.uid,
            'name': userData['name'],
            'lastname': userData['lastname'],
            'email': userData['email'],
          });
        } else {
          throw Exception("User data not found");
        }
      } else {
        throw Exception("User not found");
      }
    } catch (e) {
      throw Exception("Login failed: ${e.toString()}");
    }
  }

  @override
  Future<void> createUser(
      String name, String lastname, String email, String password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;

      if (user != null) {
        await firestore.collection('users').doc(user.uid).set({
          'name': name,
          'lastname': lastname,
          'email': email,
        });
      }
    } catch (e) {
      print('El error es $e');
    }
  }
}

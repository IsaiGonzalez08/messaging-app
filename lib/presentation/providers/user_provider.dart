import 'package:app_mensajeria/domain/models/User/repository/user_repository.dart';
import 'package:app_mensajeria/infrastructure/repositories/User/user_repository_impl.dart';
import 'package:flutter/foundation.dart';

import '../../domain/models/User/user.dart';

class UserProvider extends ChangeNotifier {
  final UserRepository _userRepository = UserRepositoryImpl();
  late UserModel _user = UserModel(id: '', name: '', lastname: '', email: '');

  UserModel get userData => _user;

  Future<void> loginUser(String email, String password) async {
    UserModel userData = await _userRepository.loginUser(email, password);
    _user = userData;
    notifyListeners();
  }
}

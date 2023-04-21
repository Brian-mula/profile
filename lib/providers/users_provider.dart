import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:payroll/database/users_db.dart';
import 'package:payroll/models/usersModel.dart';

final usersProvider = Provider<UsersController>((ref) {
  return UsersController();
});

final allUsersProvider = StreamProvider<List<UsersModel>>((ref) {
  return ref.read(usersProvider).allUser();
});

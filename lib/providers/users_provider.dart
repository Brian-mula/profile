import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:payroll/database/users_db.dart';

final usersProvider = Provider<UsersController>((ref) {
  return UsersController();
});

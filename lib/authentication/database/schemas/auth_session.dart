import 'package:isar/isar.dart';
// part 'auth_session.g.dart';

@Collection()
class AuthSession {
  AuthSession({
    required this.id,
    required this.lastAccess,
    required this.sessionType,
  });
  final Id id;

  @enumerated
  final DateTime lastAccess;

  @enumerated
  final SessionType sessionType;
}

enum SessionType {
  signIn,
  access,
  signOut,
}

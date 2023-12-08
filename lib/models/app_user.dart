import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@Freezed()
class AppUser with _$AppUser {
  const factory AppUser({
    required String id,
    required String name,
    required int phoneNumber,
    required String emailAddress,
    required String? photoUrl,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  factory AppUser.empty() {
    const uuid = Uuid();
    return AppUser(
      id: uuid.v4(),
      name: '',
      phoneNumber: 0,
      emailAddress: '',
      photoUrl: '',
    );
  }
}

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../authentication/providers/authentication_controller_provider.dart';
import '../models/app_user.dart';
import '../repositories/user_repository.dart';

final appUserControllerProvider =
    AsyncNotifierProvider<AppUserController, AppUser?>(AppUserController.new);

class AppUserController extends AsyncNotifier<AppUser?> {
  UserRepository get _userRepository => ref.watch(userRepositoryProvider);

  @override
  Future<AppUser?> build() async {
    final user = ref.watch(authenticationControllerProvider);
    if (user.value == null) return null;
    if (user.value?.uid == null) return null;

    final appUserExists = await _userRepository.isUserExists(user.value!.uid);
    if (appUserExists) {
      final appUser = await _userRepository.getUser(user.value!.uid);
      return appUser;
    } else {
      return null;
    }
  }

  Future<void> createUser(AppUser user) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await _userRepository.createUser(user);
      return user;
    });
  }
}

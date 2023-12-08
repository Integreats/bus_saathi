import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/app_user.dart';

final appUserProvider = StateNotifierProvider<AppUserProvider, AppUser?>((ref) {
  return AppUserProvider();
});

class AppUserProvider extends StateNotifier<AppUser?> {
  AppUserProvider({AppUser? appUser}) : super(appUser);

  void signInUser(AppUser user) {
    state = user;
  }

  void signOutUser() {
    if (state != null) {
      state = null;
    }
  }
}

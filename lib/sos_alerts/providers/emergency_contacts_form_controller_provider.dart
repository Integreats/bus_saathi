import 'package:bus_saathi/app_user/providers/app_user_controller_provider.dart';
import 'package:bus_saathi/sos_alerts/models/emergency_contact.dart';
import 'package:bus_saathi/sos_alerts/repositories/sos_repository.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../app_user/models/app_user.dart';
import '../../models/form_type.dart';
import '../../router/router.dart';
import '../screens/emergency_contacts_form_screen.dart';

final emergencyContactFormControllerProvider =
    NotifierProvider<EmergencyContactFormNotifier, EmergencyContact>(
        EmergencyContactFormNotifier.new);

class EmergencyContactFormNotifier extends Notifier<EmergencyContact> {
  EmergencyContactFormNotifier({
    this.initialEmergencyContact,
  });

  final EmergencyContact? initialEmergencyContact;

  GoRouter get _router => ref.watch(routerProvider);
  AppUser? get _appUser => ref.watch(appUserControllerProvider).value;

  SosRepository get _sosRepository => ref.watch(sosRepositoryProvider);

  @override
  build() {
    return initialEmergencyContact ??
        EmergencyContact.empty().copyWith(
          userId: _appUser!.id,
        );
  }

  void updateName(String? name) {
    state = state.copyWith(
      name: name!.trim(),
    );
  }

  void updatePhoneNumber(String? phoneNumber) {
    if (phoneNumber != "" && phoneNumber != null) {
      state = state.copyWith(
        phoneNumber: int.parse(phoneNumber),
      );
    }
  }

  void updateEmailAddress(String? emailAddress) {
    state = state.copyWith(
      emailAddress: emailAddress!.trim(),
    );
  }

  Future<bool> save(FormType formType) async {
    bool isSaved = false;

    final conductor = state;
    final formKey = ref.read(emergencyContactFormKeyProvider);

    switch (formType) {
      case FormType.create:
        if (formKey.currentState!.validate()) {
          await _sosRepository.addEmergencyContact(conductor);
          isSaved = true;
          _router.pop();
        }
        break;
      case FormType.read:
        _router.pushReplacement(
          '/conductor/edit/${conductor.id}',
          extra: conductor,
        );
        break;
      case FormType.edit:
        if (formKey.currentState!.validate()) {
          await _sosRepository.updateEmergencyContact(conductor);
          isSaved = true;
          _router.pop();
        }
        break;
      default:
    }
    return isSaved;
  }
}

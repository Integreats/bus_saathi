import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../services/firestore_services.dart';
import '../../widgets/selectors/language_selector.dart';
import '../authentication/widgets/mode_selector.dart';
import '../locale/locale.dart';
import '../models/tracking_mode.dart';
import '../providers/app_user_preferences_provider.dart';
import '../providers/conductor_provider.dart';
import '../providers/current_trip_provider.dart';
import '../router/router.dart';
import '../trip_management/models/trip.dart';
import '../user_management/conductor/models/conductor.dart';
import 'bus_number_textfield.dart';
import 'buttons/elevated_loader_button.dart';
import 'mobile_number_text_field.dart';
import 'snackbars/show_failure_snackbar.dart';

class TrackForm extends StatefulHookConsumerWidget {
  const TrackForm({
    super.key,
  });

  @override
  ConsumerState<TrackForm> createState() => _TrackFormState();
}

class _TrackFormState extends ConsumerState<TrackForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String number = "";
  late ValueNotifier<TrackingMode> trackingMode;

  @override
  void initState() {
    super.initState();
    trackingMode = ValueNotifier(TrackingMode.conductorPhone);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Text(
            $strings.trackBusMessage,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(),
          ),
        ),
        TrackingModeSelector(
          onChanged: (index) {
            trackingMode.value = TrackingModeExtension.getModeByIndex(index);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ValueListenableBuilder(
                valueListenable: trackingMode,
                builder: (context, value, _) {
                  Widget child;
                  if (value == TrackingMode.busNumber) {
                    child = BusNumberTextField(
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          number = value;
                        }
                      },
                      onSaved: (value) {
                        if (value != null) {
                          number = value;
                        }
                      },
                    );
                  } else {
                    child = MobileNumberTextField(
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          number = value;
                        }
                      },
                      onSaved: (value) {
                        if (value != null) {
                          number = value;
                        }
                      },
                    );
                  }
                  return AnimatedSwitcher(
                    switchInCurve: Curves.easeIn,
                    switchOutCurve: Curves.easeOut,
                    duration: const Duration(milliseconds: 700),
                    child: child,
                  );
                },
              ),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 56,
                child: ElevatedLoaderButton(
                  label: Text($strings.trackBus),
                  onPressed: () async {
                    if (FocusManager.instance.primaryFocus!.hasPrimaryFocus) {
                      FocusManager.instance.primaryFocus?.unfocus(
                          disposition:
                              UnfocusDisposition.previouslyFocusedChild);
                    }

                    await trackBus();
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> trackBus() async {
    formKey.currentState?.save();
    Conductor conductor;
    if (trackingMode.value == TrackingMode.conductorPhone) {
      try {
        conductor = await FirestoreServices.getConductorByPhoneNumber(number);
      } on Exception {
        showFailureSnackbar(
          context,
          title: $strings.busNotFound,
          message: $strings.recheckPhoneNumberOfConductor,
        );
        return;
      }
    } else {
      try {
        conductor = await FirestoreServices.getConductorByBusNumber(number);
      } on Exception {
        showFailureSnackbar(
          context,
          title: $strings.busNotFound,
          message: $strings.recheckBusNumberOfConductor,
        );
        return;
      }
    }
    ref.read(conductorProvider.notifier).state = conductor;
    Trip? currentTrip =
        await FirestoreServices.getCurrentTripByConductorId(conductor.id);
    ref.read(currentTripProvider.notifier).state = currentTrip;
    if (currentTrip != null) {
      // if (currentTrip.route != null) {
      // route_model.Route busRouteWithETA = await ref
      //     .read(routeServiceProvider)
      //     .getRouteETA(currentTrip: currentTrip);
      // ref.read(routeProvider.state).update(
      //       (state) => busRouteWithETA,
      //     );
      // }
      if (mounted) {
        context.go('${ScreenPaths.homeScreen}/${ScreenPaths.trackBus}');
      }
    } else {
      if (mounted) {
        showFailureSnackbar(
          context,
          title: $strings.noActiveTrip,
          message: $strings.noActiveTripMessage,
        );
      }
    }
  }
}

class LanguageSelectorButton extends StatelessWidget {
  const LanguageSelectorButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: HookConsumer(
        builder: (context, ref, _) {
          String localeName = ref.watch(appUserPreferencesProvider
                      .select((value) => value.locale)) ==
                  const Locale('en')
              ? "English"
              : "ಕನ್ನಡ";
          return GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return LanguagePickerDialog(
                    initialLocale: ref.read(appUserPreferencesProvider).locale,
                    onLocaleSelected: (locale) async {
                      await ref
                          .read(appUserPreferencesProvider.notifier)
                          .updateLocale(locale);
                    },
                  );
                },
              );
            },
            child: Container(
              height: 36,
              decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Center(
                  child: Text(
                    localeName,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

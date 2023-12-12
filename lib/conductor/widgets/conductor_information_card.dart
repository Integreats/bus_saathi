// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../../themes/custom_colors.dart';
// import '../models/conductor.dart';

// class ConductorInformationCard extends HookConsumerWidget {
//   const ConductorInformationCard({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     Conductor conductor = ref.read(appUserProvider)!.user as Conductor;

//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         height: 128,
//         decoration: BoxDecoration(
//           color: CustomColors.black,
//           borderRadius: BorderRadius.circular(27),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Builder(
//                 builder: (context) {
//                   if (conductor.profilePicture == null ||
//                       conductor.profilePicture == "") {
//                     return CircleAvatar(
//                       radius: 22,
//                       backgroundColor: Theme.of(context)
//                           .colorScheme
//                           .primary
//                           .withOpacity(0.15),
//                       child: Text(
//                         conductor.name.substring(0, 1),
//                         style: TextStyle(
//                           color: Theme.of(context).colorScheme.primary,
//                         ),
//                       ),
//                     );
//                   } else {
//                     return SizedBox.square(
//                       dimension: 85,
//                       child: Hero(
//                         tag: conductor.profilePicture!,
//                         child: CachedNetworkImage(
//                           imageUrl: conductor.profilePicture!,
//                           imageBuilder: (context, imageProvider) =>
//                               CircleAvatar(
//                             radius: 120,
//                             backgroundColor: Theme.of(context)
//                                 .colorScheme
//                                 .primary
//                                 .withOpacity(0.15),
//                             backgroundImage: imageProvider,
//                           ),
//                         ),
//                       ),
//                     );
//                   }
//                 },
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   FittedBox(
//                     child: SizedBox(
//                       child: Text(
//                         conductor.name,
//                         textAlign: TextAlign.end,
//                         style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                               fontSize: 19,
//                               color: const Color(0xFFE7F6F2),
//                             ),
//                       ),
//                     ),
//                   ),
//                   Text(
//                     '+91 ${PhoneNumberFormatterService.formatIndiaPhoneNumberWithoutCode(conductor.phoneNumber)}',
//                     textAlign: TextAlign.end,
//                     style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                           color: const Color(0xFFE7F6F2).withOpacity(0.85),
//                         ),
//                   ),
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.end,
//                   //   children: [
//                   //     Text(
//                   //       conductor.bus.licensePlateNumber,
//                   //       textAlign: TextAlign.end,
//                   //       style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                   //             color: const Color(0xFFE7F6F2).withOpacity(0.75),
//                   //           ),
//                   //     ),
//                   //   ],
//                   // )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

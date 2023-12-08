import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

void showWarningSnackbar(
  BuildContext context, {
  String? title,
  String? message,
}) {
  final SnackBar snackBar = SnackBar(
    elevation: 0,
    padding: const EdgeInsets.symmetric(vertical: 24),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: title ?? 'Caution Ahead!',
      message: message ?? 'There was an error processing your request😟',
      contentType: ContentType.warning,
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

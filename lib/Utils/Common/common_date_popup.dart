import 'package:flutter/material.dart';

import 'themedata.dart';

void presentDatePicker(context) {
  DateTime? selectedDate;
  TextEditingController dateController = TextEditingController();

  showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2050),
    builder: (context, child) {
      return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.buttoncolour,
              onPrimary: AppColors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.buttoncolour,
              ),
            ),
          ),
          child: child!);
    },
  ).then((pickedDate) {
    if (pickedDate == null) {
      return;
    }
    // setState(() {
    selectedDate = pickedDate;
    dateController.text =
        "  ${selectedDate!.day.toString()}/${selectedDate!.month.toString().padLeft(2, '0')}/${selectedDate!.year.toString().padLeft(2, '0')}";
    // });
  });
}

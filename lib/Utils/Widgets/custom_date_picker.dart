import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Common/texts.dart';
import '../Common/themedata.dart';

class CustomDatePicker extends StatefulWidget {
  CustomDatePicker(
      {super.key,
      this.hintText,
      this.leadingImage,
      this.trailingImage,
      this.usingPng,
      this.onTap,
      this.multiLines});

  final String? leadingImage;
  final TextEditingController dateController = TextEditingController();
  final void Function()? onTap;
  final String? trailingImage;
  final String? hintText;
  final bool? usingPng;
  final bool? multiLines;

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? _selectedDate;

  TextEditingController dateController = TextEditingController();

  void _presentDatePicker() {
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
      setState(() {
        _selectedDate = pickedDate;
        dateController.text =
            "  ${_selectedDate!.day.toString()}/${_selectedDate!.month.toString().padLeft(2, '0')}/${_selectedDate!.year.toString().padLeft(2, '0')}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // var activeTyping = false.obs;
    return InkWell(
      onTap: () {
        _presentDatePicker();
      },
      child: Container(
        padding: EdgeInsets.only(right: 15.w, left: 8.w),
        width: double.infinity,
        height: 50.h,
        decoration: ShapeDecoration(
          color: const Color(0xFFFEF3F8),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 0.40, color: Color(0xFFFEF3F8)),
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (dateController.text.isEmpty
                ? text9B9B9B_15w400('Select Date')
                : text373434_15w400(dateController.text)),
            Icon(
              Icons.calendar_today,
              color: AppColors.buttoncolour,
              size: 15.w,
            ),
          ],
        ),
      ),
    );
  }
}

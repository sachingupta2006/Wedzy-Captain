import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Common/sized_box.dart';
import '../Common/texts.dart';

class CustomTimePicker extends StatefulWidget {
  const CustomTimePicker({super.key, required this.txt});
  final String txt;
  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  final TextEditingController _textEditingController = TextEditingController();
  TimeOfDay? _selectedTime;

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
        String period = _selectedTime!.period == DayPeriod.am ? "AM" : "PM";
        int hour = _selectedTime!.hourOfPeriod;
        int minute = _selectedTime!.minute;
        _textEditingController.text =
            "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _selectTime(context);
      },
      child: Container(
        padding: EdgeInsets.only(right: 8.w, left: 8.w),
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
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sizedBoxWidth(5.w),
            Image.asset('assets/images/time.png'),
            sizedBoxWidth(15.w),
            (_textEditingController.text.isEmpty
                ? text9B9B9B_15w400('${widget.txt} Time')
                : text9B9B9B_15w400(_textEditingController.text)),
          ],
        ),
      ),
    );
  }
}

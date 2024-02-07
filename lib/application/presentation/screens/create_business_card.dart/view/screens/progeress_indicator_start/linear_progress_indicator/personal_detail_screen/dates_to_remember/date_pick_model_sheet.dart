import 'package:bizkit/application/presentation/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class DatePickingBottomSheet extends StatelessWidget {
  const DatePickingBottomSheet({
    super.key,
    required this.datePicker,
    required this.onPressed,
  });

  final TextEditingController datePicker;
  final void Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: kwidth * 4.8 / 4,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Choose the date',
                  //style: textHeadMedium1.copyWith(fontSize: sWidth * 0.04),
                ),
                Icon(
                  Icons.calendar_month_outlined,
                  color: neonShade,
                ),
              ],
            ),
          ),
          adjustHieght(20),
          Column(
            children: [
              CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(
                  const Duration(days: 365 * 100),
                ),
                onDateChanged: (date) {
                  int year = date.year;
                  int month = date.month;
                  int day = date.day;
                  print(date);
                  onPressed('$day-$month-$year');
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancel',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'ok',
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/theme.dart';

class DateCard extends StatefulWidget {
  @override
  State<DateCard> createState() => _DateCardState();
}

class _DateCardState extends State<DateCard> {
  DatePickerController _controller = DatePickerController();

  DateTime _selectedValue = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DatePicker(
        DateTime.now(),
        width: 60,
        height: 80,
        controller: _controller,
        initialSelectedDate: DateTime.now(),
        selectionColor: bluishClr.withOpacity(1),
        selectedTextColor: Colors.white,
        onDateChange: (date) {
          // New date selected
          setState(() {
            _selectedValue = date;
          });
        },
      ),
    );
  }
}

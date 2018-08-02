import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class _InputDropdown extends StatelessWidget {
  const _InputDropdown({
    Key key,
    this.child,
    this.decoration,
    this.valueText,
    this.valueStyle,
    this.onPressed }) : super(key: key);

  final String valueText;
  final TextStyle valueStyle;
  final VoidCallback onPressed;
  final Widget child;
  final InputDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: InputDecorator(
        decoration: decoration,
        baseStyle: valueStyle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(valueText, style: valueStyle),
            Icon(Icons.arrow_drop_down,
              color: Theme.of(context).brightness == Brightness.light ? Colors.grey.shade700 : Colors.white70
            ),
          ],
        ),
      ),
    );
  }
}

class DatePicker extends StatelessWidget {
  const DatePicker({
    Key key,
    @required this.decoration,
    this.selectedDate,
    this.selectDate,
    this.valueStyle,
    this.firstDate,
    this.lastDate,
  }) : super(key: key);

  final InputDecoration decoration;
  final DateTime selectedDate;
  final ValueChanged<DateTime> selectDate;
  final TextStyle valueStyle;
  final DateTime firstDate;
  final DateTime lastDate;

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDatePickerMode: DatePickerMode.year,
      initialDate: selectedDate,
      firstDate: firstDate ?? DateTime(1980, 1),
      lastDate: lastDate ?? DateTime.now()
    );
    if (picked != null && picked != selectedDate)
      selectDate(picked);
  }
  
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: _InputDropdown(
            decoration: decoration,
            valueText: DateFormat.yMMMMd().format(selectedDate),
            valueStyle: valueStyle,
            onPressed: () { _selectDate(context); },
          ),
        ),
      ],
    );
  }
}
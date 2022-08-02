import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'format_date.dart';

typedef DateCallback = void Function(DateTime date);
showwDatePicker({
  @required BuildContext? context,
  @required DateCallback? onChanged,
}) {
  DatePicker.showDatePicker(context!,
      showTitleActions: true,
      minTime: DateTime.now(),
      maxTime: DateTime(DateTime.now().year + 10, 9),
      theme: DatePickerTheme(
        headerColor: Colors.blue[900],
        backgroundColor: Colors.white,
        itemStyle: const TextStyle(
            color: Colors.black87, fontSize: 16, fontFamily: 'Poppin Regular'),
        cancelStyle: const TextStyle(
            color: Colors.white, fontSize: 16, fontFamily: 'Poppin Regular'),
        doneStyle: const TextStyle(
            color: Colors.white, fontSize: 16, fontFamily: 'Poppin Regular'),
      ),
      onChanged: (date) {},
      onConfirm: (date) => onChanged!(date),
      currentTime: DateTime.now(),
      locale: LocaleType.id);
}

showwDatePickerForWithDraw({
  @required BuildContext? context,
  @required DateCallback? onChanged,
  @required DateTime? minTime,
  @required DateTime? maxTime,
}) {
  DatePicker.showDatePicker(context!,
      showTitleActions: true,
      minTime: minTime,
      maxTime: maxTime,
      theme: DatePickerTheme(
        headerColor: Colors.blue[900],
        backgroundColor: Colors.white,
        itemStyle: const TextStyle(
            color: Colors.black87, fontSize: 16, fontFamily: 'Poppin Regular'),
        cancelStyle: const TextStyle(
            color: Colors.white, fontSize: 16, fontFamily: 'Poppin Regular'),
        doneStyle: const TextStyle(
            color: Colors.white, fontSize: 16, fontFamily: 'Poppin Regular'),
      ),
      onChanged: (date) {},
      onConfirm: (date) => onChanged!(date),
      currentTime: DateTime.now(),
      locale: LocaleType.id);
}

typedef MonthCallback = void Function(String bulan, String bulanforSend);
Widget showwMonthPicker(
    {@required DateTime? selectedDate, MonthCallback? onChanged}) {
  dp.DatePickerRangeStyles styles = dp.DatePickerRangeStyles(
    selectedPeriodLastDecoration: BoxDecoration(
        color: Colors.blue[900],
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0))),
    selectedPeriodStartDecoration: const BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)),
    ),
    selectedPeriodMiddleDecoration:
        const BoxDecoration(color: Colors.yellow, shape: BoxShape.rectangle),
  );

  return CalendarDatePicker(
    initialDate: DateTime.now(),
    currentDate: selectedDate,
    onDateChanged: (date) =>
        onChanged!(formatViewIuranBulan(date), formatInputIuran(date)),
    firstDate: DateTime(DateTime.now().year, DateTime.now().month - 2,
        DateTime.now().day, DateTime.now().hour - 1),
    lastDate: DateTime(DateTime.now().year + 1, 9),
    // datePickerStyles: styles,
  );
}

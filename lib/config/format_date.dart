import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:jiffy/jiffy.dart';

String formatInputIuran(DateTime date) {
  initializeDateFormatting('id', null);
  final f = DateFormat('yyyy-MM-dd', 'id');
  return (f.format(date));
}

String formatViewIuran(DateTime date) {
  initializeDateFormatting('id', null);
  final f = DateFormat('dd MMMM yyyy', 'id');
  return (f.format(date));
}

String formatViewIuranBulan(DateTime date) {
  initializeDateFormatting('id', null);
  final f = DateFormat('MMMM', 'id');
  return (f.format(date));
}

String formatInputPolling(DateTime date) {
  initializeDateFormatting('id', null);
  final f = DateFormat('yyyy-MM-dd hh:mm:ss', 'id');
  return (f.format(date));
}

String formatViewPolling(DateTime date) {
  initializeDateFormatting('id', null);
  final f = DateFormat('dd MMMM yyyy', 'id');
  return (f.format(date));
}

getTgl(String? newTanggal) {
  final jiffy =
      Jiffy(newTanggal.toString(), "yyyy-MM-dd").format("dd, MMM yyyy");
  print(jiffy.toString());

  return jiffy;
}

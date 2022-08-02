import 'package:intl/intl.dart';

// final oCcy = NumberFormat("#,##0.00", "id_ID");
NumberFormat oCcy = NumberFormat.currency(
  locale: 'id_ID',
  symbol: 'Rp. ',
  decimalDigits: 0,
);

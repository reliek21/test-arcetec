import 'package:intl/intl.dart';

String formatStringNumber(String number) {
  String result = number.replaceAll(',', '');
  double numericValue = double.parse(result);

  String formattedNumber = NumberFormat('#,##0').format(numericValue);
  return formattedNumber;
}

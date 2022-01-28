import 'package:intl/intl.dart';

String formatUTCDate(String date) {
  var inputFormat =
      DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"); //2021-08-31T01:29:33.349Z
  var inputDate = inputFormat.parse(date);
  var outputFormat = DateFormat('hh:mm a');
  var outputDate = outputFormat.format(inputDate);
  return outputDate;
}

DateTime formatDate(String date) {
  var inputFormat = DateFormat("yyyy-MM-dd hh:mm");
  var inputDate = inputFormat.parse(date);
  return inputDate;
}

DateTime formatDateOnly(String date) {
  var inputFormat = DateFormat("dd-MM-yyyy");
  var inputDate = inputFormat.parse(date);
  return inputDate;
}

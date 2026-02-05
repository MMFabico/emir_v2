String formatDateTime(DateTime dateTime) {
  String year = dateTime.year.toString();
  String month = dateTime.month.toString().padLeft(2, '0');
  String day = dateTime.day.toString().padLeft(2, '0');
  String hour = (dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12).toString();
  String minute = dateTime.minute.toString().padLeft(2, '0');
  String amPm = dateTime.hour >= 12 ? 'PM' : 'AM';

  return "$year-$month-$day $hour:$minute $amPm";
}
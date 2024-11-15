String refactorDate(DateTime dateTime) {
  return '${refactorDay(dateTime.day)}.${dateTime.month}.${dateTime.year} ${dateTime
      .hour}:${dateTime.minute}:${dateTime.second} ${dateTime.timeZoneName}';
}

String refactorDay(int day) {
  if (day < 9) {
    return '0$day';
  } else {
    return day.toString();
  }
}
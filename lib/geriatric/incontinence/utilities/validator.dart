// ignore_for_file: body_might_complete_normally_nullable

Map<String, dynamic> validateField = {
  'title': isValidTitle,
  'date': isValidDate,
  'time': isValidTime,
  'else': null,
};

String? isValidTitle(String? title) {
  if (title!.isEmpty) {
    return 'Title Of Reminder required';
  }
}

String? isValidDate(String? date) {
  if (date!.isEmpty) {
    return 'Date Of Reminder required';
  }
}

String? isValidTime(String? time) {
  if (time!.isEmpty) {
    return 'Time Required';
  }
}

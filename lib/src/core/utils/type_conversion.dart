String toString(Object value) {
  if (value != null) {
    try {
      String string = value.toString();
      return string;
    } on Exception catch (e, s) {
      print("toString Exception : $e\n$s");
    }
  }
  print("Error in toInt $value");
  return '';
}

int toInt(Object value) {
  if (value != null) {
    try {
      int number = int.parse('$value');
      return number;
    } on Exception catch (e, s) {
      print("toInt Exception : $e\n$s");
    }
  }
  print("Error in toInt $value");
  return 0;
}

///Parse an object to double if not valid returns 0
///
double toDouble(Object value) {
  if (value != null) {
    try {
      double number = double.parse('${value}');
      return number;
    } on Exception catch (e, s) {
      print("toDouble Exception : $e\n$s");
    }
  }
  print("Error in toDouble $value");
  return 0;
}

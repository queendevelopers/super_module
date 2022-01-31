const bool defaultBool = false;
const int defaultInt = 0;
const double defaultDouble = 0;
const String defaultString = '';

extension MapExtension on Map {
  /// Reads a [key] value of [bool] type from [Map].
  ///
  /// If value/map is NULL or not [bool] type return default value [defaultBool]
  ///
  bool getBool(String key) {
    Map data = this;
    if (data == null) {
      data = {};
    }
    if (data.containsKey(key)) if (data[key] is bool)
      return this[key] ?? defaultBool;
    print("Map.getBool[$key] has incorrect data : $this");
    return defaultBool;
  }

  /// Reads a [key] value of [int] type from [Map].
  ///
  /// If value/map  is NULL or not [int] type return default value [defaultInt]
  ///
  int getInt(String key) {
    Map data = this;
    if (data == null) {
      data = {};
    }
    if (data.containsKey(key)) return toInt(data[key]);
    print("Map.getInt[$key] has incorrect data : $this");
    return defaultInt;
  }

  /// Reads a [key] value of [double] type from [Map].
  ///
  /// If value/map  is NULL or not [double] type return default value [defaultDouble]
  ///
  double getDouble(String key) {
    Map data = this;
    if (data == null) {
      data = {};
    }
    if (data.containsKey(key)) return toDouble(data[key]);
    print("Map.getDouble[$key] has incorrect data : $this");
    return defaultDouble;
  }

  /// Reads a [key] value of [String] type from [Map].
  ///
  /// If value/map  is NULL or not [String] type return default value [defaultString]
  ///.
  String getString(String key) {
    Map data = this;
    if (data == null) {
      data = {};
    }
    if (data.containsKey(key)) if (data[key] is String)
      return data[key] ?? defaultString;
    print("Map.getString[$key] has incorrect data : $this");
    return defaultString;
  }

  /// Reads a [key] value of [List] type from [Map].
  ///
  /// If value/map  is NULL or not [List] type return default value [defaultString]
  ///
  List<T> getList<T>(String key) {
    Map data = this;
    if (data == null) {
      data = {};
    }
    if (data.containsKey(key)) if (data[key] is List<T>)
      return data[key] ?? <T>[];
    print("Map.getString[$key] has incorrect data : $this");

    return <T>[];
  }
}

///Parse an object to int if not valid returns 0
///
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
  try {
    double number = double.parse('$value');
    return number;
  } on Exception catch (e, s) {
    print("toDouble Exception : $e\n$s");
  }
  print("Error in toDouble $value");
  return 0;
}

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();
  factory FFAppState() => _instance;
  FFAppState._internal();

  final Map<String, dynamic> _data = {};

  dynamic operator [](String key) => _data[key];
  void operator []=(String key, dynamic value) => _data[key] = value;
}

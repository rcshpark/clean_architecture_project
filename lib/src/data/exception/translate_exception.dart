class TranslateException implements Exception {
  final String _message;

  TranslateException(this._message);

  @override
  toString() {
    return "TranslateException: $_message";
  }
}

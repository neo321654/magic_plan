extension StringExt on String {
  // String get tr => CsvLocalizations.instance.string(this);
  //todo если перевода нет ,то возвращаем туже строку , если есть берем по ключу
  String get tr => this;
}

extension DoubleToFigmaExt on double {
  static const double correctionToFigma = 1.058;
  double get toFigma => this*correctionToFigma;
}
extension IntToFigmaExt on int {
  static const double correctionToFigma = 1.058;
  double get toFigma => this*correctionToFigma;
}
extension StringExt on String {
  // String get tr => CsvLocalizations.instance.string(this);
  //todo если перевода нет ,то возвращаем туже строку , если есть берем по ключу
  String get tr => this;
}
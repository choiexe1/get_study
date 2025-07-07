import 'package:flutter/material.dart';

abstract interface class I18nViewModel {
  Locale get locale;

  void changeLocale(Locale locale);
}

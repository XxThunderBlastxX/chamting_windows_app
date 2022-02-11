import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:system_theme/system_theme.dart';

class Theme extends ChangeNotifier {
  final _accentColor = SystemTheme.accentInstance.accent;

  get accentColor {
    return _accentColor;
  }
}

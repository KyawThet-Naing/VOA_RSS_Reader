import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  Future<dynamic> pushPage(Widget pageWidget) =>
      Navigator.push(this, MaterialPageRoute(builder: (context) => pageWidget));
}

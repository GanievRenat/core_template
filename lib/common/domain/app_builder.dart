import 'package:flutter/material.dart';

abstract class AppBuilder {
  Widget buildApp(RouterConfig<Object> routerConfig);
}

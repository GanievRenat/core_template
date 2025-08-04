import 'package:flutter/material.dart';

extension EmailValidatorExtension on String {
  String phoneFormat() => replaceAllMapped(
    RegExp(r'(\d{2})(\d{3})(\d{3})(\d+)'),
    (final Match m) => '${m[1]} (${m[2]}) ${m[3]}-${m[4]}',
  );

  Color? get color {
    if (isEmpty) return null;

    final channels = split(', ');

    if (channels.length < 3) return null;

    final result = channels.map((e) => num.parse(e).toInt()).toList();

    return Color.fromRGBO(result[0], result[1], result[2], 1);
  }

  String? districtFormat() {
    if (isEmpty) return null;

    final location = split(', ');
    if (location.length < 3) return null;

    location.removeAt(0);
    location.removeLast();
    return location.join(', ');
  }
}

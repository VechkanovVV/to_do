import 'package:flutter/material.dart';

enum SortLabel {
  high('high', Colors.red),
  medium('medium', Colors.yellow),
  low('low', Colors.green),
  favourite('favourite', Colors.yellow),
  done('done', Colors.grey),
  normalOrder('normal order', Colors.blue);

  const SortLabel(this.label, this.color);

  final String label;
  final Color color;
}

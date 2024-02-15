import 'package:flutter/material.dart';

enum SortLabel {
  high('high'),
  medium('medium'),
  low('low'),
  favourite('favourite'),
  done('done'),
  normalOrder('normal order');

  const SortLabel(this.label);

  final String label;
}

import 'package:flutter/material.dart';

final textInputDecoration = InputDecoration(
  fillColor: Colors.deepPurple[50],
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.deepPurple[50], width: 2.0),
    borderRadius: BorderRadius.circular(6.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.deepPurple[100], width: 2.0),
    borderRadius: BorderRadius.circular(6.0),
  ),
);

import 'package:flutter/material.dart';

AppBar buildAppBar(String title) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    elevation: 0,
  );
}

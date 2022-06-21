import 'package:contact/call%20details.dart';
import 'package:contact/home.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => home(),
        '/cd':(context) => calldetails(),
      },
    ),
  );
}
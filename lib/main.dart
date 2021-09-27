import 'package:flutter/material.dart';
import 'package:delivery_app/loading.dart';
import 'package:delivery_app/login.dart';
import 'package:delivery_app/signup.dart';
import 'package:delivery_app/reset.dart';
import 'package:delivery_app/home.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    brightness: Brightness.dark,
  ),

  initialRoute: '/login',
  routes: {
    '/' : (context) => Home(),
    '/login' : (context) => Login(),
    '/loading' : (context) => Loading(),
    '/signup' : (context) => Signup(),
    '/reset' : (context) => Reset(),
  },

));
import 'package:flutter/material.dart';


class Reset extends StatefulWidget {
  const Reset({Key? key}) : super(key: key);

  @override
  _ResetState createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Text('Reset Page')
        ),
      ),
    );
  }
}

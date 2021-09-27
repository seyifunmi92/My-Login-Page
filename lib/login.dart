import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Future login(BuildContext context) async{

    if( username.text= "" ){
Fluttertoast.showToast(
      
      msg: "please enter username",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      fontSize: 15,);

    }

    if(password.text = ""){
Fluttertoast.showToast(
      
      msg: "please enter password",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      fontSize: 15,);

    }

    else{
      var url = "http://localhost/localconnect/login.php";
  var response = http.post( url, 
  body:{
  "username" : username.text,
  "password" : password.text,

  });

  var data = json.decode(response.body);

  if(data == "success"){

    Navigator.pushNamed(context, '/');
  }

  else {

    Fluttertoast.showToast(
      
      msg: "This password and username combination does not exist",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      fontSize: 15,);
      }
    }
  
  }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/images/downloadd.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.black54,
          body: Column(
            children: <Widget>[
              SizedBox(height: 20),
              CircleAvatar(
                backgroundImage: AssetImage("lib/images/downloadd.jpg"),
                radius: 40,
              ),
              Divider(
                color: Colors.white,
                height: 15,
              ),
              SizedBox(
                height: 0,
              ),
              SafeArea(
                child: Center(
                  child: Text(
                    'FOOD BANK',
                    style: GoogleFonts.ubuntu(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        controller: username,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            fontSize: 15,
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(
                              Icons.mail,
                            ),
                          ),
                          border: InputBorder.none,
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        controller: password,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Icon(
                              Icons.lock,
                            ),
                          ),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            fontSize: 15,
                          ),
                          border: InputBorder.none,
                        ),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                onPressed: () {
                  login(context);
                },
                child: Text('Login'),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 220,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/reset');
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 110,
              ),
              Text('Dont have an account?'),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text('Sign Up'),
                elevation: 10,
                color: Colors.black87,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

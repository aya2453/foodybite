import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/login_bg.jpg"),
                    fit: BoxFit.cover)),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 0.9, 1],
                    colors: [Color.fromRGBO(45, 45, 45, 0.41), Color.fromRGBO(8, 8, 8, 1), Colors.black]
                )
            ),
            padding: EdgeInsets.fromLTRB(32, 100, 32, 40),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Foodybite',
                    style: GoogleFonts.josefinSans(
                        textStyle: TextStyle(color: Colors.white),
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      LoginForm(),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot Password?',
                          style: GoogleFonts.josefinSans(
                            textStyle: TextStyle(color: Colors.white),
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          onPressed: () => {},
                          color: Colors.deepPurpleAccent,
                          child: Text(
                            'Login',
                            style: GoogleFonts.josefinSans(
                              textStyle: TextStyle(color: Colors.white),
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Text(
                        'Create New Account',
                        style: GoogleFonts.josefinSans(
                            textStyle: TextStyle(color: Colors.white),
                            fontSize: 20,
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            style: GoogleFonts.josefinSans(
                textStyle: TextStyle(color: Colors.white), fontSize: 18),
            decoration: InputDecoration(
                fillColor: Colors.white24,
                filled: true,
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    'assets/icons/email.png',
                    width: 18,
                    height: 18,
                  ),
                ),
                prefixStyle: TextStyle(color: Colors.white),
                contentPadding: EdgeInsets.all(20),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            style: GoogleFonts.josefinSans(
                textStyle: TextStyle(color: Colors.white), fontSize: 18),
            decoration: InputDecoration(
                fillColor: Colors.white24,
                filled: true,
                hintText: 'Password',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    'assets/icons/password.png',
                    width: 18,
                    height: 18,
                    fit: BoxFit.contain,
                  ),
                ),
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                contentPadding: EdgeInsets.all(20),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          )
        ],
      ),
    );
  }
}

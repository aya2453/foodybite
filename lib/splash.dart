import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController _controller;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2)
    ) ..addStatusListener((status) =>
      {
        if (status == AnimationStatus.completed) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => LoginScreen()))
        }
      }
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashAnimation(
        controller: _controller.view,
      ),
    );
  }
}

class SplashAnimation extends StatelessWidget {
  SplashAnimation({Key key, this.controller}) :
    scale = Tween<double>(
      begin: 1.0,
      end: 1.25,
    ).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0, 0.5,
              curve: Curves.easeIn
            )
        )
    ),
    opacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.8, 1,
              curve: Curves.easeIn
            )
        )
    ),
    super(key: key);

  final Animation<double> controller;
  final Animation<double> opacity;
//  final Animation<double> rotate;
  final Animation<double> scale;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Stack(
      children: [ScaleTransition(
        scale: scale,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/splash_bg.jpg'),
              fit: BoxFit.cover,
            )
          ),
        ),
      ),
        Center(
          child: Opacity(
            opacity: opacity.value,
            child: Text(
              'Foodybite',
              style: GoogleFonts.josefinSans(
                  textStyle: TextStyle(color: Color.fromRGBO(62, 63, 104, 1)),
                  fontSize: 50,
                  letterSpacing: 3,
                  fontWeight: FontWeight.w900),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}


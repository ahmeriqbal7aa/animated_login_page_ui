import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  Animation animation, delayedAnimation, muchDelayedAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 5), vsync: this);
    // it flying from left side towards center
    // -ve value mean it start from left side
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    ));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    ));

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn),
    ));

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height - 20,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                Transform(
                  transform: Matrix4.translationValues(
                      animation.value * width, 0.0, 0.0),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 85.0),
                    child: Image(image: AssetImage('images/user.png')),
                  ),
                ),
                SizedBox(height: 10.0),
                Transform(
                  transform: Matrix4.translationValues(
                      delayedAnimation.value * width, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.white54),
                          prefixIcon:
                              Icon(Icons.email_outlined, color: Colors.white54),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        obscureText: true,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white54),
                          prefixIcon:
                              Icon(Icons.vpn_key, color: Colors.white54),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Text(
                          'Forgot Password ?',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          'Login',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        decoration: BoxDecoration(
                          // Border
                          borderRadius: BorderRadius.circular(30.0),
                          // Gradient
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              const Color(0xffbb56d1),
                              const Color(0xff71d9d0),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                Transform(
                  transform: Matrix4.translationValues(
                      muchDelayedAnimation.value * width, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: Divider(color: Colors.white54, thickness: 1.0),
                      ),
                      SizedBox(height: 16.0),
                      Center(
                        child: Text('or Sign In',
                            style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SignInButton(
                            Buttons.Facebook,
                            mini: true,
                            onPressed: () {},
                          ),
                          SignInButton(
                            Buttons.Twitter,
                            mini: true,
                            onPressed: () {},
                          ),
                          SignInButton(
                            Buttons.LinkedIn,
                            mini: true,
                            onPressed: () {},
                          ),
                          SignInButton(
                            Buttons.Tumblr,
                            mini: true,
                            onPressed: () {},
                          ),
                          SignInButton(
                            Buttons.GitHub,
                            mini: true,
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account ? ',
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'Register Now',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

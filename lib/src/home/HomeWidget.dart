import 'package:flutter/material.dart';
import 'package:servicess/src/home/components/Component.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>
    with Component, SingleTickerProviderStateMixin {
  AnimationController animController;
  Animation<double> animTransUserName;
  Animation<double> animTransPassword;
  Animation<double> animOpacityForgetPassword;
  Animation<double> animButtonSigninCircula;
  Animation<double> animButtonSigninWidth;

  @override
  void initState() {
    super.initState();
    animController = AnimationController(
        duration: Duration(milliseconds: 5000), vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    animTransUserName =
        Tween<double>(begin: 0, end: 350).animate(CurvedAnimation(
          parent: animController,
          curve: Interval(0, 0.5, curve: Curves.bounceOut )
        ));


    animTransPassword =
        Tween<double>(begin: 0, end: -350).animate(CurvedAnimation(
          parent: animController,
          curve: Interval(0, 0.5, curve: Curves.bounceOut )
        ));


    animOpacityForgetPassword =
        Tween<double>(begin: 1, end: 0).animate(CurvedAnimation(
          parent: animController,
          curve: Interval(0.3, 0.7, curve: Curves.easeInOut )
        ));

    animButtonSigninCircula =
        Tween<double>(begin: 8.0, end: 40.0).animate(CurvedAnimation(
          parent: animController,
          curve: Interval(0, 0.4, curve: Curves.easeInOut )
        ));

    animButtonSigninWidth =
        Tween<double>(begin: MediaQuery.of(context).size.width, end: 50.0).animate(CurvedAnimation(
          parent: animController,
          curve: Interval(0, 0.4, curve: Curves.bounceOut )
        ));
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  _onTap() {
    if (animController.value > 0) {
      animController.reverse();
    } else {
      animController.forward();
    }
  }

  Widget _colunm() {
    return Column(
      children: <Widget>[
        logo(),
        AnimatedBuilder(
          animation: animTransUserName,
          child: inputUserName(),
          builder: (BuildContext context, Widget child) {
            return Transform.translate(
              offset: Offset(animTransUserName.value, 0.0),
              child: child,
            );
          },
        ),
        AnimatedBuilder(
          animation: animTransPassword,
          child: inputPassword(),
          builder: (BuildContext context, Widget child) {
            return Transform.translate(
              offset: Offset(animTransPassword.value, 0.0),
              child: child,
            );
          },
        ),
        AnimatedBuilder(
          animation: animOpacityForgetPassword,
          child: textForgetPassword(),
          builder: (BuildContext context, Widget child) {
            return Opacity(
              opacity: animOpacityForgetPassword.value,
              child: child,
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              _colunm(),
              AnimatedBuilder(
                animation: animController,
                builder: (BuildContext context, Widget child) {
                  return buttonSignIn(
                      onTap: _onTap,
                      width: animButtonSigninWidth.value,
                      circular: animButtonSigninCircula.value,
                      isLoading: animButtonSigninCircula.value > 8.0);
                },
              )
            ],
          )),
    );
  }
}

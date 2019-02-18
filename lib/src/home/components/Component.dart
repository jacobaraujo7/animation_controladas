import 'package:flutter/material.dart';

class Component {


  Widget logo({double size = 100, Color color = Colors.red}){
    return Padding(
      padding: const EdgeInsets.only(bottom: 70, top: 100),
      child: Icon(Icons.adjust, size: size, color: color,),
    );
  }


  Widget inputUserName(){
    return Padding(
      padding: const EdgeInsets.only(right: 30.0, left: 30.0, bottom: 15),
      child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Username",
                  hintText: "Username"
                ),
      )
    );
  }


  Widget inputPassword(){
    return Padding(
      padding: const EdgeInsets.only(right: 30.0, left: 30.0, bottom: 30),
      child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                  hintText: "*******"
                ),
      )
    );
  }

  Widget buttonSignIn({bool isLoading = false, 
  double circular = 8.0, 
  double width = double.infinity, 
  double height = 50, 
  Function onTap, 
  EdgeInsets padding = const EdgeInsets.only(right: 30.0, left: 30.0, top: 70, bottom: 70)}){

    _loading(){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }

    _text(){
      return Text("Sign In", textAlign: TextAlign.center, style: TextStyle(fontSize:18, color: Colors.white),);
    }


    return InkWell(
      onTap: onTap,
          child: Padding(
        padding: padding,
        child: Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(circular),
                      color: Colors.red,
                    ),
                    alignment: Alignment.center,
                    child: isLoading?  _loading(): _text()
                    ),
      ),
    );

  }


  Widget textForgetPassword(){
    return Center(child: Text("Forget Password?", textAlign: TextAlign.center, style: TextStyle(decoration: TextDecoration.underline, color: Colors.grey, fontSize: 16),),);

  }

}
import 'package:vwwifi/screens/Login.dart';
import 'package:vwwifi/screens/Register.dart';
import 'package:vwwifi/screens/ListBoard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vwwifi/screens/Account.dart';
import 'package:vwwifi/screens/Profile.dart';
import 'package:vwwifi/screens/ViewBoard.dart';

class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings){

    final args = settings.arguments;

    switch( settings.name ){
      case "/login" :
        return MaterialPageRoute(
          builder: (_) => Login()
        );
      case "/register" :
        return MaterialPageRoute(
          builder: (_) => Register()
        );
      case "/listBoard" :
        return MaterialPageRoute(
          builder: (_) => ListBoard()
        );
      case "/viewBoard" :
        return MaterialPageRoute(
          builder: (_) => ViewBoard(args)
        );
      case "/profile" :
        return MaterialPageRoute(
          builder: (_) => Profile(args)
        );
      case "/account" :
        return MaterialPageRoute(
          builder: (_) => Account()
        );
      default:
        _erroRota();
    }

  }

  static Route<dynamic> _erroRota(){

    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Tela não encontrada!"),
          ),
          body: Center(
            child: Text("Tela não encontrada!"),
          ),
        );
      }
    );
  }

}
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:vwwifi/util.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _count = 0;

  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('VW Wi-Fi'),
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[

            Container(
              margin: EdgeInsets.only(top: 15, left: 20, bottom: 15),
              child: Text(
                'Transmissores:',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: CustomColors.TextSubHeader),
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              padding: EdgeInsets.fromLTRB(5, 13, 5, 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      '7539KTX',
                      style: TextStyle(color: CustomColors.TextGrey),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Piscina Fazenda Vinagrete',
                      style: TextStyle(
                        color: CustomColors.TextHeader,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: FaIcon(
                      FontAwesomeIcons.eye, 
                      color: CustomColors.TextHeaderGrey,
                      size: 20,
                      ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: FaIcon(
                      FontAwesomeIcons.ellipsisV,
                      color: CustomColors.TextHeaderGrey,
                      size: 20,
                      ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.015, 0.015],
                  colors: [CustomColors.BlueDark, Colors.white],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.GreyBorder,
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              padding: EdgeInsets.fromLTRB(5, 13, 5, 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      '4929YEU',
                      style: TextStyle(color: CustomColors.TextGrey),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Fábrica Campinas Unidade I',
                      style: TextStyle(
                        color: CustomColors.TextHeader,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0,
                    margin: EdgeInsets.all(0.1),
                    child: IconButton(
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: CustomColors.TextHeaderGrey,
                        ),
                      padding: EdgeInsets.all(0.1),
                      tooltip: 'Visualizar',
                      onPressed: () {},
                    ),
                  ),
                  Card(
                    elevation: 0,
                    margin: EdgeInsets.all(0.1),
                    child: IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: CustomColors.TextHeaderGrey,
                        ),
                      padding: EdgeInsets.all(0.1),
                      tooltip: 'Opções',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.015, 0.015],
                  colors: [CustomColors.GreenIcon, Colors.white],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.GreyBorder,
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              padding: EdgeInsets.fromLTRB(5, 13, 5, 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      '7394QSA',
                      style: TextStyle(color: CustomColors.TextGrey),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Ensacadeira Vinícius',
                      style: TextStyle(
                        color: CustomColors.TextHeader,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0,
                    margin: EdgeInsets.all(0.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: CustomColors.TextHeaderGrey,
                        ),
                      tooltip: 'Visualizar',
                      onPressed: () {},
                    ),
                  ),
                  Card(
                    elevation: 0,
                    margin: EdgeInsets.all(0.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: CustomColors.TextHeaderGrey,
                        ),
                      tooltip: 'Opções',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                gradient: LinearGradient(
                  stops: [0.015, 0.015],
                  colors: [CustomColors.YellowIcon, Colors.white],
                ),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.GreyBorder,
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 80),
          ],
        ),
      ), 

      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _count++),
        tooltip: 'Registrar transmissor',
        child: const Icon(Icons.add),
      ),
    );
  }
}
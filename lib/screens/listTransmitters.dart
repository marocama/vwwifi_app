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
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.015, 0.015],
                  colors: [CustomColors.YellowIcon, Colors.white],
                ),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.GreyBorder,
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Card(
                elevation: 0,
                color: Colors.transparent,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        '1394QS',
                        style: TextStyle(color: CustomColors.TextGrey),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Fábrica Campinas',
                        style: TextStyle(
                          color: CustomColors.TextHeader,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: CustomColors.TextHeaderGrey,
                      ),
                      tooltip: 'Visualizar',
                      onPressed: () {},
                      color: Colors.blue,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: CustomColors.TextHeaderGrey,
                      ),
                      tooltip: 'Opções',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.015, 0.015],
                  colors: [CustomColors.YellowIcon, Colors.white],
                ),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.GreyBorder,
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Card(
                elevation: 0,
                color: Colors.transparent,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        '1394QS',
                        style: TextStyle(color: CustomColors.TextGrey),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Fábrica Campinas Unidade II Centro',
                        style: TextStyle(
                          color: CustomColors.TextHeader,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: CustomColors.TextHeaderGrey,
                      ),
                      tooltip: 'Visualizar',
                      onPressed: () {},
                      color: Colors.blue,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: CustomColors.TextHeaderGrey,
                      ),
                      tooltip: 'Opções',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.015, 0.015],
                  colors: [CustomColors.BlueIcon, Colors.white],
                ),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.GreyBorder,
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Card(
                elevation: 0,
                color: Colors.transparent,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        '7260KP',
                        style: TextStyle(color: CustomColors.TextGrey),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Piscina Fazenda',
                        style: TextStyle(
                          color: CustomColors.TextHeader,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: CustomColors.TextHeaderGrey,
                      ),
                      tooltip: 'Opções',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.015, 0.015],
                  colors: [CustomColors.BlueIcon, Colors.white],
                ),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.GreyBorder,
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Card(
                elevation: 0,
                color: Colors.transparent,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        '7260KP',
                        style: TextStyle(color: CustomColors.TextGrey),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Piscina Fazendinha Nóbrega II ',
                        style: TextStyle(
                          color: CustomColors.TextHeader,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: CustomColors.TextHeaderGrey,
                      ),
                      tooltip: 'Opções',
                      onPressed: () {},
                    ),
                  ],
                ),
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
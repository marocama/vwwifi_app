import 'package:flutter/material.dart';
import 'package:vwwifi/util.dart';

class Transmitter extends StatefulWidget {
  Transmitter({Key key}) : super(key: key);

  @override
  _TransmitterState createState() => _TransmitterState();
}

enum Choice { visualizar, editar, apagar }

class _TransmitterState extends State<Transmitter> {
  bool _s1 = false, _s2 = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Icon(Icons.help, size: 32, semanticLabel: 'Ajuda'),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 25, 10),
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://cdn-ofuxico.akamaized.net/img/upload/noticias/2019/06/19/bruna_marquezine_reproducao_instagram_351888_36.jpg"),
              radius: 18,
            ),
          ),
        ],
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            
            Container(
              margin: EdgeInsets.fromLTRB(20, 15, 20, 15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.015, 0.015],
                  colors: [Colors.green, Colors.white],
                ),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.GreyBorder,
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
              child: Card(
                elevation: 0,
                color: Colors.transparent,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text('2451AB', style: TextStyle(color: CustomColors.TextSubHeaderGrey, fontWeight: FontWeight.w600)),
                    ),
                    Expanded(
                      child: Text('PISCINA FAZENDA', style: TextStyle(color: CustomColors.TextHeader, fontWeight: FontWeight.w800)),
                    ),
                    PopupMenuButton(
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<Choice>>[
                        const PopupMenuItem<Choice>(
                          value: Choice.visualizar,
                          child: Text('Visualizar'),
                        ),
                        const PopupMenuItem<Choice>(
                          value: Choice.editar,
                          child: Text('Editar'),
                        ),
                        const PopupMenuItem<Choice>(
                          value: Choice.apagar,
                          child: Text('Apagar'),
                        ),
                      ],
                      tooltip: 'Opções',
                      icon: Icon(
                        Icons.more_vert,
                        color: CustomColors.TextHeaderGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),



            Card(
              elevation: 10,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: ExpansionTile(
                title: Text('SAÍDAS', style: TextStyle(fontWeight: FontWeight.w800, color: CustomColors.TextHeaderGrey)),
                //leading: Icon(Icons.power_settings_new, color: CustomColors.TextSubHeaderGrey),
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.power_settings_new, color: _s1 ? Colors.green : Colors.grey, size: 35),
                    title: Text('Toldo', style: TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: Text('Saída 1'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    dense: true,
                    onTap: () => setState(() => _s1 = !_s1),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.power_settings_new, color: _s2 ? Colors.green : Colors.grey, size: 35),
                    title: Text('Aspirador', style: TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: Text('Saída 2'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    dense: true,
                    onTap: () => setState(() => _s2 = !_s2),
                  ),
                ],
              ),
            ),
            
            Card(
              elevation: 10,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: ExpansionTile(
                title: Text('ENTRADAS', style: TextStyle(fontWeight: FontWeight.w800, color: CustomColors.TextHeaderGrey)),
                //leading: Icon(Icons.edit, color: CustomColors.TextSubHeaderGrey),
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.remove_circle, color: Colors.green, size: 35),
                    title: Text('Sensor de Luminosidade'),
                    subtitle: Text('Entrada 1'),
                    dense: true,
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.remove_circle_outline, color: Colors.grey, size: 35),
                    title: Text('Sensor de Chuva'),
                    subtitle: Text('Entrada 2'),
                    dense: true,
                  ),
                ],
              ),
            ),

            Card(
              elevation: 10,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: ExpansionTile(
                title: Text('ANALÓGICAS', style: TextStyle(fontWeight: FontWeight.w800, color: CustomColors.TextHeaderGrey)),
                //leading: Icon(Icons.edit, color: CustomColors.TextSubHeaderGrey),
                children: <Widget>[
                  ListTile(
                    leading: FractionallySizedBox(
                      widthFactor: 0.25,
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            text: '1024',
                            style: TextStyle(color: Colors.blue, fontSize: 22),
                            children: <TextSpan>[
                              TextSpan(text: ' cm', style: TextStyle(color: Colors.blue, fontSize: 12),)
                            ]
                          ),
                        ),
                      ),
                    ),
                    title: Text('Potênciometro Portão'),
                    subtitle: Text('Analógica 2'),
                    dense: true,
                  ),
                  ListTile(
                    leading: FractionallySizedBox(
                      widthFactor: 0.25,
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            text: '57',
                            style: TextStyle(color: Colors.blue, fontSize: 22),
                            children: <TextSpan>[
                              TextSpan(text: ' %', style: TextStyle(color: Colors.blue, fontSize: 12),)
                            ]
                          ),
                        ),
                      ),
                    ),
                    title: Text('Nível Caixa Principal'),
                    subtitle: Text('Analógica 1'),
                    dense: true,
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 80),
          ],
        ),
      ), 

      floatingActionButton: FloatingActionButton(
        onPressed: () { Navigator.pushNamed(context, "/send"); },
        tooltip: 'Enviar',
        backgroundColor: Colors.orange,
        child: const Icon(Icons.send),
      ),
    );
  }
}
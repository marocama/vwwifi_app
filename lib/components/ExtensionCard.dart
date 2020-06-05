import 'package:flutter/material.dart';

class ExtensionCard extends StatelessWidget {
  const ExtensionCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
      child: ExpansionTile(
        title: Text('SAÍDAS', style: TextStyle(fontWeight: FontWeight.w800)),
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.power_settings_new, color: Colors.green, size: 35),
            title: Text('Toldo', style: TextStyle(fontWeight: FontWeight.w600)),
            subtitle: Text('Saída 1'),
            trailing: Icon(Icons.keyboard_arrow_right),
            dense: true,
            onTap: () => {},
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.power_settings_new, color: Colors.grey, size: 35),
            title: Text('Aspirador', style: TextStyle(fontWeight: FontWeight.w600)),
            subtitle: Text('Saída 2'),
            trailing: Icon(Icons.keyboard_arrow_right),
            dense: true,
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}
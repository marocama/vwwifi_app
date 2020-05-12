import 'package:flutter/material.dart';
import 'package:vwwifi/util.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _showPassword = false;

  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.only(left: 20.0),
          child: Image.asset('assets/images/logoVW.png'),
        ),
        title: Text('VW Soluções'),
        actions: <Widget>[
          Icon(Icons.help, size: 28, semanticLabel: 'Ajuda'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Icon(Icons.account_circle, size: 28, semanticLabel: 'Usuário'),
          ),
        ],
      ),

      body: Container(
        margin: EdgeInsets.all(20.0),
        width: MediaQuery.of(context).size.width,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            
            
            Row(
              children: <Widget>[
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: ExactAssetImage('assets/images/perfil.jpg'),
                      backgroundColor: Colors.white,
                      radius: 50,
                    ),
                    CircleAvatar(
                      child: Icon(Icons.camera_alt, color: Colors.white, size: 18),
                      backgroundColor: Colors.indigo,
                      radius: 15,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text("Marcus Roberto", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text("Administrador", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15, color: CustomColors.TextHeaderGrey)),
                    ),
                  ],
                ),
              ],
            ),
            
            SizedBox(height: 10),
            Divider(thickness: 2, indent: 4, endIndent: 4),

            
            SizedBox(height: 10),
            Card(
              elevation: 10,
              child: ExpansionTile(
                title: Text("▪  Status e Pagamentos"),
                children: <Widget>[
                  ListTile(
                    title: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black87),
                        children: <TextSpan> [
                          TextSpan(text: '1', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: ' de '),
                          TextSpan(text: '3', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: ' transmissores ativos'),
                        ],
                      ),
                    ),
                    subtitle: Text("Próx. Vencimento: 30/05/2020"),
                    trailing: Icon(Icons.payment),
                  ),
                  ListTile(
                    title: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black87),
                        children: <TextSpan> [
                          TextSpan(text: 'Logado em: '),
                          TextSpan(text: 'Administrador', style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    subtitle: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black87),
                        children: <TextSpan> [
                          TextSpan(text: 'Convidados: '),
                          TextSpan(text: '2', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: ' em uso | '),
                          TextSpan(text: '1'),
                          TextSpan(text: ' livre', style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    trailing: Icon(Icons.account_circle),
                  ),
                ],
              ),
            ),
            

            Card(
              elevation: 10,
              child: ExpansionTile(
                title: Text("▪  Informações Gerais"),
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Nome Completo', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                          initialValue: "Marcus Roberto",
                          style: TextStyle(fontSize:15),
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Email', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                          initialValue: "marcus.rcm@outlook.com",
                          style: TextStyle(fontSize:15),
                          enabled: false,
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'CPF/CNPJ', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                          initialValue: "429.759.388-29",
                          style: TextStyle(fontSize:15),
                          enabled: false,
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Celular', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                          initialValue: "(35) 99868-1301",
                          style: TextStyle(fontSize:15),
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'CEP', labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                          initialValue: "12.990-000",
                          style: TextStyle(fontSize:15),
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Senha', suffixIcon: GestureDetector(child: Icon(Icons.remove_red_eye), onTap: () => setState(() { _showPassword = !_showPassword; })), labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                          initialValue: "vwsolucoes123",
                          style: TextStyle(fontSize:15),
                          obscureText: _showPassword,
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: () {},
                            color: Colors.indigo,
                            textColor: Colors.white,
                            child: Text("SALVAR"),
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Card(
              elevation: 10,
              child: ExpansionTile(
                title: Text("▪  Ajuda e Contato"),
                children: <Widget>[
                  Text("Para mais informações, consulte nosso site."),
                  SizedBox(height: 20),
                ],
              ),
            ),
            
            SizedBox(height: 80),
          ],
        ),
      ), 
    );
  }
}
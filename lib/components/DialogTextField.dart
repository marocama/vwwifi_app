import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DialogTextField extends StatelessWidget {

  final List<TextInputFormatter> inputFormatters;
  final TextEditingController controller;
  final Function(String) validator;
  final Function(String) onSaved;
  final String initialValue;
  final TextInputType type;
  final String labelText;
  final double fontSize;
  final bool autofocus;
  final bool obscure;
  final int maxLines;
  final String hint;
  
  DialogTextField({
    @required this.controller,
    this.type = TextInputType.text,
    this.autofocus = false,
    this.obscure = false,
    this.inputFormatters,
    this.labelText = "",
    this.fontSize = 15,
    this.initialValue,
    this.maxLines = 1,
    this.hint = "",
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      //title: Text("Insira seu email para recuperação: "),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text("Recuperação de senha:"),
            TextFormField(
              decoration: InputDecoration(labelText: this.labelText, hintText: this.hint),
              style: TextStyle(fontSize: this.fontSize),
              inputFormatters: this.inputFormatters,
              initialValue: this.initialValue,
              controller: this.controller,
              validator: this.validator,
              obscureText: this.obscure,
              autofocus: this.autofocus,
              maxLines: this.maxLines,
              keyboardType: this.type,
              onSaved: this.onSaved,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () { Navigator.of(context).pop(); },
          child: Text("CANCELAR"),
        ),
        FlatButton(
          onPressed: () { Navigator.of(context).pop(); },
          child: Text("SALVAR"),
        ),
      ],
    );
  }
}
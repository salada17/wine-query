import 'package:flutter/material.dart';
import 'package:winequery/ui/shared/text.style.dart';
import 'package:winequery/ui/shared/ui.helper.dart';

class SigninHeader extends StatelessWidget {
  final TextEditingController controllerEmail;
  final TextEditingController controllerPw;
  final String? validationMessage;

  SigninHeader({required this.controllerEmail, required this.controllerPw, this.validationMessage});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Login', style: headerStyle),
      UIHelper.verticalSpaceMedium(),
      Text('Enter a your email', style: subHeaderStyle),
      SigninTextField(controllerEmail, 'koh.jc@kstm.co.kr'),
      this.validationMessage != null
          ? Text(validationMessage!, style: TextStyle(color: Colors.red))
          : Container(),
      Text('Enter a your password', style: subHeaderStyle),
      SigninTextField(controllerPw, '1234'),
    ]);
  }
}

class SigninTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  SigninTextField(this.controller, this.hint);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      height: 50.0,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: TextField(
          decoration: InputDecoration.collapsed(hintText: hint),
          controller: controller),
    );
  }
}

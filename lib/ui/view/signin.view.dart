import 'package:flutter/material.dart';
import 'package:winequery/core/enum/viewstate.dart';
import 'package:winequery/ui/widgets/sign_header.dart';
import 'package:winequery/viewmodel/auth.vm.dart';
import 'package:winequery/ui/shared/app.color.dart';

import 'base.view.dart';


class SigninView extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller_pw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SigninHeader(
                validationMessage: model.errorMessage, controllerEmail: _controller, controllerPw: _controller_pw,),
            model.state == ViewState.Busy
                ? CircularProgressIndicator()
                : FlatButton(
              color: Colors.white,
              child: Text(
                'Login',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () async {
                var loginSuccess = await model.login(_controller.text, _controller_pw.text);
                if (loginSuccess) {
                  Navigator.pushNamed(context, '/');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

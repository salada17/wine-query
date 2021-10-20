import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:winequery/core/service/auth.service.dart';
import 'package:winequery/locator.dart';
import 'package:winequery/ui/router.dart';

import 'core/model/user.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      create: (BuildContext context) =>
      locator<AuthenticationService>().userController.stream,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        initialRoute: 'login',
        onGenerateRoute: MainRouter.generateRoute,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:winequery/core/enum/viewstate.dart';
import 'package:winequery/core/model/location.dart';
import 'package:winequery/core/model/user.dart';
import 'package:winequery/viewmodel/main.vm.dart';
import 'package:winequery/ui/shared/app.color.dart';
import 'package:winequery/ui/shared/text.style.dart';
import 'package:winequery/ui/shared/ui.helper.dart';

import 'base.view.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<MainModel>(
      onModelReady: (model) => model.getStore(model.curPos),
      builder: (context, model, child) => Scaffold(
          backgroundColor: backgroundColor,
          body: model.state == ViewState.Busy
              ? Center(child: CircularProgressIndicator())
              : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              UIHelper.verticalSpaceLarge(),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text('Welcome ${Provider.of<User>(context).name}',
                  style: headerStyle,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text('Here are all your posts',
                    style: subHeaderStyle),
              ),
              UIHelper.verticalSpaceSmall(),
            ],)
      ),
    );
  }

}

import 'package:flutter/material.dart';
import 'package:forsa/localization/localization_constant.dart';

class CallUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            getTranslated(context, 'callUs')
        ),
      ),
//      drawer: Drawer(
//        child: ListView(
//          children: <Widget>[
//            ListTile(
//              title: Text(DemoLocalizations.of(context)
//                  .drawerListHomePage['drawerListHomePage']),
//              leading: Icon(Icons.home),
//              onTap: () => Navigator.of(context)
//                  .push(MaterialPageRoute(builder: (context) => HomePage())),
//            ),
//          ],
//        ),
//      ),
    );
  }
}

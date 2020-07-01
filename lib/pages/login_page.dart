import 'package:flutter/material.dart';
import 'package:forsa/localization/localization_constant.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'login')),
      ),
    );
  }
}

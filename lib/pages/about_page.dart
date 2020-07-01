import 'package:flutter/material.dart';
import 'package:forsa/localization/localization_constant.dart';
class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'aboutforsa')),
      ),
    );
  }
}

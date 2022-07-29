import 'package:flutter/material.dart';
import 'package:icm_app/res/constants.dart';

import '../res/colors.dart';

class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 100,
        height: 100,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

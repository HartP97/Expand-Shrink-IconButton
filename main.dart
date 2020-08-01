import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Color fillColor = Colors.transparent;
  final int animDurationInMilSec = 400;

  bool isExpanded = true;
  bool isShrunk = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ExpandShrinkButton(
          onTap: () {
            setState(() {
              if (isExpanded) {
                isExpanded = false;
              } else {
                isExpanded = true;
              }
            });
          },
          buttonSize: 40.0,
          animDurationInMilSec: animDurationInMilSec,
          isExpanded: isExpanded,
          fillColor: Colors.transparent,
          borderColor: Color(0xFF454852),
          padding: 4.0,
        ),
      ),
    );
  }
}

class ExpandShrinkButton extends StatelessWidget {
  const ExpandShrinkButton(
      {Key key,
      @required this.buttonSize,
      @required this.animDurationInMilSec,
      @required this.isExpanded,
      @required this.fillColor,
      @required this.borderColor,
      @required this.onTap,
      this.padding})
      : super(key: key);

  final double buttonSize;
  final int animDurationInMilSec;
  final bool isExpanded;
  final Color fillColor;
  final Color borderColor;
  final Function onTap;
  final double padding;

  @override
  Widget build(BuildContext context) {
    double localPadding = padding != null && padding >= 0.0 ? padding : 0.0;
    double localIconSize = buttonSize - localPadding;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: buttonSize,
        width: buttonSize,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular((buttonSize) * 0.15),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            /// Big version of the Menu
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: animDurationInMilSec),
                  height: isExpanded ? localIconSize * 0.32 : 0.0,
                  width: localIconSize * 0.85,
                  decoration: BoxDecoration(
                    color: fillColor,
                    borderRadius: BorderRadius.circular((localIconSize) * 0.05),
                    border: Border.all(
                      width: 0.06 * localIconSize,
                      color: borderColor,
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: animDurationInMilSec ~/ 2),
                  height: isExpanded ? localIconSize * 0.12 : 0.0,
                  width: localIconSize * 0.85,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(localIconSize * 0.05),
                    border: Border.all(
                      width: 0.06 * localIconSize,
                      color: Colors.transparent,
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: animDurationInMilSec),
                  height: isExpanded ? localIconSize * 0.32 : 0.0,
                  width: localIconSize * 0.85,
                  decoration: BoxDecoration(
                    color: fillColor,
                    borderRadius: BorderRadius.circular(localIconSize * 0.05),
                    border: Border.all(
                      width: 0.06 * localIconSize,
                      color: borderColor,
                    ),
                  ),
                ),
              ],
            ),
            //Small version of the menu
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: animDurationInMilSec),
                  height: !isExpanded ? localIconSize * 0.2 : 0.0,
                  width: localIconSize * 0.85,
                  decoration: BoxDecoration(
                    color: fillColor,
                    borderRadius: BorderRadius.circular(buttonSize * 0.05),
                    border: Border.all(
                      width: 0.06 * localIconSize,
                      color: borderColor,
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: animDurationInMilSec ~/ 2),
                  height: !isExpanded ? localIconSize * 0.05 : 0.0,
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: animDurationInMilSec),
                  height: !isExpanded ? localIconSize * 0.2 : 0.0,
                  width: localIconSize * 0.85,
                  decoration: BoxDecoration(
                    color: fillColor,
                    borderRadius: BorderRadius.circular(buttonSize * 0.05),
                    border: Border.all(
                      width: 0.06 * localIconSize,
                      color: borderColor,
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: animDurationInMilSec ~/ 2),
                  height: !isExpanded ? localIconSize * 0.05 : 0.0,
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: animDurationInMilSec),
                  height: !isExpanded
                      ? localIconSize * 0.2
                      : 0.0, // was 0.12 of buttonsize before and color filled of the box
                  width: localIconSize * 0.85,
                  decoration: BoxDecoration(
                    color: fillColor,
                    borderRadius: BorderRadius.circular(buttonSize * 0.05),
                    border: Border.all(
                      width: 0.06 * localIconSize,
                      color: borderColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

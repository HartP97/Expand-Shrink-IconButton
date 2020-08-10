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
          buttonSize: 60.0,
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
      this.borderRadius,
      this.padding})
      : super(key: key);

  /// ButtonSize in px (double-value)
  final double buttonSize;

  /// Duration in milliseconds that the transition of the icon will last
  final int animDurationInMilSec;

  /// This bool should be shared between the ListTiles and the ExpandShrinkIcon.
  ///
  /// isExpanded = true -> should be corresponding for the two thick tiles of the Icon
  /// isExpanded = false -> should be corresponding to the three slim tiles
  final bool isExpanded;

  /// Color that fills the Icon-Tiles in the middle of the Button.
  final Color fillColor;

  /// BorderColor of the the Icon-tiles in the middle of the Button.
  final Color borderColor;

  /// Function that can be passed to be executed on a simple Tap.
  final Function onTap;

  /// Padding between outer border of the Button and outer border of the Icon. Default: 4.0px
  final double padding;

  /// BorderRadius of outer ButtonBox, default is set to 10px. Needs to be set to 0.0, of no BorderRadius is desired.
  final double borderRadius;

  static const double _defaultBorderRadius = 10;
  static const double _defaultPadding = 4.0;

  @override
  Widget build(BuildContext context) {
    final double borderRadius = this.borderRadius ?? _defaultBorderRadius;
    final double padding = this.padding ?? _defaultPadding;

    double localIconSize = buttonSize - padding;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: buttonSize,
        width: buttonSize,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            /// Big version of the Icon
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

            /// Small version of the Icon
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ScreenSizeTester extends StatefulWidget {
  final Widget testScreen;
  final TestDeviceTypes deviceTypes;

  const ScreenSizeTester({
    super.key,
    required this.testScreen,
    required this.deviceTypes,
  });

  static void nextScreenSize(BuildContext context) {
    context.findAncestorStateOfType<_ScreenSizeTesterState>()?.nextScreenSize();
  }

  @override
  State<ScreenSizeTester> createState() => _ScreenSizeTesterState();
}

class _ScreenSizeTesterState extends State<ScreenSizeTester> {
  int _currentIndex = 0;
  late List<Size> _deviceSizes;
  Key key = UniqueKey();
  late double _screenHeight;
  late double _screenWidth;

  @override
  void initState() {
    super.initState();
    _deviceSizes = _getSizeForDevice();
    _screenWidth = _deviceSizes[0].width;
    _screenHeight = _deviceSizes[0].height;
  }

  List<Size> _getSizeForDevice() {
    switch (widget.deviceTypes) {
      case TestDeviceTypes.desktopSizes:
        return StandardScreenSize.desktopSizes();
      case TestDeviceTypes.androidPhones:
        return StandardScreenSize.androidPhones();
      case TestDeviceTypes.androidTablets:
        return StandardScreenSize.androidTables();
      case TestDeviceTypes.iPhones:
        return StandardScreenSize.applePhones();
      case TestDeviceTypes.ipads:
        return StandardScreenSize.appleTables();
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(border: Border.all(width: 5)),
            height: _screenHeight,
            width: _screenWidth,
            child: widget.testScreen,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: FloatingActionButton(
              child: Icon(Icons.refresh),
              onPressed: () {
                nextScreenSize();
              },
            ),
          ),
        ],
      ),
    );
  }

  void nextScreenSize() {
    setState(() {
      key = UniqueKey();
      _currentIndex = (_currentIndex + 1) % _deviceSizes.length;
      _screenHeight = _deviceSizes[_currentIndex].height;
      _screenWidth = _deviceSizes[_currentIndex].width;
    });
  }
}

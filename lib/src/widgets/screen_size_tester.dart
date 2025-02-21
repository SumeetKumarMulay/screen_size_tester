import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ScreenSizeTester extends StatefulWidget {
  final Widget testScreen;
  final TestDeviceTypes deviceTypes;
  final Orientation deviceOrientation;

  const ScreenSizeTester({
    super.key,
    required this.testScreen,
    required this.deviceTypes,
    required this.deviceOrientation,
  });

  @override
  State<ScreenSizeTester> createState() => _ScreenSizeTesterState();
}

class _ScreenSizeTesterState extends State<ScreenSizeTester> {
  int _currentIndex = 0;
  late List<Size> _deviceSizes;
  Key key = UniqueKey();
  late double _screenHeight;
  late double _screenWidth;
  late Size _flippedSize;

  @override
  void initState() {
    super.initState();
    _deviceSizes = _getSizeForDevice();
    if (widget.deviceOrientation == Orientation.portrait) {
      _screenWidth = _deviceSizes[0].width;
      _screenHeight = _deviceSizes[0].height;
    } else {
      _flippedSize = _deviceSizes[0].flipped;
      _screenWidth = _flippedSize.width;
      _screenHeight = _flippedSize.height;
    }
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
      if (widget.deviceOrientation == Orientation.portrait) {
        _screenHeight = _deviceSizes[_currentIndex].height;
        _screenWidth = _deviceSizes[_currentIndex].width;
      } else {
        _flippedSize = _deviceSizes[_currentIndex].flipped;
        _screenHeight = _flippedSize.height;
        _screenWidth = _flippedSize.width;
      }
    });
  }
}

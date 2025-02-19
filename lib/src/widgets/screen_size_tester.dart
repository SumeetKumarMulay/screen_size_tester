import 'package:flutter/material.dart';
import '../constants/constants.dart';

class ScreenSizeTester extends StatefulWidget {
  final Widget testScreens;
  final DeviceTypes deviceTypes;

  const ScreenSizeTester({
    super.key,
    required this.testScreens,
    required this.deviceTypes,
  });

  @override
  State<ScreenSizeTester> createState() => _ScreenSizeTesterState();
}

class _ScreenSizeTesterState extends State<ScreenSizeTester> {
  int _currentIndex = 0;
  List<Size> _deviceSizes = StandardScreenSize.applePhones();

  @override
  void initState() {
    super.initState();
    _deviceSizes = _getSizeForDevice();
  }

  List<Size> _getSizeForDevice() {
    switch (widget.deviceTypes) {
      case DeviceTypes.desktopSizes:
        return StandardScreenSize.desktopSizes();
      case DeviceTypes.androidPhones:
        return StandardScreenSize.androidPhones();
      case DeviceTypes.androidTablets:
        return StandardScreenSize.androidTables();
      case DeviceTypes.iPhones:
        return StandardScreenSize.applePhones();
      case DeviceTypes.ipads:
        return StandardScreenSize.appleTables();
    }
  }

  void _nextScreenSize() {
    setState(() {
      _currentIndex =
          (_currentIndex + 1) % StandardScreenSize.applePhones().length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _nextScreenSize,
        child: Icon(Icons.refresh),
      ),
      body: MediaQuery(
        data: MediaQueryData(size: _deviceSizes[_currentIndex]),
        child: widget.testScreens,
      ),
    );
  }
}

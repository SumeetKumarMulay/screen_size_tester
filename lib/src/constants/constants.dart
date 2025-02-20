import 'package:flutter/material.dart';

class StandardScreenSize {
  StandardScreenSize._();

  static List<Size> desktopSizes() {
    return [
      Size(1280, 720), // Small Laptop
      Size(1366, 768), // Standard Laptop
      Size(1440, 900), // 13"
      Size(1920, 1080), // Full HD (1080p)
      Size(2560, 1440), // QHD (2K)
      Size(3840, 2160), // 4K
    ];
  }

  static List<Size> appleTables() {
    return [
      Size(768, 1024), // iPad (7th-9th Gen)
      Size(834, 1194), // iPad Pro 11"
      Size(1024, 1366), // iPad Pro 12.9"/
    ];
  }

  static List<Size> applePhones() {
    return [
      Size(320, 568), // iPhone SE (1st Gen)
      Size(375, 667), // iPhone 8
      Size(375, 812), // iPhone X / 11 Pro
      Size(414, 896), // iPhone 11 Pro Max / XR
      Size(390, 844), // iPhone 12 / 13 / 14
      Size(428, 926), // iPhone 12/13/14 Pro Max
    ];
  }

  static List<Size> androidPhones() {
    return [
      Size(360, 640), // Android Small (e.g., Galaxy S5)
      Size(360, 800), // Android Standard (e.g., Nexus 5)
      Size(540, 960), // Android Large Screen (e.g., Galaxy Note)
      Size(720, 1280), // HD (e.g., Samsung Galaxy S6)
      Size(1080, 1920), // Full HD (e.g., Nexus 5X / Galaxy S7)
      Size(1440, 2560), // QHD (e.g., Nexus 6P / Galaxy S8)
      Size(2160, 3840), // UHD (e.g., Xperia XZ Premium)
    ];
  }

  static List<Size> androidTables() {
    return [
      Size(600, 1024), // Android Tablet (e.g., Nexus 7)
      Size(480, 800), // Android Tablet (e.g., Galaxy Tab A)
    ];
  }
}

enum TestDeviceTypes { desktopSizes, ipads, iPhones, androidPhones, androidTablets }

// enum LaptopSizes { smallLaptop, standardLaptop, thirteenInchMac, FHD, QHD, UHD }

// enum Ipads { ipad, ipadProSmall, ipadProLarge }

// enum iPhones { iphoneSE, iphone8, iphoneX, iphone11ProMax, iphone12, iphoneMax }

// enum AndroidPhone {
//   androidSmall,
//   androidStandard,
//   androidLargeScreen,
//   HD,
//   FHD,
//   QHD,
//   UHD,
// }

// enum AndroidTablet { nexus7, galaxyTabA }

// abstract class DeviceTypes {}

// class Laptops extends DeviceTypes {
//   final LaptopSizes screens;
//   Laptops(this.screens);
// }

// class AppleTables extends DeviceTypes {
//   final Ipads screens;
//   AppleTables(this.screens);
// }

// class ApplePhones extends DeviceTypes {
//   final iPhones screens;
//   ApplePhones(this.screens);
// }

// class SmartPhone extends DeviceTypes {
//   final AndroidPhone screens;
//   SmartPhone(this.screens);
// }

// class SmartTablet extends DeviceTypes {
//   final AndroidTablet screens;
//   SmartTablet(this.screens);
// }

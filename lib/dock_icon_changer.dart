import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';

class DockIconChanger {
  DockIconChanger._();
  static final instance = DockIconChanger._();

  final _methodChannel = const MethodChannel('dock_icon_changer');

  /// .setDockIcon('imageName'); // 'imageName' is added to Runner/Assets.xcassets
  Future setDockIcon(String imageName) async {
    if (!Platform.isMacOS) {
      throw 'Only macos supported!';
    }
    await _methodChannel.invokeMethod('setDockIcon', imageName);
  }

  Future resetDockIcon() async {
    if (!Platform.isMacOS) {
      throw 'Only macos supported!';
    }
    await _methodChannel.invokeMethod('resetDockIcon');
  }
}

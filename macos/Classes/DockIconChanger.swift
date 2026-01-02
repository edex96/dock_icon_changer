import Cocoa

import FlutterMacOS

public class DockIconChanger: NSObject, FlutterPlugin {

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "dock_icon_changer", binaryMessenger: registrar.messenger)
    let instance = DockIconChanger()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "setDockIcon":
      let name = call.arguments as! String
      if let image = NSImage(named: name) {
        NSApplication.shared.applicationIconImage = image
            result(nil)
        } else {
            result(FlutterError(code: "IMAGE_NOT_FOUND", 
                                message: "Could not find image in Assets.xcassets", 
                                details: nil))
        }
    case "resetDockIcon":
      NSApplication.shared.applicationIconImage = nil
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}

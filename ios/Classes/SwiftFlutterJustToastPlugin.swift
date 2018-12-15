import Flutter
import UIKit
import Toaster
public class SwiftFlutterJustToastPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_just_toast", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterJustToastPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if(call.method.elementsEqual("toast")){
        
        let arguments = call.arguments as? NSDictionary
        let message = arguments!["message"]as? String
        let _duration = arguments!["duration"]as? String
        
        if (_duration?.elementsEqual("short"))!{
            Toast(text: message,duration : Delay.short).show()
        }else{
            Toast(text: message, duration :Delay.long).show()
        }
    }
    result("iOS " + "true")
  }

}

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
        let bgColor = arguments!["backgroundColor"]as? Int
        let textColor = arguments!["textColor"]as? Int
        
        let toast = Toast(text: message)
        toast.view.cornerRadius = 16.0
        toast.view.backgroundColor = UIColor(rgb: bgColor!)
        toast.view.textColor = UIColor(rgb: textColor!)
        
        if (_duration?.elementsEqual("short"))!{
            toast.duration = Delay.short
        }else{
            toast.duration = Delay.long
        }
        toast.show()
    }
    result("iOS " + "true")
  }
}
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

#import "FlutterJustToastPlugin.h"
#import <flutter_just_toast/flutter_just_toast-Swift.h>

@implementation FlutterJustToastPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterJustToastPlugin registerWithRegistrar:registrar];
}
@end

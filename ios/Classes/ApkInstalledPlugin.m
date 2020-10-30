#import "ApkInstalledPlugin.h"
#if __has_include(<apk_installed/apk_installed-Swift.h>)
#import <apk_installed/apk_installed-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "apk_installed-Swift.h"
#endif

@implementation ApkInstalledPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftApkInstalledPlugin registerWithRegistrar:registrar];
}
@end

//
//  AppDelegate.m
//  WeatherApp
//
//  Created by Drew Volz on 11/3/20.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
#if TARGET_IPHONE_SIMULATOR
    NSString *path = @"/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/System/Library/PrivateFrameworks/Weather.framework/";
#else
    NSString *path = @"/System/Library/PrivateFrameworks/Weather.framework";
#endif

    NSBundle *bundle = [NSBundle bundleWithPath:path];
    if (![bundle load]) {
        NSString *exceptionHint = @"The specified path to the Weather.framework is invalid. Most likely you have Xcode named in a different way.";
        [NSException raise:NSInternalInconsistencyException format: @"%@", exceptionHint];
    }
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {}


@end

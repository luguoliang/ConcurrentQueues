//
//  AppDelegate.m
//  CustomTransitions
//
//  Created by 路国良 on 16/3/2.
//  Copyright © 2016年 baofoo. All rights reserved.
//

#import "AAPLAppDelegate.h"

@interface AAPLAppDelegate ()

@end

@implementation AAPLAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

#ifdef __IPHONE_9_0
- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
#else
- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
#endif
{
    if ([UIDevice currentDevice].systemVersion.floatValue < 8.f)
        return UIInterfaceOrientationMaskPortrait;
    else
        return UIInterfaceOrientationMaskAll;
}
@end

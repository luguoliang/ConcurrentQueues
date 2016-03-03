//
//  AAPLSlideTransitionDelegate.h
//  CustomTransitions
//
//  Created by 路国良 on 16/3/3.
//  Copyright © 2016年 baofoo. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
@interface AAPLSlideTransitionDelegate : NSObject <UITabBarControllerDelegate>
@property (nonatomic, weak) IBOutlet UITabBarController *tabBarController;
//@property (nonatomic, weak) IBOutlet UITabBarController *viewController;
@end

//
//  AAPLMenuViewController.m
//  CustomTransitions
//
//  Created by 路国良 on 16/3/2.
//  Copyright © 2016年 baofoo. All rights reserved.
//

#import "AAPLMenuViewController.h"

@interface AAPLMenuViewController ()

@end

@implementation AAPLMenuViewController

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    // Certain examples are only supported on iOS 8 and later.
    if ([UIDevice currentDevice].systemVersion.floatValue < 8.f)
    {
        NSArray *iOS7Examples = @[@"CrossDissolve", @"Dynamics", @"Swipe", @"Checkerboard", @"Slide"];
        
        if ([iOS7Examples containsObject:identifier] == NO) {
            [self.tableView deselectRowAtIndexPath:self.tableView.indexPathForSelectedRow animated:YES];
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Can not load example." message:@"This example requires iOS 8 or later." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
            return NO;
        }
    }
    
    return YES;
}

-(void)awakeFromNib{
    [super awakeFromNib];
}

@end

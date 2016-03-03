//
//  AAPLExternalStoryboardSegue.m
//  CustomTransitions
//
//  Created by 路国良 on 16/3/2.
//  Copyright © 2016年 baofoo. All rights reserved.
//

#import "AAPLExternalStoryboardSegue.h"

@implementation AAPLExternalStoryboardSegue
//| ----------------------------------------------------------------------------
- (instancetype)initWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination
{
    // Load the storyboard named by this segue's identifier.
    UIStoryboard *externalStoryboard = [UIStoryboard storyboardWithName:identifier bundle:[NSBundle bundleForClass:self.class]];
    
    // Instantiate the storyboard's initial view controller.
    id initialViewController = [externalStoryboard instantiateInitialViewController];
    
    return [super initWithIdentifier:identifier source:source destination:initialViewController];
}


//| ----------------------------------------------------------------------------
- (void)perform
{
    [self.sourceViewController presentViewController:self.destinationViewController animated:YES completion:NULL];
}

-(void)awakeFromNib{
    [super awakeFromNib];
}
@end

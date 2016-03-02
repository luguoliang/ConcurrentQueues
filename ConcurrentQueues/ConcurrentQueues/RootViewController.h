//
//  RootViewController.h
//  ConcurrentQueues
//
//  Created by 路国良 on 16/2/29.
//  Copyright © 2016年 baofoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *image1;

@property (weak, nonatomic) IBOutlet UIImageView *iamge2;

@property (weak, nonatomic) IBOutlet UIImageView *image3;

@property (weak, nonatomic) IBOutlet UIImageView *image4;


- (IBAction)start:(id)sender;

- (IBAction)cancle:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

- (IBAction)selder:(id)sender;

@end

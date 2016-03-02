//
//  RootViewController.m
//  ConcurrentQueues
//
//  Created by 路国良 on 16/2/29.
//  Copyright © 2016年 baofoo. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController (){
    NSArray*_imageUrls;
}

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageUrls = @[
                   @"http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg",
                   @"http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
                   @"http://algoos.com/wp-content/uploads/2015/08/ireland-02.jpg",
                   @"http://bdo.se/wp-content/uploads/2014/01/Stockholm1.jpg"
                   ];

    // Do any additional setup after loading the view.
}
//method1 Synchronize

-(void)method1{
    if ([self downImagesWithUrl:_imageUrls[0]]) {
        self.image1.image = [self downImagesWithUrl:_imageUrls[0]];
    }
    else{
        self.image1.backgroundColor = [UIColor grayColor];
    }
    if ([self downImagesWithUrl:_imageUrls[1]]) {
        self.iamge2.image = [self downImagesWithUrl:_imageUrls[1]];
    }
    else{
        self.iamge2.backgroundColor = [UIColor grayColor];
    }
    if ([self downImagesWithUrl:_imageUrls[2]]) {
        self.image3.image = [self downImagesWithUrl:_imageUrls[2]];
    }
    else{
        self.image3.backgroundColor = [UIColor grayColor];
    }
    if ([self downImagesWithUrl:_imageUrls[3]]) {
        self.image4.image = [self downImagesWithUrl:_imageUrls[3]];
    }
    else{
        self.image4.backgroundColor = [UIColor grayColor];
    }

}

//method2 Complicating

-(void)method2{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       
        UIImage*image1 = [self downImagesWithUrl:_imageUrls[0]];
        dispatch_async(dispatch_get_main_queue(), ^{
           
            self.image1.image = image1;
        });
        
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        UIImage*image2 = [self downImagesWithUrl:_imageUrls[1]];
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.iamge2.image = image2;
        });
        
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        UIImage*image3 = [self downImagesWithUrl:_imageUrls[2]];
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.image3.image = image3;
        });
        
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        UIImage*image4 = [self downImagesWithUrl:_imageUrls[3]];
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.image4.image = image4;
        });
        
    });
}
//
-(void)method3{
    
    NSOperationQueue*queue = [[NSOperationQueue alloc] init];
    [queue addOperationWithBlock:^{
        UIImage*image1 = [self downImagesWithUrl:_imageUrls[0]];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.image1.image = image1;
        }];
    }];
    
    [queue addOperationWithBlock:^{
        UIImage*image2 = [self downImagesWithUrl:_imageUrls[1]];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.iamge2.image = image2;
        }];
    }];
    
    [queue addOperationWithBlock:^{
        UIImage*image3 = [self downImagesWithUrl:_imageUrls[2]];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.image3.image = image3;
        }];
    }];
    
    [queue addOperationWithBlock:^{
        UIImage*image4 = [self downImagesWithUrl:_imageUrls[3]];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.image4.image = image4;
        }];
    }];
    
}

-(void)method4{
    
}
-(UIImage*)downImagesWithUrl:(NSString*)urlString{
    if (!urlString) {
        return nil;
    }
    NSData*data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
    if (!data) {
        return nil;
    }
    return [UIImage imageWithData:data];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)start:(id)sender {
//    [self method2];
    [self method3];
}

- (IBAction)cancle:(id)sender {
    
}

- (IBAction)selder:(UISlider*)sender {
    self.numberLabel.text = [NSString stringWithFormat:@"%f",sender.value*100.0];
}
@end

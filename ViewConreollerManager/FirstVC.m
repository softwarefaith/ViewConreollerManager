//
//  FirstVC.m
//  ViewConreollerManager
//
//  Created by 蔡杰 on 16/3/29.
//  Copyright © 2016年 蔡杰. All rights reserved.
//

#import "FirstVC.h"
#import "NSObject+JAppContext.h"

@implementation FirstVC
-(void)dealloc{
    
    NSLog(@"FirstVC dealloc");
}

-(void)viewDidLoad{
     [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    JAppContext *context = [self JApp_context];
    
    NSLog(@"---%@",[context objectForKey:@"FirstVC"]);
    
    [context setObject:@"123" forKey:@"japp0"];
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{


}




@end

//
//  ViewController+JAppViewControllerManager.m
//  ViewConreollerManager
//
//  Created by 蔡杰 on 16/3/22.
//  Copyright © 2016年 蔡杰. All rights reserved.
//

#import "ViewController+JAppViewControllerManager.h"

@implementation ViewController (JAppViewControllerManager)

-(void)finish{
    NSArray *viewControllers = self.navigationController.viewControllers;
    if ([viewControllers count] > 1) {//Push
        
        if ([viewControllers lastObject]==self) {
            //push方式
            [self finishPushActionWithAnimated:YES];
        }
    }else{//Present
        
        [self finishPresentWithAnimated:YES completion:nil];
    }
}

-(void)finishPushActionWithAnimated:(BOOL)isAnimated{
    [self.navigationController popViewControllerAnimated:isAnimated];

}
-(void)finishPresentWithAnimated:(BOOL)isAnimated completion:(void (^)(void))completion{
    [self dismissViewControllerAnimated:isAnimated completion:completion];
}

@end
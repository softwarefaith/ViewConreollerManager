//
//  UIViewController+JAppViewController.m
//  ViewConreollerManager
//
//  Created by 蔡杰 on 16/5/8.
//  Copyright © 2016年 蔡杰. All rights reserved.
//

#import "UIViewController+JAppViewController.h"

@implementation UIViewController (JAppViewController)
#pragma mark -Start



-(void)startViewController:(UIViewController*)otherViewController startMode:(JAppStartViewControllerMode)mode  bindData:(id _Nullable)context{
    
    
    if (context) {
        [otherViewController JApp_setContext:context];
    }
    
    switch (mode) {
        case JAppStartViewControllerModePresent:{
            
            [self presentViewController:otherViewController animated:YES completion:nil];
            break;
        }
        case JAppStartViewControllerModePush:{
            [self.navigationController pushViewController:otherViewController animated:YES];
            break;
        }
        default:
            break;
    }
}

#pragma mark -Finish
-(void)finish{
    NSArray *viewControllers = self.navigationController.viewControllers;
    if ([viewControllers count] > 1) {//Push
        
        if ([viewControllers lastObject]==self) {
            //push
            [self finishPushActionWithAnimated:YES];
        }
    }else{//Present
        
        [self finishPresentWithAnimated:YES completion:nil];
    }
    
   // [self onViewControllerResultFrombingData:[self JApp_context] toResultCode:0];
}

-(void)finishPushActionWithAnimated:(BOOL)isAnimated{
    [self.navigationController popViewControllerAnimated:isAnimated];
    
}
-(void)finishPresentWithAnimated:(BOOL)isAnimated completion:(void (^)(void))completion{
    [self dismissViewControllerAnimated:isAnimated completion:completion];
}

@end

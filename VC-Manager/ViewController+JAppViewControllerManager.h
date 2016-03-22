//
//  ViewController+JAppViewControllerManager.h
//  ViewConreollerManager
//
//  Created by 蔡杰 on 16/3/22.
//  Copyright © 2016年 蔡杰. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (JAppViewControllerManager)

/*!
 *  @brief pop or  diss -- Animated is yes
 */
-(void)finish;

-(void)finishPushActionWithAnimated:(BOOL)isAnimated;

-(void)finishPresentWithAnimated:(BOOL)isAnimated completion: (void (^ __nullable)(void))completion;

@end

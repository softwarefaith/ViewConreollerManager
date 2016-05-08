//
//  UIViewController+JAppViewController.h
//  ViewConreollerManager
//
//  Created by 蔡杰 on 16/5/8.
//  Copyright © 2016年 蔡杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+JAppContext.h"

@interface UIViewController (JAppViewController)
/*!
 *  @brief   show ViewConreoller mode
 */
typedef NS_ENUM(NSInteger,JAppStartViewControllerMode) {
    /*!
     *  Presen
     */
    JAppStartViewControllerModePresent,
    /*!
     *  Push
     */
    JAppStartViewControllerModePush
};

/*!
 *  @brief start ViewContoller
 
 */

-(void)startViewController:(nonnull UIViewController*)otherViewController startMode:(JAppStartViewControllerMode)mode  bindData:(JAppContext *__nullable)context;

/*
 *   @brief finish ViewConTroller
 pop or  diss -- Animated is yes
 */
-(void)finish;


@end



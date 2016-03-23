//
//  ViewController+JAppViewControllerManager.h
//  ViewConreollerManager
//
//  Created by 蔡杰 on 16/3/22.
//  Copyright © 2016年 蔡杰. All rights reserved.
//

#import "ViewController.h"

/*!
 *  @brief 显示ViewConreoller模式
 */
typedef NS_ENUM(NSInteger,JAppStartViewControllerMode) {
    /*!
     *  Present
     */
    JAppStartViewControllerModePresent,
    /*!
     *  Push
     */
    JAppStartViewControllerModePush
};


@interface ViewController (JAppViewControllerManager)

/*!
 *  @brief 启动ViewContoller
 */
-(void)startViewController:(nonnull UIViewController*)otherViewController startMode:(JAppStartViewControllerMode)mode;

/*!
 *   @brief 关闭ViewConTroller
     pop or  diss -- Animated is yes
 */
-(void)finish;

-(void)finishPushActionWithAnimated:(BOOL)isAnimated;

-(void)finishPresentWithAnimated:(BOOL)isAnimated completion: (void (^ __nullable)(void))completion;


@end

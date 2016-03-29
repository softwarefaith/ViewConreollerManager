//
//  ViewController+JAppViewControllerManager.h
//  ViewConreollerManager
//
//  Created by 蔡杰 on 16/3/22.
//  Copyright © 2016年 蔡杰. All rights reserved.
//

#import "ViewController.h"

@protocol JAppViewControllerMangerInterface;
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
 
    requestCode  区分用
 
 */

-(void)startViewController:(nonnull UIViewController<JAppViewControllerMangerInterface>*)otherViewController startMode:(JAppStartViewControllerMode)mode;

-(void)startViewController:(nonnull UIViewController<JAppViewControllerMangerInterface>*)otherViewController startMode:(JAppStartViewControllerMode)mode requestCode:(int)requestCode bindData:(_Nullable id)data;

/*!
 *   @brief 关闭ViewConTroller
     pop or  diss -- Animated is yes
 */
-(void)finish;

-(void)finishPushActionWithAnimated:(BOOL)isAnimated;

-(void)finishPresentWithAnimated:(BOOL)isAnimated completion: (void (^ __nullable)(void))completion;


@end

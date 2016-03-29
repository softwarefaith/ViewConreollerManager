//
//  JAppViewControllerManger.h
//  ViewConreollerManager
//
//  Created by 蔡杰 on 16/3/28.
//  Copyright © 2016年 蔡杰. All rights reserved.
//

#import <Foundation/Foundation.h>
/*!
 *  @brief  回传结果状态码
 */
typedef NS_ENUM(NSInteger,JAppResultCodeType) {
    /*!
     *  正确
     */
    JAppResultCodeTypeTypeSuccesful,
    /*!
     *  错误
     */
    JAppResultCodeTypeTypeError
};

typedef void (^ViewConreollerResultBlock)(int requestCode,int resultCode,id data);

typedef void (^ViewConreollerReceiveBlock)(int requestCode,id data);


@protocol JAppViewControllerMangerInterface <NSObject>


@optional

-(void)onViewControllerReceiveFromRequestCode:(int)requestCode
                              bingData:(id)data;

-(void)onViewControllerReceive:(ViewConreollerResultBlock) resultBlock;

/*!
 *  @brief A-> B   B回传A 数据协议
 *
 *  @param requestCode 请求码   目的区分 A跳转到多个VC，用于区分哪个VC回传的数据
 *  @param resultCode  返回结果码--一般情况下，只有successful or error 可以自定义不限制
 *  @param data        回传数据
 */

-(void)onViewControllerResultFromRequestCode:(int)requestCode
                                toResultCode:(int)resultCode
                                    bingData:(id)data;

-(void)onViewControllerResult:(ViewConreollerResultBlock) resultBlock;


@end

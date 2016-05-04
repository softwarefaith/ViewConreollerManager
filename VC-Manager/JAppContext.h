//
//  JAppContext.h
//  ViewConreollerManager
//
//  Created by 蔡杰 on 16/5/4.
//  Copyright © 2016年 蔡杰. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

typedef void (^BlockReference)(id object);


@interface JAppContext : NSObject


/*!
 *  @brief init
 */


-(instancetype)initWithContextName:(NSString*)aContextName innerContext:(nullable JAppContext*)aInnnerContext;

-(instancetype)initWithContextName:(NSString*)aContextName;

-(instancetype)initWithinnerContext:(JAppContext*)aInnnerContext;

/*!
 *  @brief get current context name
 */
-(NSString*)getContextName;

-(JAppContext*)getInnterContext;

/*!
 *  @brief 为自身以及内部环境设置值，嵌套
 */
-(void) setObject:(id)object forKey:(NSString*)key withContextName:(NSString *)name;
-(id) objectForKey:(NSString *)key withContextName:(NSString *)name;
-(void) removeObjectForKey:(NSString *)key withContextName:(NSString *)name;

/*!
 *  @brief 仅为自身赋值
 */
-(void) setObject:(id)object forKey:(NSString*)key;
-(id) objectForKey:(NSString *)key;
-(void) removeObjectForKey:(NSString *)key;

/*!
 *  @brief 注册对应的回调函数
 */

-(void) registerCallback:(BlockReference)block forKey:(NSString *)key withObject:(id)object;
-(void) removeCallbacksForObject:(id)object;
-(void) removeAllCallbacks;

@end

NS_ASSUME_NONNULL_END

//
//  NSObject+JAppContext.m
//  ViewConreollerManager
//
//  Created by 蔡杰 on 16/5/8.
//  Copyright © 2016年 蔡杰. All rights reserved.
//

#import "NSObject+JAppContext.h"
#import <objc/runtime.h>
static char const * const JAppControllerContextKey = "JAppControllerContextKey";

@implementation NSObject (JAppContext)
-(void) JApp_setContext:(JAppContext *)context
{
    objc_setAssociatedObject(self, JAppControllerContextKey, context, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(JAppContext *)JApp_context
{
    return objc_getAssociatedObject(self, JAppControllerContextKey);
}
@end

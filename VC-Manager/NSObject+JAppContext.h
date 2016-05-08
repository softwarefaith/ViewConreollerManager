//
//  NSObject+JAppContext.h
//  ViewConreollerManager
//
//  Created by 蔡杰 on 16/5/8.
//  Copyright © 2016年 蔡杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JAppContext.h"
@interface NSObject (JAppContext)

-(void) JApp_setContext:(nonnull JAppContext *)context;

-(nullable JAppContext *)JApp_context;
@end

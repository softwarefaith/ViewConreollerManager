//
//  JAppContext.m
//  ViewConreollerManager
//
//  Created by 蔡杰 on 16/5/4.
//  Copyright © 2016年 蔡杰. All rights reserved.
//

#import "JAppContext.h"

NSString *const kJAppDefaultContextName = @"kJAppDefaultContextName";

@interface JAppContext ()

@property (nonatomic,strong,nullable) JAppContext *innerContext;

@property (nonatomic,copy) NSString *contextName;

@property (nonatomic,strong) NSMutableDictionary *objectDictionary;

@property (nonatomic,strong) NSMutableDictionary *callBackDictionary;


@end

@interface JAppContext (PrivateMethod)

-(JAppContext*)contextWithName:(NSString*)aContextName;

-(void) setInternalDictionaryWithObject:(id)object forKey:(NSString*)key;
@end

@implementation JAppContext{
    NSObject *lock;
}

#pragma mark --Init

-(instancetype)initWithContextName:(NSString *)aContextName{
    
    return [self initWithContextName:aContextName innerContext:nil];
}
-(instancetype)initWithinnerContext:(JAppContext *)aInnnerContext{
    
    return [self initWithContextName:kJAppDefaultContextName innerContext:aInnnerContext];
}

-(instancetype)initWithContextName:(NSString *)aContextName innerContext:(JAppContext *)aInnnerContext{
    
    if (self = [super init]) {
        _contextName = [aContextName copy];
        _innerContext = aInnnerContext;
        lock = [[NSObject alloc] init];
    }
    
    return self;
}

#pragma mark --Get Context Info

-(NSString *)getContextName{
    return self.contextName;
}

-(JAppContext *)getInnterContext{
    return self.innerContext;
}
#pragma mark --self and innerContext
-(void)setObject:(id)object forKey:(NSString *)key withContextName:(NSString *)name{
    
    if (key == nil) {
        return;
    }
    
    JAppContext *conetxt = [self contextWithName:name];
    
    [conetxt setInternalDictionaryWithObject:object forKey:key];

}
-(id)objectForKey:(NSString *)key withContextName:(NSString *)name{
    
    
    return nil;
}

-(void)removeObjectForKey:(NSString *)key withContextName:(NSString *)name{
    
}

#pragma mark --private method
-(void)setInternalDictionaryWithObject:(id)object forKey:(NSString *)key{
    if (object == nil) {
        object = [NSNull null];
    }
}
-(JAppContext *)contextWithName:(NSString *)aContextName{

    if (aContextName == nil) {
        return nil;
    }
    if ([aContextName isEqualToString:self.contextName]) {
        return self;
    }
    if (self.innerContext) {
        return [_innerContext contextWithName:aContextName];
    }
    
    return nil;
}
#pragma mark --Getter
-(NSMutableDictionary *)objectDictionary{
    if (_objectDictionary == nil) {
        _objectDictionary = [[NSMutableDictionary alloc] init];
    }
    return _objectDictionary;
}

-(NSMutableDictionary *)callBackDictionary{
    if (_callBackDictionary == nil) {
        _callBackDictionary = [[NSMutableDictionary alloc] init];
    }
    return _callBackDictionary;
}
@end

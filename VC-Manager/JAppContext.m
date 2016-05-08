//
//  JAppContext.m
//  ViewConreollerManager
//
//  Created by 蔡杰 on 16/5/4.
//  Copyright © 2016年 蔡杰. All rights reserved.
//

#import "JAppContext.h"

@interface JAppContextBlockRef : NSObject

@property(nonatomic,copy) BlockReference block;

@property(nonatomic,weak) id owner;

@end

@implementation JAppContextBlockRef



@end

NSString *const kJAppDefaultContextName = @"kJAppDefaultContextName";

@interface JAppContext ()

@property (nonatomic,strong,nullable) JAppContext *innerContext;

@property (nonatomic,copy) NSString *contextName;

@property (nonatomic,strong) NSMutableDictionary *objectDictionary;

@property (nonatomic,strong) NSMutableDictionary *oldObjectDictionary;

@property (nonatomic,strong) NSMutableDictionary *callBackDictionary;



@end

@interface JAppContext (PrivateMethod)

-(JAppContext*)contextWithName:(NSString*)aContextName;

-(void) setInternalDictionaryWithObject:(id)object forKey:(NSString*)key;
@end

@implementation JAppContext{
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
    
    if (key == nil)  return;
    
    JAppContext *conetxt = [self contextWithName:name];
    
    if (conetxt) {
        [conetxt setInternalDictionaryWithObject:object forKey:key];
        if (conetxt.updateIfNeed) {
             [conetxt executeBlocksForKey:key obect:object];
        }
    }
}
-(id)objectForKey:(NSString *)key withContextName:(NSString *)name{
    
    if(key == nil) return nil;
    
    JAppContext *conetxt = [self contextWithName:name];

    if (conetxt) {
        return conetxt.objectDictionary[key];
    }
    return nil;
}

-(void)removeObjectForKey:(NSString *)key withContextName:(NSString *)name{
    
    if(key == nil) return ;

    JAppContext *conetxt = [self contextWithName:name];
    
    if (conetxt) {
        return [conetxt.objectDictionary removeObjectForKey:key];
    }
    
}

#pragma mark --self
-(void)setObject:(id)object forKey:(NSString *)key{
    if (key == nil) {
        return;
    }
    if (object == nil) {
        object = [NSNull null];
    }
    
    [self.objectDictionary setObject:object forKey:key];
    
    
    if(self.updateIfNeed){
         [self executeBlocksForKey:key obect:object];
    }

}
-(id)objectForKey:(NSString *)key{
    
    if (key == nil) {
        return nil;
    }
    return self.objectDictionary[key];
}

-(void)removeObjectForKey:(NSString *)key{
    if (key == nil) {
        return ;
    }
    [self.objectDictionary removeObjectForKey:key];
}

#pragma mark --Callback
-(void)registerCallback:(BlockReference)block forKey:(NSString *)key withObject:(id)object{
    
    if (block == nil || key == nil || object == nil) {
        return;
    }
    
    NSMutableArray *callBackList = [self.callBackDictionary objectForKey:key];
    
    if (callBackList == nil) {
        callBackList = [[NSMutableArray alloc] init];
        [self.callBackDictionary setObject:callBackList forKey:key];
    }
    
    JAppContextBlockRef *blockRef = [[JAppContextBlockRef alloc] init];
    blockRef.block = block;
    blockRef.owner = object;
    
    [callBackList addObject:blockRef];
    
}

-(void)removeCallbacksForObject:(id)object{
    
    if (object == nil) {
        return;
    }
    
    NSArray *keys = [self.callBackDictionary allKeys];
    
    for (NSString *key in keys) {
        NSMutableArray *callBackList = [self.callBackDictionary objectForKey:key];
        NSArray *callBackListCopy = callBackList.copy;
        
        for (JAppContextBlockRef *block in callBackListCopy ) {
            
            if (block.owner == nil || block.owner == object) {
                [callBackList removeObject:object];
            }
        }
        
    }
}

#pragma mark --private method


-(void) executeBlocksForKey:(NSString *)key obect:(id)obj{
    NSMutableArray *removeBlocks = nil;
    NSArray *blockList = nil;
    
    
    
    NSMutableArray *blockListAll = self.callBackDictionary[key];
    
    if(blockListAll!=nil){
        
            blockList = blockListAll.copy;
    }
    
    if(blockList!=nil){
        for(JAppContextBlockRef *blockReference in blockList){
            if(blockReference.owner!=nil){

                
                id old = self.oldObjectDictionary[key];
                
                blockReference.block(blockReference.owner,old,obj);
                [self.oldObjectDictionary setObject:obj forKey:key];
            }
            else{
                if(removeBlocks==nil){
                    removeBlocks = [[NSMutableArray alloc]init];
                }
                
                [removeBlocks addObject:blockReference];
            }
        }
    }
    
    if (!self.removeIfNeed) {
        return;
    }

    if(removeBlocks!=nil){
        
        NSMutableArray *blockListAll =self.callBackDictionary[key];
            
            if(blockListAll!=nil){
                
                for(JAppContextBlockRef *blockReference in removeBlocks){
                    [blockListAll removeObject:blockReference];
                }
            }
    }
}


-(void)setInternalDictionaryWithObject:(id)object forKey:(NSString *)key{
    if (object == nil) {
        object = [NSNull null];
    }
    
    [self.objectDictionary setObject:object forKey:key];
    
    if (self.updateIfNeed && self.oldObjectDictionary[key]) {
        
    }else{
        
       [self.oldObjectDictionary setObject:object forKey:key];
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
-(NSMutableDictionary *)oldObjectDictionary{
    if (_oldObjectDictionary == nil) {
        _oldObjectDictionary = [[NSMutableDictionary alloc] init];
    }
    return _oldObjectDictionary;
}
@end

//
//  UIControl+MMTarget.m
//  LayerExample
//
//  Created by detu on 16/7/11.
//  Copyright © 2016年 demoDu. All rights reserved.
//

#import "UIControl+MMTarget.h"
#import "MMSubNextCocoa.h" 
@implementation UIControl (MMTarget)
-(id<MMCocoa>)addTargetSelControlEvent:(UIControlEvents)events{
    NSAssert(events, @"事件不能为空");
    @autoreleasepool {
        
    MMSubNextCocoa *cocoa = objc_getAssociatedObject(self, (__bridge const void *)(self));
    if (cocoa == nil) {
        cocoa = [MMSubNextCocoa new];
    }
    objc_setAssociatedObject(self, (__bridge const void *)(self), cocoa, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    SEL event = cocoa.subSEL;
    [self removeTarget:cocoa action:event forControlEvents:events];
    [self addTarget:cocoa action:event forControlEvents:events];
        
    return cocoa;
        
}
    
}

@end

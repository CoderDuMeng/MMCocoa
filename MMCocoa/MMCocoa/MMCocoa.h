//
//  MMCocoa.h
//  LayerExample
//
//  Created by detu on 16/7/11.
//  Copyright © 2016年 demoDu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>

@protocol MMCocoa <NSObject>
/**
 *  响应的事件
 *
 *  @param block 响应事件执行的Block
 *
 *  @return 返回一个遵守执行事件的objc 
 
 */
@optional
- (id<MMCocoa>)subNext:(void(^)(id obj))block;

@optional
- (id<MMCocoa>)endNext:(void(^)(id obj))block;

@end

//
//  NSObject+MMKVO.h
//  LayerExample
//
//  Created by detu on 16/7/12.
//  Copyright © 2016年 demoDu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMCocoa.h"

@interface NSObject (MMKVO) <MMCocoa>

/**
 *  传入监听的属性的名字
 *
 *  @param path 属性名字
 *
 *  @return 返回一个MMCocoa  执行subNext  回调返回的是字典 是new 值  执行endNext 是old 旧值 
 
 */
-(id<MMCocoa>)KVO_path:(NSString *)path;

/**
 *  监听多个属性
 *
 *  @param paths 传入数组 属性名字
 *
 *  @return 返回一个MMCocoa  执行subNext  回调返回的是字典 是new 值  执行endNext 是old 旧值
 */
-(id<MMCocoa>)KVO_paths:(NSArray <NSString * >* )paths;

/**
 *  返回监听的属性这里只针对多个属性监听有作用
 *
 *  @return
 */
- (NSMutableArray <NSString *> *)paths;

/**
 *  移除某个监听 可以传入 NSString 或者是NSArray
 *
 *  @param path 
 */
- (void)removeObserverForPath:(id)path;

/**
 *  移除所有的
 */
- (void)removeObserverAll;



@end

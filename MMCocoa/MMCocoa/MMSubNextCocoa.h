//
//  MMSubNextCocoa.h
//  LayerExample
//
//  Created by detu on 16/7/12.
//  Copyright © 2016年 demoDu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMCocoa.h"
@interface MMSubNextCocoa : NSObject <MMCocoa>

@property (assign , nonatomic ,readonly) SEL subSEL;

@property (copy   , nonatomic ,readonly) void(^subNextBlock)(id obj);

@property (copy   , nonatomic ,readonly) void (^endNextBlock)(id obj);

@end

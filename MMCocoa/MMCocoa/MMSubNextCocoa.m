//
//  MMSubNextCocoa.m
//  LayerExample
//
//  Created by detu on 16/7/12.
//  Copyright © 2016年 demoDu. All rights reserved.
//

#import "MMSubNextCocoa.h"
@implementation MMSubNextCocoa

-(instancetype)init{
    if (self=[super init]) {
     _subSEL = @selector(subFoundation:);
    }
    return self;
}
- (void)subFoundation:(id)obj{
    if (self.subNextBlock) {
        self.subNextBlock(obj);
    }
}

-(id<MMCocoa>)subNext:(void (^)(id))block{
    @synchronized (self) {
        _subNextBlock = block;
    }
    return self;
}
-(id<MMCocoa>)endNext:(void (^)(id))block{
    @synchronized (self) {
     _endNextBlock =  block;
    }
    return self;
}

@end

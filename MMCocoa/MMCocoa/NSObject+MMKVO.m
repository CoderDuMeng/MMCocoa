//
//  NSObject+MMKVO.m
//  LayerExample
//
//  Created by detu on 16/7/12.
//  Copyright © 2016年 demoDu. All rights reserved.
//

#import "NSObject+MMKVO.h"
#import "MMSubNextCocoa.h" 
const void *cocoaKey;
const void *pathsKey;
@implementation NSObject (MMKVO)

- (void)addObserver:(id)obj path:(NSString *)p{
    [self addObserver:obj forKeyPath:p options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

- (void)removeObserver:(id)obj path:(NSString *)path{
    @synchronized (self) {
        [self removeObserver:obj forKeyPath:path];
        [self.paths removeObject:path];
    }
}

- (id <MMCocoa>)cocoa{
    @autoreleasepool {
    MMSubNextCocoa *cocoa =  objc_getAssociatedObject(self, &cocoaKey);
    if (cocoa == nil) {
        cocoa = [MMSubNextCocoa new];
    }
    objc_setAssociatedObject(self, &cocoaKey, cocoa, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return cocoa;
    }
}

-(id<MMCocoa>)KVO_path:(NSString *)path{
    [self addObserver:self path:path];
    return self.cocoa;
}

-(id<MMCocoa>)KVO_paths:(NSArray *)paths{
    @autoreleasepool {
    if (!objc_getAssociatedObject(self, &pathsKey)) {
        objc_setAssociatedObject(self, &pathsKey, paths, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    for (NSString *path in paths) {
        [self addObserver:self path:path];
    }
    return self.cocoa;
    }
}
-(void)removeObserverForPath:(id)path{
    @synchronized (self) {
        
    if ([path isKindOfClass:[NSArray class]]) {
        NSArray *paths = path;
        for (NSString *p in paths) {
            [self removeObserver:self path:p];
        }
    }else
        [self removeObserver:self path:path] ;

    }
}

-(void)removeObserverAll{
    @synchronized (self) {
    
    for (NSString *p in self.paths) {
        [self removeObserver:self path:p];
    }
  }
    
}

-(NSMutableArray <NSString *> *)paths{
    return objc_getAssociatedObject(self, &pathsKey);
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    @autoreleasepool {
    id new = change[@"new"];
    id old = change[@"old"];
    MMSubNextCocoa *cocoa =  objc_getAssociatedObject(self, &cocoaKey);
    if (cocoa) {
    if (cocoa.subNextBlock) {
        cocoa.subNextBlock(@{@"path" : keyPath ,@"new":new});
    }
    if (cocoa.endNextBlock) {
        cocoa.endNextBlock(@{@"path" : keyPath, @"old" : old});
        
     }
     
    }
 
  }
 
}




@end

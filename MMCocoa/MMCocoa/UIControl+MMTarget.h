//
//  UIControl+MMTarget.h
//  LayerExample
//
//  Created by detu on 16/7/11.
//  Copyright © 2016年 demoDu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMCocoa.h"   

@interface UIControl (MMTarget)

/**
 *  给UIControl 子控件添加事件
 *
 *  @param events  事件类型 
 *
 *  @return  返回MMCocoa 调用subNext方法就是回调
 */
-(id<MMCocoa>)addTargetSelControlEvent:(UIControlEvents)events;





@end

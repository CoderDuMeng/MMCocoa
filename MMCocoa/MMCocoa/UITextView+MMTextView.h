//
//  UITextView+MMTextView.h
//  LayerExample
//
//  Created by detu on 16/7/11.
//  Copyright © 2016年 demoDu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMCocoa.h"
@interface UITextView (MMTextView)<MMCocoa>

/**
 *  执行这个方法返回一个MMCocoa 在执行 MMCocoa里面的subNext就是回调的方法
 [textView.mm_textEditing subNext:^(id obj) {
 
  NSLog(@"%@",obj);
 
 }];
 */
- (id<MMCocoa>)mm_textEditing;


@end

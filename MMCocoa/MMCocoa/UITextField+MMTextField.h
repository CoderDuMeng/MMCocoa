//
//  UITextField+MMTextField.h
//  LayerExample
//
//  Created by detu on 16/7/11.
//  Copyright © 2016年 demoDu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMCocoa.h"
@interface UITextField (MMTextField)
/**
 *  执行这个方法返回MMCocoa 在执行subNext 回调
 *   
 
 [textField.mm_textEditing subNext:^(id obj) {
 
  UITextField *tex = obj;
  NSLog(@"%@",tex.text);
 
 }];
 *  @return
 */
- (id<MMCocoa>)mm_textEditing;

@end

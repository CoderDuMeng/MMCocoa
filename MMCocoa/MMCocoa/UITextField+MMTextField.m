//
//  UITextField+MMTextField.m
//  LayerExample
//
//  Created by detu on 16/7/11.
//  Copyright © 2016年 demoDu. All rights reserved.
//

#import "UITextField+MMTextField.h"
#import "UIControl+MMTarget.h" 


@implementation UITextField (MMTextField)
-(id<MMCocoa>)mm_textEditing{
   return [self addTargetSelControlEvent:UIControlEventEditingChanged];
}

@end

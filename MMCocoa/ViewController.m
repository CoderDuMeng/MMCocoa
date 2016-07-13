//
//  ViewController.m
//  MMCocoa
//
//  Created by DemoDu on .
//  Copyright © 2016年 demoDu. All rights reserved.
//

#import "ViewController.h"
#import "MMCocoa/MMCocoaKit.h"
@interface ViewController ()
@property (weak , nonatomic )  UIButton *item;
@property (weak , nonatomic)   UITextView *textView;
@property (weak , nonatomic)   UITextField *textField;
@end

@implementation ViewController
-(UIButton *)item{
    if (!_item) {
        UIButton *item = [[UIButton alloc] init];
        item.backgroundColor = [UIColor redColor];
        item.frame = CGRectMake(0, 100, 50, 50);
        [self.view addSubview:_item = item];
        
        [[item addTargetSelControlEvent:UIControlEventTouchUpInside] subNext:^(id obj) {
            NSLog(@"红色按钮点击了");
            
        }];
        
    }
    return _item;
}

-(UITextView *)textView{
    if (!_textView) {
        UITextView *textView = [UITextView new];
        textView.frame = CGRectMake(0, 200, 100, 100);
        textView.layer.borderColor = [UIColor yellowColor].CGColor;
        textView.layer.borderWidth = 2;
        textView.text = @"我是iOS";
        [self.view addSubview:_textView = textView];
        
        [textView.mm_textEditing subNext:^(id obj) {
            NSLog(@"textView 正在输入: %@",obj);
            
        }];
        
        
    }
    return _textView;
    
}

-(UITextField *)textField{
    if (!_textField) {
        UITextField *textField = [UITextField new];
        textField.layer.borderColor = [UIColor blackColor].CGColor;
        textField.layer.borderWidth = 2;
        textField.frame = CGRectMake(0, 350, 100, 80);
        [self.view addSubview:_textField = textField];
        [textField.mm_textEditing subNext:^(id obj) {
            UITextField *t = obj;
            NSLog(@"textField 正在输入 %@",t.text);
            
        }];
    }
    return _textField;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self item];
    [self textView];
    [self textField];
    
    
}



@end

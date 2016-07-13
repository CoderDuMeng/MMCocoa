//
//  UITextView+MMTextView.m
//  LayerExample
//
//  Created by detu on 16/7/11.
//  Copyright © 2016年 demoDu. All rights reserved.
//

#import "UITextView+MMTextView.h" 
#import "MMSubNextCocoa.h" 
@implementation UITextView (MMTextView)
-(id<MMCocoa>)mm_textEditing{
    @synchronized (self) {
    if (!self.delegate) {
    ((void(*)(id,SEL,id))objc_msgSend)(self,@selector(setDelegate:),self);
    }
    MMSubNextCocoa *cocoa = objc_getAssociatedObject(self, (__bridge const void *)(self));
    if (cocoa == nil) {
        cocoa = [MMSubNextCocoa new];
    }
    objc_setAssociatedObject(self, (__bridge const void *)(self), cocoa, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return cocoa;
 }
}
-(void)textViewDidChange:(UITextView *)textView{
    @autoreleasepool {
    MMSubNextCocoa *cocoa = objc_getAssociatedObject(self, (__bridge const void *)(self));
    if (cocoa && cocoa.subNextBlock) {
        cocoa.subNextBlock(textView.text);
     
    }
}
}





@end

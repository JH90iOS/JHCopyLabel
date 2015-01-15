//
//  JHCopyLabel.m
//  JHCopyLabel
//
//  Created by 金 on 15/1/15.
//  Copyright (c) 2015年 jinhua. All rights reserved.
//

#import "JHCopyLabel.h"

@implementation JHCopyLabel

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initLongPressHandle];
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self initLongPressHandle];
}


-(BOOL)canBecomeFirstResponder{
    return YES;
}


-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    return (action == @selector(copy:));
}


-(void)copy:(id)sender{
    UIPasteboard* pasteBoard = [UIPasteboard generalPasteboard];
    pasteBoard.string = self.text;
}

-(void)initLongPressHandle{
    self.userInteractionEnabled = YES;
    UILongPressGestureRecognizer* longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressHandle:)];
    longPress.minimumPressDuration = 0.5;
    [self addGestureRecognizer:longPress];
    
}

-(void)longPressHandle:(UILongPressGestureRecognizer*)longPressGR{
    [self becomeFirstResponder];
    UIMenuController* menu = [UIMenuController sharedMenuController];
    [menu setTargetRect:self.frame inView:self.superview];
    [menu setMenuVisible:YES animated:YES];
}

@end

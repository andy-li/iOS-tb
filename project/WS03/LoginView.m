//
//  LoginView.m
//  WS03
//
//  Created by andy li on 13-3-18.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

@synthesize loginViewDelegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        //
        self.loginViewDelegate = nil;
    }
    
    return self;
}

- (void)layoutSubviews
{
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [loginBtn setFrame:CGRectMake(20.0, 20.0, 200.0, 40.0)];
//    [loginBtn setBackgroundImage:[UIImage imageNamed:@"buyBtnBg.png"] forState:UIControlStateNormal];
    [loginBtn setTitle:@"淘宝登录" forState:UIControlStateNormal];
    
    [loginBtn addTarget:self action:@selector(didSelectedTaobaoButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:loginBtn];
}

- (void)didSelectedTaobaoButton:(id)sender
{
    if (self.loginViewDelegate) {
        if ([self.loginViewDelegate conformsToProtocol:@protocol(LoginViewDelegate)] &&
            [self.loginViewDelegate respondsToSelector:@selector(didSelectedTaobaoButton)]) {
            [self.loginViewDelegate didSelectedTaobaoButton];
        }
    }
}

@end

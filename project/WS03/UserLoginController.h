//
//  UserLoginController.h
//  WS03
//
//  Created by andy li on 13-3-18.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import "BaseViewController.h"
#import "LoginView.h"

@interface UserLoginController : BaseViewController <LoginViewDelegate>

@property (nonatomic, retain) LoginView *loginView;

- (void)close;

@end

//
//  LoginView.h
//  WS03
//
//  Created by andy li on 13-3-18.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoginViewDelegate;

@interface LoginView : UIView

@property (nonatomic, retain) id<LoginViewDelegate> loginViewDelegate;

@end


@protocol LoginViewDelegate <NSObject>

- (void)didSelectedTaobaoButton;

@end
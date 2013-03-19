//
//  BaseViewController.h
//  WS03
//
//  Created by andy li on 13-3-7.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseWebViewController.h"
#import "UserViewController.h"

@interface BaseViewController : UIViewController <BaseWebViewDelegate>

@property (strong, nonatomic) UserViewController *userController;
@property (strong, nonatomic) BaseWebViewController *webViewController;

- (id)initWithTitle:(NSString *)title andTabBarImageName:(NSString *)imageName;

- (void)initUserController;

- (void)initWebViewController;
- (void)initWebViewControllerWithURL:(NSURL *) requestURL andDelegate:(id)delegate;

- (void)showLoginView:(BaseViewController *)controller;

- (void)setNavigationControllerHidden:(BOOL)hidden;
- (void)setTabBarHidden:(BOOL)hidden;
- (void)backItem;

@end

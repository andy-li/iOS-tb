    //
//  BaseViewController.m
//  WS03
//
//  Created by andy li on 13-3-7.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//
#import "AppDelegate.h"
#import "BaseViewController.h"
#import "UserLoginController.h"

@implementation BaseViewController

@synthesize userController;
@synthesize webViewController;

- (id)init
{
    self = [super init];
    if (self) {
        //
        [self initialize];
    }
    return self;
}

- (id)initWithTitle:(NSString *)title andTabBarImageName:(NSString *)imageName
{
    self = [super init];
    if (self) {
        self.navigationItem.title = title;
        
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:imageName] tag:0];
        
        self.tabBarItem = tabBarItem;
        
        [self initialize];
    }
    return self;
}

#pragma mark - Private Method

- (void)initialize
{
    [self initUserController];
    [self initWebViewController];
}

- (void)initUserController
{
    self.userController = [[UserViewController alloc] init];
}

- (void)initWebViewController
{
    self.webViewController = [[BaseWebViewController alloc] init];
    self.webViewController.baseWebViewDelegate = self;    
}

- (void)initWebViewControllerWithURL:(NSURL *) requestURL andDelegate:(id)delegate
{
    
    if (!self.webViewController) {
        if (requestURL == nil) {
            self.webViewController = [[BaseWebViewController alloc] init];
        } else {
            self.webViewController = [[BaseWebViewController alloc] initWithURL:requestURL];
        }
    } else {
        [self.webViewController setUrl:requestURL];
    }
    
    self.webViewController.baseWebViewDelegate = delegate == nil ? self : delegate;
}

- (void)showLoginView:(BaseViewController *)controller
{
    UserLoginController *loginController = [[UserLoginController alloc] init];
//    loginController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    UINavigationController *loginNavigation = [[UINavigationController alloc] initWithRootViewController:loginController];
    loginNavigation.navigationBar.tintColor = [UIColor blackColor];
    
    [controller presentViewController:loginNavigation animated:YES completion:nil];
}

// 隐藏导航条
- (void)setNavigationControllerHidden:(BOOL)hidden
{
    [self.navigationController setNavigationBarHidden:hidden];
}

// 隐藏TabBar
- (void)setTabBarHidden:(BOOL)hidden
{
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSArray *views = [app.tabBarController.view subviews];
    for(id v in views){
        if([v isKindOfClass:[UITabBar class]]){
            [(UITabBar *)v setHidden:hidden];
        } else {
            [v setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        }
    }
}

// 自定义返回按钮
- (void)backItem
{
    // 返回按钮
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setFrame:CGRectMake(0.0, 0.0, 48.0, 30.0)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"backItem.png"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)goBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - BaseWebViewDelegate

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    //
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    //
}

@end

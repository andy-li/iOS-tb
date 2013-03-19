//
//  UserLoginController.m
//  WS03
//
//  Created by andy li on 13-3-18.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import "UserLoginController.h"
#import "TaobaoLoginViewController.h"

@implementation UserLoginController

@synthesize loginView;

- (id)init
{
    self = [super init];
    
    if (self) {
        //                
    }
    return self;
}

- (void)loadView
{
    [super loadView];    
    
    if (!self.loginView) {
        self.loginView = [[LoginView alloc] initWithFrame:self.view.frame];
        self.loginView.loginViewDelegate = self;
    }

    [self.loginView setNeedsLayout];
    [self.view addSubview:self.loginView];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"登录";
    
    UIBarButtonItem *close = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(close)];
    self.navigationItem.leftBarButtonItem = close;    
}

#pragma mark - Private Method

- (void)close
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - LoginViewDelegate

- (void)didSelectedTaobaoButton
{
    TaobaoLoginViewController *top = [[TaobaoLoginViewController alloc] init];
    
    [self.navigationController pushViewController:top animated:YES];        
}

@end

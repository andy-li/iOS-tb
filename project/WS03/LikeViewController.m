//
//  LikeViewController.m
//  WS03
//
//  Created by andy li on 13-3-7.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import "LikeViewController.h"

@implementation LikeViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.navigationItem.title = @"喜欢";
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:@"喜欢" image:[UIImage imageNamed:@"tabBarLike.png"] tag:0];
        self.tabBarItem = tabBarItem;
    }
    return self;
}

- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (!self.userController.isLoginIn) {
        [self showLoginView:self];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

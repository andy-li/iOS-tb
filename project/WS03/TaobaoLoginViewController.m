//
//  TaobaoLoginViewController.m
//  WS03
//
//  Created by andy li on 13-3-18.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import "defines.h"

#import "TopSDKBundle.h"
#import "TopAuthWebView.h"
#import "TopAppService.h"
#import "TopAppConnector.h"

#import "TaobaoLoginViewController.h"

@interface TaobaoLoginViewController ()

@end

@implementation TaobaoLoginViewController

- (id)init
{
    self = [super init];
    if(self) {
        //
    }
    
    return self;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self backItem];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationItem.title = @"淘宝登录";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Method

- (void)loadView
{
    [super loadView];
    
    TopIOSClient *iosClient = [TopIOSClient getIOSClientByAppKey:kTaobaoAppKey];
    id result = [iosClient auth:self cb:@selector(authCallback:)];
    
    if ([result isMemberOfClass:[TopAuthWebViewToken class]]) {
        TopAuthWebView *view = [[TopAuthWebView alloc]initWithFrame:self.view.frame];
        
        [view open:result];
        
        self.view = view;
    }
}

-(void) authCallback:(id)data
{
    if ([data isKindOfClass:[TopAuth class]])
    {
        TopAuth *auth = (TopAuth *)data;
        
        self.userController.taobaoUserId = [auth user_id];
        [self.navigationController popViewControllerAnimated:YES];                
    }
    else
    {
        NSLog(@"%@",data);
    }
}

@end

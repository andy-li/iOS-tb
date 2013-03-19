//
//  UserViewController.m
//  WS03
//
//  Created by andy li on 13-3-18.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import "UserViewController.h"

@implementation UserViewController

@synthesize isLoginIn;
@synthesize taobaoUserId;

- (id)init
{
    self = [super init];
    
    if (self) {
        self.isLoginIn = NO;
                
    }
    
    return self;
}

#pragma mark - Private Method

- (void)checkLogin
{
    ;
}

@end

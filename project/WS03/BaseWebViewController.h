//
//  BaseWebViewController.h
//  WS03
//
//  Created by andy li on 13-3-18.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BaseWebViewDelegate;

@interface BaseWebViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic, retain) NSURL *url;

@property (nonatomic, retain) id<BaseWebViewDelegate> baseWebViewDelegate;

- (id)initWithURL:(NSURL *)requestURL;
- (void)startRequest;
@end

@protocol BaseWebViewDelegate <NSObject>

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error;

@end

//
//  BaseWebViewController.m
//  WS03
//
//  Created by andy li on 13-3-18.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import "BaseWebViewController.h"

@interface BaseWebViewController()
{
    UIWebView *_webView;
    UIToolbar *_toolBar;
}
@end

@implementation BaseWebViewController

@synthesize url;
@synthesize baseWebViewDelegate;

- (id)init
{
    self = [super init];
    
    if (self) {
        self.url = nil;
        self.baseWebViewDelegate = nil;
        _webView = nil;
        _toolBar = nil;
    }
    return self;
}

- (id)initWithURL:(NSURL *)requestURL
{
    self = [super init];
    
    if (self) {
        self.url = requestURL;
        self.baseWebViewDelegate = nil;
        _webView = nil;
        _toolBar = nil;        
    }
    
    return self;
}

- (void)loadView
{
    [super loadView];
    
    CGRect bounds = [[UIScreen mainScreen] applicationFrame];
    
    [self.view setFrame:bounds];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"载入中...";
}

#pragma mark - Private Method

- (void)layoutViews
{    
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-44.0);
    
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:rect];
        _webView.scalesPageToFit = YES;
        _webView.delegate = self;
        [self.view addSubview:_webView];
    }
    
    if (!_toolBar) {
        _toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(rect.origin.x, rect.size.height-44.0, rect.size.width, 44.0)];
        [self.view addSubview:_toolBar];
    }   
}

- (void)startRequest
{
    
    if (!self.url) {
        return;
    }
    
    [self layoutViews];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
    
    [_webView loadRequest:request];
}

#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    if (self.baseWebViewDelegate) {
        if ([self.baseWebViewDelegate conformsToProtocol:@protocol(BaseWebViewDelegate)] &&
            [self.baseWebViewDelegate respondsToSelector:@selector(webView:didFailLoadWithError:)]) {
            [self.baseWebViewDelegate webView:webView didFailLoadWithError:error];
        }
    }
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"start request");
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;    
}

@end

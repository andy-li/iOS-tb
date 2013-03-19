//
//  LoadingActivityView.m
//  WS03
//
//  Created by andy li on 13-3-11.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import "LoadingActivityView.h"

#define kLoadingActivityOffsetY (20.0)

@interface LoadingActivityView()
{
    UILabel *_loadingLabelView;
    UIActivityIndicatorView *_loadingIconView;
}

@end

@implementation LoadingActivityView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //
        CGRect rect = CGRectMake(frame.origin.x, frame.origin.y + kLoadingActivityOffsetY, frame.size.width, frame.size.height);
        [self setFrame:rect];
    }
    return self;
}

- (void)start
{
    float loadingViewWidth = self.frame.size.width , loadingViewHeight = 30.0, loadingLableViewWidth = 80.0, loadingLableViewHeight = 20.0;
    
    
    _loadingIconView= [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _loadingIconView.center = CGPointMake((loadingViewWidth - loadingLableViewWidth)/2, loadingViewHeight/2);
    
    _loadingLabelView = [[UILabel alloc] initWithFrame:
                         CGRectMake((loadingViewWidth - loadingLableViewWidth) / 2 + 20.0, (loadingViewHeight - loadingLableViewHeight) / 2,
                                    loadingLableViewWidth, loadingLableViewHeight)];
    _loadingLabelView.text = @"加载中...";
    _loadingLabelView.font = [UIFont fontWithName:@"Arial" size:14.0];
    _loadingLabelView.textColor = [UIColor grayColor];
    _loadingLabelView.textAlignment = NSTextAlignmentLeft;
    
    [self addSubview:_loadingIconView];
    [self addSubview:_loadingLabelView];
    
    [_loadingIconView startAnimating];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)stop
{
    if (self.superview) {
        [self removeFromSuperview];
    }
    
    [_loadingLabelView removeFromSuperview];
    [_loadingIconView stopAnimating];
    [_loadingIconView removeFromSuperview];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
}

@end

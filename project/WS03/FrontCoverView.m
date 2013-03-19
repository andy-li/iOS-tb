//
//  FrontCoverView.m
//  WS03
//
//  Created by andy li on 13-3-7.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import "FrontCoverView.h"

@interface FrontCoverView()
{
    UIImageView *imageView;
    UIImage *coverImage;
}

@end

@implementation FrontCoverView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        imageView = [[UIImageView alloc] initWithFrame:frame];
        coverImage = [UIImage imageNamed:@"opening.png"];
        imageView.image = coverImage;
    }
    
    return self;
}

- (void)open
{
    [self addSubview:imageView];
}

- (void)close
{    
    if (self.superview) {
        [self removeFromSuperview];
    }
    [imageView removeFromSuperview];
}

- (void)layoutSubviews
{
    if (!imageView.superview) {
        [self open];
    }
}

@end

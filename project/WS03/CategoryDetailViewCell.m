//
//  CategoryDetailViewCell.m
//  WS03
//
//  Created by andy li on 13-3-15.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "CategoryDetailViewCell.h"

#define kCategoryDetailCellLabelHeight (24.0)

@interface CategoryDetailViewCell()
{
    UIView *_view;
    UIButton *_backgroundBtn;
    UIView *_labelView;
}
@end

@implementation CategoryDetailViewCell

@synthesize categoryId;
@synthesize imageView;
@synthesize nameLabel;

@synthesize delegate;

- (id)initWithFrame:(CGRect)frame categoryId:(NSString *)cid
{
    self = [super initWithFrame:frame];
    if (self) {
        self.categoryId = cid;
        
        CGRect rect = CGRectMake(0, 0, frame.size.width, frame.size.height);
        
        _view = [[UIView alloc] initWithFrame: rect];
//        _view.layer.borderWidth = 2.0;
//        _view.layer.borderColor = [UIColor colorWithRed:204.0/255.0 green:204.0/255.0 blue:204.0/255.0 alpha:1.0].CGColor;
        
        _backgroundBtn = [[UIButton alloc] initWithFrame: rect];
        
        [_backgroundBtn addTarget:self action:@selector(didSelectCell) forControlEvents:UIControlEventTouchUpInside];
        
        self.imageView = [[UIImageView alloc] initWithFrame:rect];
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height - kCategoryDetailCellLabelHeight, frame.size.width, kCategoryDetailCellLabelHeight)];
        _labelView = [[UIView alloc] initWithFrame:CGRectMake(0, frame.size.height - kCategoryDetailCellLabelHeight, frame.size.width, kCategoryDetailCellLabelHeight)];
        _labelView.backgroundColor = [UIColor blackColor];
        _labelView.alpha = 0.6;
        
        self.nameLabel.backgroundColor = [UIColor clearColor];
        self.nameLabel.textColor = [UIColor whiteColor];
        self.nameLabel.textAlignment = NSTextAlignmentCenter;
        self.nameLabel.font = [UIFont fontWithName:@"Helvetica" size:12.0];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];  
    
    [_view addSubview:_backgroundBtn];
    [_view addSubview:imageView];
    [_view addSubview:_labelView];
    [_view addSubview:nameLabel];
    
    [_view sendSubviewToBack:_backgroundBtn];
    [_view bringSubviewToFront:nameLabel];

    [self addSubview:_view];
}

#pragma mark - Private Method

- (void)didSelectCell
{
    if (self.delegate) {
        if([self.delegate conformsToProtocol:@protocol(CategoryDetailViewCellDelegate)] &&
           [self.delegate respondsToSelector:@selector(didSelectDetailCell:)])
        {
            [self.delegate didSelectDetailCell:self];
        }
    }
}

@end

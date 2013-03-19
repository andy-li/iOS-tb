//
//  ProductDetailView.m
//  WS03
//
//  Created by andy li on 13-3-11.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "ProductDetailView.h"

#define kProductDetailViewOffsetX (5.0f)
#define kProductDetailViewOffsetY (10.0f)
#define kProductDetailViewWidth (self.frame.size.width - kProductDetailViewOffsetX * 2)
#define kProductDetailContentViewOffsetX (10.0f)
#define kProductDetailContentViewOffsetY (10.0f)
#define kProductDetailContentSpace (10.0f)
#define kProductDetailContentViewWidth (kProductDetailViewWidth - kProductDetailContentViewOffsetX * 2)

@interface ProductDetailView()
{
    UIToolbar *_toolBar;
    UIScrollView *_scrollView;
}
@end

@implementation ProductDetailView

@synthesize productData;
@synthesize productDetailDelegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height - 44.0)];
        _scrollView.delegate = nil;
        _toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0, frame.size.height - 44.0, frame.size.width, 44.0)];
        [_toolBar setBarStyle:UIBarStyleBlackOpaque];
        _toolBar.autoresizesSubviews = UIViewAutoresizingFlexibleTopMargin;
    }
    return self;
}

- (void)layoutSubviews
{
    if (self.productData == nil) {
        return;
    }
    
    UIView *contentView = [[UIView alloc] init];
    float contentHeight = 0.0f;
    CGSize size = CGSizeMake(kProductDetailContentViewWidth, 100);
    
    /* ************** 产品名称 ************** */
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];

    NSString *titleText = [NSString stringWithFormat:@"%@", [self.productData objectForKey:@"ProductTitle"]];
    UIFont *titleFont = [UIFont fontWithName:@"Helvetica" size:12.0f];
    
    [titleLabel setNumberOfLines:0];
    

    CGSize titleLabelSize = [titleText sizeWithFont:titleFont constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];
    
    [titleLabel setFrame:CGRectMake(kProductDetailContentViewOffsetX, kProductDetailContentViewOffsetY, titleLabelSize.width, titleLabelSize.height)];
    titleLabel.text = titleText;
    titleLabel.font = titleFont;
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.backgroundColor = [UIColor clearColor];
    
    contentHeight += (kProductDetailContentViewOffsetY + titleLabelSize.height);
    
    [contentView addSubview:titleLabel];
    
    /* ************** 产品图片 ************** */
    NSURL *imageUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@",
                                            [(NSArray *)[self.productData objectForKey:@"ProductImages"] objectAtIndex:0]]];

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL: imageUrl]];

    imageView.image = image;
    [imageView setFrame:CGRectMake(kProductDetailContentViewOffsetX, contentHeight + kProductDetailContentSpace, kProductDetailContentViewWidth, image.size.height)];
    imageView.backgroundColor = [UIColor whiteColor];
    
    UIButton *bigBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [bigBtn setFrame:CGRectMake(kProductDetailContentViewWidth - 60.0, image.size.height + kProductDetailContentViewOffsetY, 60.0, 25.0)];
    [bigBtn setTitle:[NSString stringWithFormat:@"大图(%d)", [(NSArray *)[self.productData objectForKey:@"ProductImages"] count]] forState:UIControlStateNormal];
    [bigBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bigBtn.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:12.0]];
    bigBtn.titleLabel.textAlignment = NSTextAlignmentRight;

    [bigBtn setBackgroundImage:[[UIImage imageNamed:@"bigBtnBg.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [bigBtn addTarget:self action:@selector(bigButtonClicked:) forControlEvents:UIControlEventTouchUpInside];

    
    contentHeight += (kProductDetailContentSpace + image.size.height);

    [contentView addSubview:imageView];
    [contentView addSubview: bigBtn];
    
    /* ************** 价格&购买按钮 ************** */
    UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    NSString *priceText = [NSString stringWithFormat:@"￥%@", (NSString *)[self.productData objectForKey:@"ProductPrice"]];
//    UIFont *priceFont = [UIFont fontWithName:@"Helvetica-BoldOblique" size:18.0f];
    UIFont *priceFont = [UIFont fontWithName:@"Helvetica" size:18.0f];
    
    [priceLabel setFrame:CGRectMake(kProductDetailContentViewOffsetX, contentHeight + kProductDetailContentViewOffsetY, 50.0, 40.0)];
    [priceLabel setFont:priceFont];
    priceLabel.textColor = [UIColor colorWithRed:230.0/255.0 green:115.0/255.0 blue:0 alpha:1.0];
    priceLabel.text = priceText;
    
    UIButton *buyBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buyBtn setFrame:CGRectMake(kProductDetailContentViewWidth - 100 + kProductDetailContentViewOffsetX,
                                contentHeight + kProductDetailContentViewOffsetY, 100.0, 40.0)];
    [buyBtn setBackgroundImage:[UIImage imageNamed:@"buyBtnBg.png"] forState:UIControlStateNormal];
//    [buyBtn setBackgroundImage:[UIImage imageNamed:@"buyBtnSelectedBg.png"] forState:UIControlStateSelected];
    
    [buyBtn addTarget:self action:@selector(buyButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    contentHeight += (kProductDetailContentSpace + priceLabel.frame.size.height);
    
    [contentView addSubview:priceLabel];
    [contentView addSubview:buyBtn];
    
    /* ************** ContentView ************** */
    contentHeight += kProductDetailContentViewOffsetY;
    [contentView setFrame:CGRectMake(kProductDetailViewOffsetX, kProductDetailViewOffsetY, kProductDetailViewWidth, contentHeight)];
    contentView.layer.borderWidth = 1.0f;
    contentView.layer.borderColor = [[UIColor colorWithRed:221.0/255.0 green:221.0/255.0 blue:221.0/255.0 alpha:1.0] CGColor];
    contentView.backgroundColor = [UIColor colorWithRed:253.0/255.0 green:251.0/255.0 blue:251.0/255.0 alpha:1.0];
    
    [_scrollView addSubview:contentView];
    float scrollViewHeight = 0.0;
    scrollViewHeight += contentHeight;
    scrollViewHeight += kProductDetailViewOffsetY*2;
    _scrollView.contentSize = CGSizeMake(self.frame.size.width, scrollViewHeight);
    
    if (scrollViewHeight < (self.frame.size.height - 44.0)) {
        _scrollView.scrollEnabled = NO;
    }
    
    [self addSubview:_scrollView];
    
    /* ************** ToolBar ************** */
    // like
    UIButton *likeBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [likeBtn setFrame:CGRectMake(0.0, 0.0, 60.0, 29.0)];
    [likeBtn setBackgroundImage:[UIImage imageNamed:@"likeBarBtn.png"] forState:UIControlStateNormal];
    [likeBtn addTarget:self action:@selector(likeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    // comment
    UIButton *commentBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [commentBtn setFrame:CGRectMake(0.0, 0.0, 60.0, 29.0)];
    [commentBtn setBackgroundImage:[UIImage imageNamed:@"commentBarBtn.png"] forState:UIControlStateNormal];
    [commentBtn addTarget:self action:@selector(commentButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    // share
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [shareBtn setFrame:CGRectMake(0.0, 0.0, 60.0, 29.0)];
    [shareBtn setBackgroundImage:[UIImage imageNamed:@"shareBarBtn.png"] forState:UIControlStateNormal];
    [shareBtn addTarget:self action:@selector(shareButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIBarButtonItem *likeBarBtn = [[UIBarButtonItem alloc] initWithCustomView:likeBtn];
    UIBarButtonItem *commentBarBtn = [[UIBarButtonItem alloc] initWithCustomView:commentBtn];
    UIBarButtonItem *shareBarBtn = [[UIBarButtonItem alloc] initWithCustomView:shareBtn];
    UIBarButtonItem *flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    [_toolBar setItems:[NSArray arrayWithObjects:likeBarBtn,flex, commentBarBtn, flex, shareBarBtn, nil]];
    
    [self addSubview:_toolBar];
}

- (void)bigButtonClicked:(id)sender
{
    if (self.productDetailDelegate != nil) {
        if ([self.productDetailDelegate conformsToProtocol:@protocol(ProductDetailDelegate)]) {
            if ([self.productDetailDelegate respondsToSelector:@selector(productDetailView:didSelectedBigBtn:)]) {
                [self.productDetailDelegate productDetailView:self didSelectedBigBtn:sender];
            }
        }
    }
}

- (void)buyButtonClicked:(id)sender
{
    if (self.productDetailDelegate != nil) {
        if ([self.productDetailDelegate conformsToProtocol:@protocol(ProductDetailDelegate)]) {
            if ([self.productDetailDelegate respondsToSelector:@selector(productDetailView:didSelectedBuyBtn:)]) {
                [self.productDetailDelegate productDetailView:self didSelectedBuyBtn:sender];
            }
        }
    }
}

- (void)likeButtonClicked:(id)sender
{
    if (self.productDetailDelegate != nil) {
        if ([self.productDetailDelegate conformsToProtocol:@protocol(ProductDetailDelegate)]) {
            if ([self.productDetailDelegate respondsToSelector:@selector(productDetailView:didSelectedLikeBtn:)]) {
                [self.productDetailDelegate productDetailView:self didSelectedLikeBtn:sender];
            }
        }
    }
}

- (void)commentButtonClicked:(id)sender
{
    if (self.productDetailDelegate != nil) {
        if ([self.productDetailDelegate conformsToProtocol:@protocol(ProductDetailDelegate)]) {
            if ([self.productDetailDelegate respondsToSelector:@selector(productDetailView:didSelectedCommentBtn:)]) {
                [self.productDetailDelegate productDetailView:self didSelectedCommentBtn:sender];
            }
        }
    }
}

- (void)shareButtonClicked:(id)sender
{
    if (self.productDetailDelegate != nil) {
        if ([self.productDetailDelegate conformsToProtocol:@protocol(ProductDetailDelegate)]) {
            if ([self.productDetailDelegate respondsToSelector:@selector(productDetailView:didSelectedShareBtn:)]) {
                [self.productDetailDelegate productDetailView:self didSelectedShareBtn:sender];
            }
        }
    }
}

@end

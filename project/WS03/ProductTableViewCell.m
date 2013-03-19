//
//  ProductTableViewCell.m
//  WS03
//
//  Created by andy li on 13-3-8.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ProductTableViewCell.h"

#define kCellViewBorderColor ([UIColor colorWithRed:221.0/255.0 green:221.0/255.0 blue:221.0/255.0 alpha:1.0])
//#define kNameLabelTextColor ([UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0])
#define kNameLabelTextColor ([UIColor blackColor])
#define kPriceLableTextColor ([UIColor colorWithRed:230.0/255.0 green:115.0/255.0 blue:0 alpha:1.0])

@implementation ProductTableViewCell

@synthesize productId;
@synthesize view;
@synthesize imageView;
@synthesize nameLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        //
        self.productId = 0;
        
        self.view = [[UIView alloc] init];
        [self.view setFrame:CGRectMake(0.0, 0.0, self.frame.size.width, self.frame.size.height)];
        self.view.backgroundColor = [UIColor clearColor];
        self.view.layer.borderWidth = 1.0;
        self.view.layer.borderColor = kCellViewBorderColor.CGColor;
        
        self.imageView = [[UIImageView alloc] init];        
        self.nameLabel = [[UILabel alloc] init];
        self.priceLabel = [[UILabel alloc] init];
        
        self.nameLabel.font = [UIFont fontWithName:@"Arial" size:12.0f];
        self.nameLabel.textColor = kNameLabelTextColor;
        
        self.priceLabel.font = [UIFont fontWithName:@"Arial" size:14.0f];
        self.priceLabel.textColor = kPriceLableTextColor;
        
//        self.priceLabel.alpha = 0.9;
//        self.priceLabel.textColor = [UIColor whiteColor];
        self.priceLabel.textAlignment = NSTextAlignmentRight;
//        self.priceLabel.layer.backgroundColor = [UIColor blackColor].CGColor;
//        self.priceLabel.layer.cornerRadius = 5.0;
        
        self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.frame];
        self.selectedBackgroundView.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)layoutViews
{
    
    self.view.clipsToBounds = YES;
    
    [self.view addSubview:self.priceLabel];
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.nameLabel];
    
    [self addSubview:self.view];
}

@end

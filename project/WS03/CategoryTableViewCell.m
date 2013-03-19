//
//  CategoryTableViewCell.m
//  WS03
//
//  Created by andy li on 13-3-14.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "CategoryTableViewCell.h"

@implementation CategoryTableViewCell

@synthesize view;
@synthesize categoryId;
@synthesize imageView;
@synthesize titleLabel;
@synthesize descriptionLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        //
        self.categoryId = 0;
        
        self.view = [[UIView alloc] init];
        [self.view setFrame:CGRectMake(0.0, 0.0, self.frame.size.width, self.frame.size.height)];
        self.view.backgroundColor = [UIColor whiteColor];
//        self.view.layer.borderWidth = 1.0;
        
        self.imageView = [[UIImageView alloc] init];
        self.titleLabel = [[UILabel alloc] init];
        self.descriptionLabel = [[UILabel alloc] init];
        
        self.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16.0];
        self.titleLabel.textColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0];
        
        self.descriptionLabel.font = [UIFont fontWithName:@"Helvetica" size:12.0];
        self.descriptionLabel.textColor = [UIColor grayColor];

        
        self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.frame];
        self.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:239.0/255.0 alpha:1.0];                
        
        self.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}

- (void)layoutViews
{    
//    self.view.clipsToBounds = YES;

    [self.view addSubview:self.imageView];
    
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.descriptionLabel];
    
    [self addSubview:self.view];
}

@end

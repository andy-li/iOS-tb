//
//  CategoryTableViewCell.h
//  WS03
//
//  Created by andy li on 13-3-14.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryTableViewCell : UITableViewCell

@property (nonatomic,retain) NSString *categoryId;

@property (nonatomic, retain) UIView *view;
@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UILabel *descriptionLabel;

- (void)layoutViews;

@end

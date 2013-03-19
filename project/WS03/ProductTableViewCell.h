//
//  ProductTableViewCell.h
//  WS03
//
//  Created by andy li on 13-3-8.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductTableViewCell : UITableViewCell

@property (nonatomic,retain) NSString *productId;

@property (nonatomic, retain) UIView *view;
@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UILabel *nameLabel;
@property (nonatomic, retain) UILabel *priceLabel;

- (void)layoutViews;

@end

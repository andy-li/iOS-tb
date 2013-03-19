//
//  CategoryDetailViewCell.h
//  WS03
//
//  Created by andy li on 13-3-15.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CategoryDetailViewCellDelegate;


@interface CategoryDetailViewCell : UIView

@property (nonatomic, retain) NSString *categoryId;
@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UILabel *nameLabel;

@property (nonatomic, retain) id<CategoryDetailViewCellDelegate> delegate;

- (id)initWithFrame:(CGRect)frame categoryId:(NSString *)cid;

@end



@protocol CategoryDetailViewCellDelegate <NSObject>

- (void)didSelectDetailCell:(CategoryDetailViewCell *)cell;

@end

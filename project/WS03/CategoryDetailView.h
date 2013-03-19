//
//  CategoryDetailView.h
//  WS03
//
//  Created by andy li on 13-3-15.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryDetailViewCell.h"

@protocol CategoryDetailDelegate;

@interface CategoryDetailView : UIView <CategoryDetailViewCellDelegate>

@property (nonatomic, retain) NSMutableDictionary *detailData;
@property (nonatomic, retain) id<CategoryDetailDelegate> categoryDetailDelegate;

@end

@protocol CategoryDetailDelegate <NSObject>

- (void)didSelectedCategoryDetailCell:(CategoryDetailViewCell *)cell;

@end

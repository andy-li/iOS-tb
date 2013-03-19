//
//  CategoryTableView.h
//  WS03
//
//  Created by andy li on 13-3-13.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryTableViewCell.h"

@protocol CategoryTableViewDelegate;

@interface CategoryTableView : UITableView <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) NSMutableArray *categoryData;
@property (nonatomic, retain) id<CategoryTableViewDelegate> categoryTableViewDelegate;

@end


@protocol CategoryTableViewDelegate <NSObject>

- (void)didSelectedTableCell:(CategoryTableViewCell *)cell;

@end

//
//  ProductTableView.h
//  WS03
//
//  Created by andy li on 13-3-8.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ProductTableViewCell.h"

@protocol ProductTableViewDelegate;

@interface ProductTableView : UITableView <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) NSMutableArray *productData;
@property (nonatomic, retain) id<ProductTableViewDelegate> productTableViewDelegate;

@end


@protocol ProductTableViewDelegate <NSObject>

- (void)didSelectedTableCell:(ProductTableViewCell *)cell;

@end
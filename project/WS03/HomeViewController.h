//
//  HomeViewController.h
//  WS03
//
//  Created by andy li on 13-3-7.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import "BaseViewController.h"

#import "ProductModel.h"
#import "ProductTableView.h"


@interface HomeViewController : BaseViewController <ProductModelDelegate, ProductTableViewDelegate>

@property (nonatomic, retain) ProductModel *productModel;
@property (nonatomic, retain) NSMutableArray *data;

@end

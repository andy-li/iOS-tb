//
//  CategoryProductListController.h
//  WS03
//
//  Created by andy li on 13-3-15.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import "BaseViewController.h"

#import "ProductModel.h"
#import "ProductTableView.h"

@interface CategoryProductListController : BaseViewController <ProductModelDelegate, ProductTableViewDelegate>

@property (nonatomic, retain) ProductModel *productModel;
@property (nonatomic, retain) NSMutableDictionary *categoryData;
@property (nonatomic, retain) NSMutableArray *productsData;

- (id)initWithCategoryId:(NSString *)categoryId;

@end

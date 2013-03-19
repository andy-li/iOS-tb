//
//  ProductDetailViewController.h
//  WS03
//
//  Created by andy li on 13-3-8.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import "BaseViewController.h"
#import "ProductModel.h"
#import "ProductDetailView.h"

@interface ProductDetailViewController : BaseViewController<ProductModelDelegate, ProductDetailDelegate>

@property (nonatomic, retain) ProductModel *productModel;
@property (nonatomic, retain) NSMutableDictionary *data;

- (id)initWithProductId:(NSString *)productId;

@end

//
//  ProductModel.h
//  WS03
//
//  Created by andy li on 13-3-7.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import "BaseModel.h"

@protocol ProductModelDelegate;

@interface ProductModel : BaseModel

@property (nonatomic, retain) id<ProductModelDelegate> productModelDelegate;

- (void)getHomeProductDataAtPage: (int)page;
- (void)getProductDataByCategoryId: (NSString *)categoryId page:(NSInteger)page;
- (void)getProductDetailDataAtProductId: (NSString *)productId;

@end

@protocol ProductModelDelegate <NSObject>

- (void)productModel:(ProductModel *)productModel dataOfProductDidLoad:(NSMutableDictionary *)productData;

@end



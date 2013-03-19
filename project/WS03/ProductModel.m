//
//  ProductModel.m
//  WS03
//
//  Created by andy li on 13-3-7.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import "ProductModel.h"

#define kHomeProductDataJSON (@"http://127.0.0.1/com.ios/api/ws02/homeProductsDataJSON.php")
#define kProductDataByCategoryIdJSON (@"http://127.0.0.1/com.ios/api/ws02/ProductDataByCategoryIdJSON.php")
#define kProductDetailDataJSON (@"http://127.0.0.1/com.ios/api/ws02/ProductDetailDataJSON.php?productId=")

@interface ProductModel()

@end

@implementation ProductModel

@synthesize resultData;
@synthesize productModelDelegate;

- (id)init
{
    self = [super init];
    
    if (self) {
        //
        self.productModelDelegate = nil;
    }
    
    return self;
}

- (void)getHomeProductDataAtPage:(int)page
{
    int sessionId = random() % 50000;
    
    // 创建URL
    NSURL *url = [[NSURL alloc] initWithString:[[NSString alloc] initWithFormat:@"%@?page=%d&session=%d", kHomeProductDataJSON, page, sessionId]];
    
    [self createRequestByURL:url];
}

- (void)getProductDataByCategoryId:(NSString *)categoryId page:(NSInteger)page
{
    int sessionId = random() % 5000;
    
    NSURL *url = [[NSURL alloc] initWithString:
                  [NSString stringWithFormat:@"%@?categoryId=%@&page=%d&session=%d", kProductDataByCategoryIdJSON,categoryId,page,sessionId]];
    [self createRequestByURL:url];
 }

- (void)getProductDetailDataAtProductId:(NSString *)productId
{
    int sessionId = random() % 50000;
    
    NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@&session=%d", kProductDetailDataJSON, productId, sessionId]];
    
    [self createRequestByURL:url];
}


- (void)loadDataFinish
{
    [super loadDataFinish];
    if (self.productModelDelegate != nil) {
        if ([self.productModelDelegate conformsToProtocol:@protocol(ProductModelDelegate)]) {
            if ([self.productModelDelegate respondsToSelector:@selector(productModel:dataOfProductDidLoad:)]) {
                [self.productModelDelegate productModel:self dataOfProductDidLoad:self.results];
            }
        }
    }
}

@end

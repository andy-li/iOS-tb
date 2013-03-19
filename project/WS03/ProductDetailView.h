//
//  ProductDetailView.h
//  WS03
//
//  Created by andy li on 13-3-11.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ProductDetailDelegate;

@interface ProductDetailView : UIView

@property (nonatomic, retain) NSMutableDictionary *productData;
@property (nonatomic, retain) id<ProductDetailDelegate> productDetailDelegate;

- (void)bigButtonClicked:(id)sender;

@end


@protocol ProductDetailDelegate <NSObject>

- (void)productDetailView:(ProductDetailView *)productDetailView didSelectedBigBtn:(id)sender;
- (void)productDetailView:(ProductDetailView *)productDetailView didSelectedBuyBtn:(id)sender;
- (void)productDetailView:(ProductDetailView *)productDetailView didSelectedLikeBtn:(id)sender;
- (void)productDetailView:(ProductDetailView *)productDetailView didSelectedCommentBtn:(id)sender;
- (void)productDetailView:(ProductDetailView *)productDetailView didSelectedShareBtn:(id)sender;
@end
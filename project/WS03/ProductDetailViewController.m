//
//  ProductDetailViewController.m
//  WS03
//
//  Created by andy li on 13-3-8.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//
//#import "BaseWebViewController.h"
#import "SVWebViewController.h"

#import "ProductDetailViewController.h"
#import "LoadingActivityView.h"

@interface ProductDetailViewController()
{
    NSString *_productId;
    LoadingActivityView *_loadingView;
    ProductDetailView *_productDetailView;
}

@end

@implementation ProductDetailViewController

@synthesize productModel;
@synthesize data;

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (id)initWithProductId:(NSString *)productId
{
    self = [super init];
    _productId = productId;
    
    if (self) {
        //
        self.navigationItem.title = @"宝贝详情";        
    }
    
    return self;
}

- (void)loadView
{
    [super loadView];
    
    if (!self.view) {
        self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    }

    self.view.backgroundColor = [UIColor whiteColor];        

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self backItem];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self startLoading];
    [self performSelectorInBackground:@selector(loadProductDetail) withObject:nil];
}


#pragma mark - Private Method

- (void)startLoading
{
    if (!_loadingView) {
        _loadingView = [[LoadingActivityView alloc] initWithFrame:self.view.frame];
    }
    
    [_loadingView start];
    [self.view addSubview:_loadingView];
    [self.view bringSubviewToFront:_loadingView];
}

- (void)stopLoading
{
    [_loadingView stop];
    [_loadingView removeFromSuperview];
}

- (void)layoutViews
{
    if (!_productDetailView) {
        _productDetailView = [[ProductDetailView alloc] initWithFrame:self.view.frame];
        _productDetailView.productDetailDelegate = self;
    }
    
    _productDetailView.productData = self.data;
    [self stopLoading];
    [_productDetailView setNeedsLayout];    
    [self.view addSubview:_productDetailView];
}

- (void)loadProductDetail
{
    [NSThread sleepForTimeInterval: 1];
    if (self.productModel == nil) {
        self.productModel = [[ProductModel alloc] init];
    }
    
    self.productModel.productModelDelegate = self;
    
    [self.productModel getProductDetailDataAtProductId: _productId];
}

#pragma mark - ProductModelDelegate

- (void)productModel:(ProductModel *)productModel dataOfProductDidLoad:(NSDictionary *)productData
{
    self.data = [productData objectForKey:@"Product"];
    [self layoutViews];
}

#pragma mark - ProductDetailDelegate

- (void)productDetailView:(ProductDetailView *)productDetailView didSelectedBigBtn:(id)sender
{
    NSLog(@"Big Button Clicked.");
}

- (void)productDetailView:(ProductDetailView *)productDetailView didSelectedBuyBtn:(id)sender
{
//    NSLog(@"%@", productDetailView.productData);
//    if (self.userController.isLoginIn == NO) {
//        [self showLoginView:self];
//    }
    
    NSString *url = [productDetailView.productData objectForKey:@"ProductUrl"];
    
//    BaseWebViewController *webView = [[BaseWebViewController alloc] initWithURL:[NSURL URLWithString:url]];
//    [webView startRequest];
//    [self.navigationController pushViewController:webView animated:YES];
    
    SVWebViewController *webView = [[SVWebViewController alloc] initWithAddress:url];
    [self.navigationController pushViewController:webView animated:YES];
}

- (void)productDetailView:(ProductDetailView *)productDetailView didSelectedLikeBtn:(id)sender
{
    NSLog(@"Lkie Bar Button Clicked");
}

- (void)productDetailView:(ProductDetailView *)productDetailView didSelectedCommentBtn:(id)sender
{
    NSLog(@"Comment Bar Button Clicked");
}

- (void)productDetailView:(ProductDetailView *)productDetailView didSelectedShareBtn:(id)sender
{
    NSLog(@"Share Bar Button Clicked");
}

@end

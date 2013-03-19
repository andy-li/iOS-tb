//
//  CategoryProductListController.m
//  WS03
//
//  Created by andy li on 13-3-15.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import "CategoryProductListController.h"
#import "ProductDetailViewController.h"
#import "LoadingActivityView.h"

@interface CategoryProductListController()
{
    NSString *_categoryId;
    ProductTableView *_productTableView;
    LoadingActivityView *_loadingView;
    NSInteger _currentPage;
}

@end

@implementation CategoryProductListController

@synthesize productModel;
@synthesize categoryData;
@synthesize productsData;

- (id)initWithCategoryId:(NSString *)categoryId
{
    self = [super init];
    
    if (self) {
        //
        _currentPage = 0;
        _categoryId = categoryId;
        self.navigationItem.title = @"加载中...";
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
    [self backItem];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self startLoading];
    [self performSelectorInBackground:@selector(loadCategoryProductList) withObject:nil];
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
    if (!self.categoryData) {
        return;
    }
    
    if (_productTableView == nil) {
        CGRect rect = self.view.frame;
        _productTableView = [[ProductTableView alloc] initWithFrame:rect style:UITableViewStylePlain];
        _productTableView.productTableViewDelegate = self;
    }
    
    _productTableView.productData = self.productsData;
    [_productTableView reloadData];
    
    self.navigationItem.title = [self.categoryData objectForKey:@"CategoryName"];
    [self stopLoading];
    [self.view addSubview:_productTableView];
}

- (void)loadCategoryProductList
{
    [NSThread sleepForTimeInterval:1];
    
    if (self.productModel == nil) {
        self.productModel = [[ProductModel alloc] init];
        self.productModel.productModelDelegate = self;
    }
    
    [self.productModel getProductDataByCategoryId:_categoryId page:_currentPage];
}


#pragma mark - ProductModelDelegate

- (void)productModel:(ProductModel *)productModel dataOfProductDidLoad:(NSDictionary *)productData
{
    NSDictionary *dict = [productData objectForKey:@"ProductsData"];
    
    self.categoryData = [dict objectForKey:@"Category"];
    self.productsData = [dict objectForKey:@"Products"];
    
    [self layoutViews];
}

#pragma mark - ProductTableViewDelegate

- (void)didSelectedTableCell:(ProductTableViewCell *)cell
{
    ProductDetailViewController *productViewController = [[ProductDetailViewController alloc] initWithProductId:cell.productId];
    // 隐藏TAB BAR
    [productViewController setHidesBottomBarWhenPushed:YES];
    
    [self.navigationController pushViewController:productViewController animated:YES];
}


@end

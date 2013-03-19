//
//  HomeViewController.m
//  WS03
//
//  Created by andy li on 13-3-7.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import "HomeViewController.h"
#import "FrontCoverView.h"
#import "ProductDetailViewController.h"

//#define kTabelViewContentOffsetX 10.0f
//#define kTableViewContentOffsetY 10.0f

@interface HomeViewController()
{
    FrontCoverView *_frontCoverView;
    ProductTableView *_productTableView;
    int _currentPage;
}

- (void)layoutViews;
- (void)openFrontCoverView;
- (void)closeFrontCoverView;
- (void)loadProductData;

@end

@implementation HomeViewController

@synthesize productModel;
@synthesize data;

- (id)init
{
    self = [super initWithTitle:@"首页" andTabBarImageName:@"tabBarHome.png"];
    
    if (self) {
        self.data = nil;
        _currentPage = 0;
    }
    
    return self;
}

- (void)loadView
{
    CGRect rect = [[UIScreen mainScreen] bounds];
    
    self.view = [[UIView alloc] initWithFrame:rect];
    _frontCoverView = [[FrontCoverView alloc] initWithFrame:rect];
    
}

- (void)viewWillAppear:(BOOL)animated
{

}

- (void)viewDidAppear:(BOOL)animated
{

}

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view.
    [self openFrontCoverView];
    
    [self performSelectorInBackground:@selector(loadProductData) withObject:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Private Method

// 打开封面图片
- (void)openFrontCoverView
{
    [self setNavigationControllerHidden:YES];
    [self setTabBarHidden:YES];
    
    [_frontCoverView open];
    [self.view addSubview:_frontCoverView];
}

// 关闭封面图片
- (void)closeFrontCoverView
{
    [self.navigationController setNavigationBarHidden:NO];
    [self.tabBarController.tabBar setHidden:NO];
    
    [_frontCoverView close];
}

- (void)layoutViews
{
    if (_productTableView == nil) {
        CGRect rect = self.view.frame;               
        _productTableView = [[ProductTableView alloc] initWithFrame:rect style:UITableViewStylePlain];
        _productTableView.productTableViewDelegate = self;
    }
    
    _productTableView.productData = self.data;
    [_productTableView reloadData];
    [self.view addSubview:_productTableView];
}

// 加载产品数据
- (void)loadProductData
{
    [NSThread sleepForTimeInterval:1];
    
    if (self.productModel == nil) {
        self.productModel = [[ProductModel alloc] init];
        self.productModel.productModelDelegate = self;
    }
    
    [self.productModel getHomeProductDataAtPage: _currentPage];
}

#pragma mark - ProductModelDelegate

- (void)productModel:(ProductModel *)productModel dataOfProductDidLoad:(NSDictionary *)productData
{
    self.data = [productData objectForKey:@"Products"];
    [self closeFrontCoverView];
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

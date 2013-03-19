//
//  CategoryDetailViewController.m
//  WS03
//
//  Created by andy li on 13-3-15.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import "LoadingActivityView.h"
#import "CategoryDetailViewController.h"
#import "CategoryProductListController.h"

@interface CategoryDetailViewController()
{
    NSString *_categoryId;
    LoadingActivityView *_loadingView;
    CategoryDetailView *_detailView;
}

@end

@implementation CategoryDetailViewController

@synthesize categoryModel;
@synthesize data;

- (id)initWithCategoryId:(NSString *)categoryId
{
    self = [super init];
    
    if (self) {
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
    [self performSelectorInBackground:@selector(loadCategoryDetail) withObject:nil];
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

- (void)loadCategoryDetail
{
    [NSThread sleepForTimeInterval:1];
    if (self.categoryModel == nil) {
        self.categoryModel = [[CategoryModel alloc] init];
    }
    
    self.categoryModel.categoryModelDelegate = self;
    
    [self.categoryModel getCategoriesByRootCategoryId:_categoryId];
}

- (void)layoutViews
{
    [self stopLoading];
    self.navigationItem.title = [self.data objectForKey:@"CategoryName"];
    
    if (!_detailView) {
        _detailView = [[CategoryDetailView alloc] initWithFrame:self.view.frame];
        _detailView.categoryDetailDelegate = self;
        _detailView.detailData = self.data;
    }
    
    [_detailView layoutIfNeeded];
    
    [self.view addSubview:_detailView];
    [self.view bringSubviewToFront:_detailView];
}


#pragma mark - CategoryModelDelegate

- (void)categoryModel:(CategoryModel *)categoryModel dataOfCategoryDidLoad:(NSMutableDictionary *)categoryData
{
    self.data = [categoryData objectForKey:@"CategoryDetail"];    
    [self layoutViews];
}

#pragma mark - CategoryDetailDelegate

- (void)didSelectedCategoryDetailCell:(CategoryDetailViewCell *)cell
{
    CategoryProductListController *listController = [[CategoryProductListController alloc] initWithCategoryId:cell.categoryId];
    
    [self.navigationController pushViewController:listController animated:YES];
}

@end

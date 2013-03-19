//
//  CategoryViewController.m
//  WS03
//
//  Created by andy li on 13-3-7.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import "CategoryViewController.h"
#import "CategoryDetailViewController.h"
#import "LoadingActivityView.h"

@interface CategoryViewController()
{
    CategoryModel *_categoryModel;
    LoadingActivityView *_loadingView;
    CategoryTableView *_categoryTableView;
}
@end

@implementation CategoryViewController

@synthesize data;

- (id)init
{
    self = [super init];
    if (self) {
        self.navigationItem.title = @"分类";
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:@"分类" image:[UIImage imageNamed:@"tabBarCategory.png"] tag:0];
        self.tabBarItem = tabBarItem;                
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Method

- (void)loadView
{
    [super loadView];
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    self.view = [[UIView alloc] initWithFrame: rect];
    
    if (!_loadingView) {
        _loadingView = [[LoadingActivityView alloc] initWithFrame:self.view.frame];
    }
    
    [_loadingView start];
    [self.view addSubview:_loadingView];
    
    [self performSelectorInBackground:@selector(loadCategoryData) withObject:nil];
}

- (void)layoutViews
{
    if (_categoryTableView == nil) {
        _categoryTableView = [[CategoryTableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _categoryTableView.categoryTableViewDelegate = self;
    }
    
    _categoryTableView.categoryData = self.data;
    [_categoryTableView reloadData];
    
    [_loadingView stop];
    [self.view addSubview:_categoryTableView];    
}

- (void)loadCategoryData
{
    [NSThread sleepForTimeInterval:1];
    
    if (_categoryModel == nil) {
        _categoryModel = [[CategoryModel alloc] init];
        _categoryModel.categoryModelDelegate = self;
    }
    
    [_categoryModel getRootCategories];
}

#pragma mark - CategoryTableViewDelegate

- (void)didSelectedTableCell:(CategoryTableViewCell *)cell
{
    CategoryDetailViewController *detailViewController = [[CategoryDetailViewController alloc] initWithCategoryId:cell.categoryId];
    
    [self.navigationController pushViewController:detailViewController animated:YES];
}

#pragma mark - CategoryModelDelegate

- (void)categoryModel:(CategoryModel *)categoryModel dataOfCategoryDidLoad:(NSMutableDictionary *)categoryData
{
    self.data = [categoryData objectForKey:@"Categories"];
    [self layoutViews];
}

@end

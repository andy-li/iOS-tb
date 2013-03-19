//
//  SettingViewController.m
//  WS03
//
//  Created by andy li on 13-3-7.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import "SettingViewController.h"

@implementation SettingViewController

@synthesize tableView;

- (id)init
{
    self = [super init];
    if (self) {
        self.navigationItem.title = @"设置";
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:@"设置" image:[UIImage imageNamed:@"tabBarSetting.png"] tag:0];
        self.tabBarItem = tabBarItem;
    }
    return self;
}

- (void)loadView
{
    [super loadView];

    CGRect rect = [[UIScreen mainScreen] bounds];
    self.view = [[UIView alloc] initWithFrame: rect];
    
    if (!self.tableView) {
        self.tableView = [[SettingTableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        self.tableView.settingTableDelegate = self;
    }
    
    [self.view addSubview:self.tableView];
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


#pragma mark - SettingTableDelegate

- (void)didSelectedTableCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Selected Table View Cell");
}

@end

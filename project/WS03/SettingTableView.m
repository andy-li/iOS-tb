//
//  SettingTableView.m
//  WS03
//
//  Created by andy li on 13-3-14.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import "SettingTableView.h"

@interface SettingTableView()

@end

@implementation SettingTableView

@synthesize data;
@synthesize settingTableDelegate;

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    
    if (self) {
        //
        self.delegate = self;
        self.dataSource = self;
        
        UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height)];
        backgroundView.backgroundColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
        
        [self setBackgroundView: backgroundView];
        
        [self initData];
    }
    
    return self;
}


#pragma mark - Private Method

- (void)initData
{
    if (!self.data) {
        self.data = [[NSMutableArray alloc] init];
    }
    
    [self.data addObject:[NSArray arrayWithObjects:@"登录",@"注册", nil]];
    [self.data addObject:[NSArray arrayWithObjects:@"亲，给个好评吧～",@"说说你的建议",@"手机必备应用", nil]];
    [self.data addObject:[NSArray arrayWithObjects:@"新版检测",@"清除缓存", nil]];
    
//    NSLog(@"%@", self.data);
}

#pragma mark - TableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.data count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.data objectAtIndex:section] count];
}

// 行高
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 40.0;
//}

// 绘制行
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }

    cell.textLabel.text = [NSString stringWithFormat:@"%@", [[self.data objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
    
    cell.textLabel.font = [UIFont fontWithName:@"Arial" size:14.0];
    cell.textLabel.textColor = [UIColor blackColor];
    
    if (indexPath.section != 2) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
}

#pragma mark - TableViewDelegate

// 选中行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self deselectRowAtIndexPath:indexPath animated:YES];
    
    if (self.settingTableDelegate) {
        if ([self.settingTableDelegate conformsToProtocol:@protocol(SettingTableDelegate)] &&
            [self.settingTableDelegate respondsToSelector:@selector(didSelectedTableCell:indexPath:)]) {
            
            UITableViewCell *cell = (UITableViewCell *)[self cellForRowAtIndexPath:indexPath];
            [self.settingTableDelegate didSelectedTableCell:cell indexPath:indexPath];
        }
    }
}


// 滑动是否显示删除
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

@end

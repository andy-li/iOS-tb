//
//  CategoryTableView.m
//  WS03
//
//  Created by andy li on 13-3-13.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import "CategoryTableView.h"

@interface CategoryTableView()
@end

@implementation CategoryTableView

@synthesize categoryData;
@synthesize categoryTableViewDelegate;

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.categoryData = [[NSMutableArray alloc] init];
        self.delegate = self;
        self.dataSource = self;
        [self setSeparatorColor:[UIColor colorWithRed:220.0/255.0 green:220.0/255.0 blue:220.0/255.0 alpha:1.0]];
        [self setBackgroundColor:[UIColor whiteColor]];
        
        self.scrollEnabled = NO;
        
        self.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 30.0)];
        
        UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height)];
        backgroundView.backgroundColor = [UIColor whiteColor];
        
        [self setBackgroundView: backgroundView];
    }
    
    return self;
}

#pragma mark - TableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.categoryData count];
}

// 行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}

// 绘制行
- (CategoryTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"tableIdentifier";
    
    CategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[CategoryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    NSDictionary *dict = [self.categoryData objectAtIndex:indexPath.row];
    
    cell.categoryId = [[dict objectForKey:@"CategoryId"] stringValue];
    cell.titleLabel.text = [NSString stringWithFormat:@"%@", [dict objectForKey:@"CategoryName"]];
    cell.descriptionLabel.text = [NSString stringWithFormat:@"%@", [dict objectForKey:@"CategoryDescription"]];
    cell.imageView.image = [UIImage imageWithData:
                            [NSData dataWithContentsOfURL:
                             [NSURL URLWithString:[NSString stringWithFormat:@"%@", [dict objectForKey:@"CategoryImage"]]]]];
    
    // 箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark - TableViewDelegate

// 选中行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self deselectRowAtIndexPath:indexPath animated:YES];
    
    if (self.categoryTableViewDelegate) {
        if ([self.categoryTableViewDelegate conformsToProtocol:@protocol(CategoryTableViewDelegate)] &&
            [self.categoryTableViewDelegate respondsToSelector:@selector(didSelectedTableCell:)]) {
            
            CategoryTableViewCell *cell = (CategoryTableViewCell *)[self cellForRowAtIndexPath:indexPath];
            [self.categoryTableViewDelegate didSelectedTableCell:cell];
        }
    }
}

// 显示行
- (void)tableView:(UITableView *)tableView willDisplayCell:(CategoryTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize cellSize = CGSizeMake(self.frame.size.width, 65.0);
    CGSize imageSize = CGSizeMake(45.0, 45.0);
    
    float offsetX = 15.0, offsetY = 5.0;
    float labelWidth = cellSize.width - imageSize.width - offsetX*2 - 40.0;
    float titleLabelHeight = 30.0;
    
    [cell.imageView setFrame:CGRectMake(offsetX, (cellSize.height - imageSize.height)/2, imageSize.width, imageSize.height)];

    [cell.titleLabel setFrame:CGRectMake(imageSize.width + offsetX*2, offsetY, labelWidth, titleLabelHeight)];
    [cell.descriptionLabel setFrame:CGRectMake(imageSize.width + offsetX*2, titleLabelHeight, labelWidth, cellSize.height - titleLabelHeight - offsetY*2)];
    
    [cell layoutViews];    
}

// 滑动是否显示删除
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}
@end

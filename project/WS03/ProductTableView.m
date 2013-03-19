//
//  ProductTableView.m
//  WS03
//
//  Created by andy li on 13-3-8.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import "ProductTableView.h"


#define kTableViewContentOffsetX (10.0f) //
#define kTableViewContentOffsetY (5.0f)
#define kTableViewCellViewWidth (self.frame.size.width - (kTableViewContentOffsetX*2))
#define kTableViewCellOffsetX (10.0f)
#define kTableViewCellOffsetY (10.0f)
#define kTableViewCellViewContentWidth (kTableViewCellViewWidth - (kTableViewCellOffsetX*2))

@interface ProductTableView()

@end

@implementation ProductTableView

@synthesize productData;
@synthesize productTableViewDelegate;

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {        
        self.productData = [[NSMutableArray alloc] init];
        self.delegate = self;
        self.dataSource = self;
//        self.pagingEnabled = YES;
        [self setSeparatorColor:[UIColor clearColor]];
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
    return [self.productData count];
}

// 行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    float height = 0.0;
    
    height += (kTableViewContentOffsetY * 2);
    
    height += (kTableViewCellOffsetY * 3);
    
    UIImage *image = [UIImage imageWithData:
                      [NSData dataWithContentsOfURL:
                       [NSURL URLWithString:[[self.productData objectAtIndex:indexPath.row] objectForKey:@"ProductImage"]]]];
    height += image.size.height;
    
    height += 30.0; // name label
    
    return height;
    
}

// 行缩进
- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0;
}

// 绘制行
- (ProductTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"tableIdentifier";
    
    ProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[ProductTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    UIImage *image = [UIImage imageWithData:
                      [NSData dataWithContentsOfURL:
                       [NSURL URLWithString:[[self.productData objectAtIndex:indexPath.row] objectForKey:@"ProductImage"]]]];
    cell.imageView.image = image;
    
    cell.nameLabel.text = [[self.productData objectAtIndex:indexPath.row] objectForKey:@"ProdcutName"];
    
    cell.priceLabel.text = [NSString stringWithFormat:@"￥%@",[[[self.productData objectAtIndex:indexPath.row] objectForKey:@"ProductPrice"] stringValue]];
    
    cell.productId = [[[self.productData objectAtIndex:indexPath.row] objectForKey:@"ProductId"] stringValue];
    
    return cell;
}

#pragma mark - TableViewDelegate

// 选中行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self deselectRowAtIndexPath:indexPath animated:YES];
    
    if (self.productTableViewDelegate) {
        if ([self.productTableViewDelegate conformsToProtocol:@protocol(ProductTableViewDelegate)] &&
            [self.productTableViewDelegate respondsToSelector:@selector(didSelectedTableCell:)]) {
            
            ProductTableViewCell *cell = (ProductTableViewCell *)[self cellForRowAtIndexPath:indexPath];
            [self.productTableViewDelegate didSelectedTableCell:cell];
        }
    }
}

// 显示行
- (void)tableView:(UITableView *)tableView willDisplayCell:(ProductTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    float imageHeight = cell.imageView.image.size.height;
    float viewHeight = imageHeight;
    [cell.imageView setFrame:CGRectMake(kTableViewCellOffsetX, kTableViewCellOffsetY, kTableViewCellViewContentWidth, imageHeight)];
    
    float nameLabelHeight = 30.0f;
    float priceLableWidth = 50.0, priceLableHeight = 30.0;
    viewHeight += kTableViewCellOffsetY;    
    [cell.nameLabel setFrame:CGRectMake(kTableViewCellOffsetX, viewHeight, kTableViewCellViewContentWidth-priceLableWidth, nameLabelHeight)];
    [cell.priceLabel setFrame:CGRectMake(kTableViewCellViewContentWidth - priceLableWidth + kTableViewCellOffsetX, viewHeight,
                                         priceLableWidth, priceLableHeight)];
    
    viewHeight += (nameLabelHeight + kTableViewCellOffsetY);
    [cell.view setFrame:CGRectMake(kTableViewContentOffsetX, kTableViewContentOffsetY, kTableViewCellViewWidth, viewHeight)];
    
    [cell layoutViews];
}

// 滑动是否显示删除
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}
@end

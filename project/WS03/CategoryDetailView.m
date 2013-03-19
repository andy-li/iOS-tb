//
//  CategoryDetailView.m
//  WS03
//
//  Created by andy li on 13-3-15.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import "CategoryDetailView.h"

#define kCategoryDetailCellNumbers (3)

#define kCategoryDetailCellOffsetX (10)
#define kCategoryDetailCellOffsetY (10)
#define kCategoryDetailCellSize (CGSizeMake(90.0, 90.0))
#define kCategoryDetailCellSpace ((self.frame.size.width - kCategoryDetailCellNumbers * kCategoryDetailCellSize.width -  kCategoryDetailCellOffsetX * 2) / 2)

@interface CategoryDetailView()
{

}
@end

@implementation CategoryDetailView

@synthesize detailData;
@synthesize categoryDetailDelegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        //
    }

    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSArray *categories = [self.detailData objectForKey:@"SubCategories"];
    
    if (!categories || [categories count] == 0) {
        return;
    }
    
    int offsetX=0;
    int offsetY=0;
    
    int row, col;
    for (int i=0; i<[categories count]; i++) {
        
        NSDictionary *dict = [categories objectAtIndex:i];
        
        if (i == 0) {
            row = 0;
            col = 0;
        } else if (i % kCategoryDetailCellNumbers == 0) {
            row+=1;
            col = 0;
        } else {
            col += 1;
        }
        
        offsetX = kCategoryDetailCellOffsetX + col * (kCategoryDetailCellSize.width + kCategoryDetailCellSpace);
        offsetY = kCategoryDetailCellOffsetY + row * (kCategoryDetailCellSize.height + kCategoryDetailCellSpace);
        
        CGRect rect = CGRectMake(offsetX, offsetY, kCategoryDetailCellSize.width, kCategoryDetailCellSize.height);
        
        CategoryDetailViewCell *cell = [[CategoryDetailViewCell alloc] initWithFrame:rect categoryId:[dict objectForKey:@"CategoryId"]];
        cell.delegate = self;
        
        cell.nameLabel.text = [dict objectForKey:@"CategoryName"];
        cell.imageView.image = [UIImage imageWithData:
                                [NSData dataWithContentsOfURL:
                                 [NSURL URLWithString:[NSString stringWithFormat:@"%@", [dict objectForKey:@"CategoryImage"]]]]];
        
        [cell layoutIfNeeded];
        [self addSubview:cell];
        
    }
    
}

#pragma mark - Private Method



#pragma mark - CategoryDetailCellDetegate

- (void)didSelectDetailCell:(CategoryDetailViewCell *)cell
{
    if (self.categoryDetailDelegate) {
        if ([self.categoryDetailDelegate conformsToProtocol:@protocol(CategoryDetailDelegate)] &&
            [self.categoryDetailDelegate respondsToSelector:@selector(didSelectedCategoryDetailCell:)]) {
            [self.categoryDetailDelegate didSelectedCategoryDetailCell:cell];
        }
    }
}

@end

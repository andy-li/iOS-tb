//
//  CategoryModel.h
//  WS03
//
//  Created by andy li on 13-3-13.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import "BaseModel.h"

@protocol CategoryModelDelegate;

@interface CategoryModel : BaseModel

@property (nonatomic, retain) id<CategoryModelDelegate> categoryModelDelegate;

- (void)getRootCategories; // 根分类
- (void)getCategoriesByRootCategoryId:(NSString *) categoryId;
@end


@protocol CategoryModelDelegate <NSObject>

- (void)categoryModel:(CategoryModel *)categoryModel dataOfCategoryDidLoad:(NSMutableDictionary *)categoryData;

@end
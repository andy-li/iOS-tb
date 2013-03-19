//
//  CategoryDetailViewController.h
//  WS03
//
//  Created by andy li on 13-3-15.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import "BaseViewController.h"
#import "CategoryModel.h"
#import "CategoryDetailView.h"

@interface CategoryDetailViewController : BaseViewController <CategoryModelDelegate, CategoryDetailDelegate>

@property (nonatomic, retain) CategoryModel *categoryModel;
@property (nonatomic, retain) NSMutableDictionary *data;

- (id)initWithCategoryId:(NSString *)categoryId;

@end

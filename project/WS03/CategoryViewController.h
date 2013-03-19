//
//  CategoryViewController.h
//  WS03
//
//  Created by andy li on 13-3-7.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import "BaseViewController.h"
#import "CategoryModel.h"
#import "CategoryTableView.h"

@interface CategoryViewController : BaseViewController <CategoryModelDelegate,CategoryTableViewDelegate>

@property (nonatomic, retain) NSMutableArray *data;

@end

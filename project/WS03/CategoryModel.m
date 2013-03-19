//
//  CategoryModel.m
//  WS03
//
//  Created by andy li on 13-3-13.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import "CategoryModel.h"

#define kCategoryListJSONData (@"http://127.0.0.1/com.ios/api/ws02/categoryListJSONData.php")
#define kCategoryDetailJSONData (@"http://127.0.0.1/com.ios/api/ws02/categoryDetailJSONData.php?categoryId=")


@implementation CategoryModel

@synthesize categoryModelDelegate;

- (id)init
{
    self = [super init];
    
    if (self) {
        //
        self.categoryModelDelegate = nil;
    }
    
    return self;
}

- (void)getRootCategories
{
    NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@", kCategoryListJSONData]];
    
    [self createRequestByURL:url];
}

- (void)getCategoriesByRootCategoryId:(NSString *) categoryId
{
    NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@", kCategoryDetailJSONData, categoryId]];
    
    [self createRequestByURL:url];
}

- (void)loadDataFinish
{
    [super loadDataFinish];
    
    if (self.categoryModelDelegate != nil) {
        if ([self.categoryModelDelegate conformsToProtocol:@protocol(CategoryModelDelegate)]) {
            if ([self.categoryModelDelegate respondsToSelector:@selector(categoryModel:dataOfCategoryDidLoad:)]) {
                [self.categoryModelDelegate categoryModel:self dataOfCategoryDidLoad:self.results];
            }
        }
    }
}

@end

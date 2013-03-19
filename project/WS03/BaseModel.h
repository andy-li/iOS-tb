//
//  BaseModel.h
//  WS03
//
//  Created by andy li on 13-3-13.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject <NSURLConnectionDelegate>

@property (nonatomic, retain) NSMutableDictionary *results; // 解析后数据
@property (nonatomic, retain) NSMutableData *resultData; // 远程数据

- (void)createRequestByURL:(NSURL *)url;
- (void)loadDone;
- (void)loadDataFinish;

@end

//
//  BaseModel.m
//  WS03
//
//  Created by andy li on 13-3-13.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import "BaseModel.h"

#define kRequestTimeoutInterval (30)

@interface BaseModel()
{
    BOOL _finished;
}
@end

@implementation BaseModel

@synthesize resultData;
@synthesize results = _results;

- (void)createRequestByURL:(NSURL *)url
{
    if (_results == nil)
        _results = [[NSMutableDictionary alloc] init];
    
    // 清空数据
    //    [_results removeAllObjects];
    
    // 初始化数据
    [self.resultData setLength:0];
    
    // 创建 NSRURLRequest 设置缓存时间
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url cachePolicy:
                             NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:kRequestTimeoutInterval];
    
    // 参数 cachePolicy表示缓存策略 枚举类型 如下
    //
    //    enum {
    //        NSURLRequestUseProtocolCachePolicy = 0, // NSURLRequest默认的cache policy 使用Protocol协议定义 是最能保持一致性的协议
    //        NSURLRequestReloadIgnoringCacheData = 1, // 忽略缓存直接从原始地址下载
    //        NSURLRequestReturnCacheDataElseLoad = 2, // 只有在cache中不存在data时才从原始地址下载
    //        NSURLRequestReturnCacheDataDontLoad = 3, // 只使用cache数据 如果不存在cache 请求失败 用于没有建立网络连接模式
    //        NSURLRequestReloadIgnoringLocalAndRemoteCacheData = 4, // 忽略本地和远程的缓存数据 直接从原始地址下载 与NSURLRequestReloadIgnoringCacheData类似
    //        NSURLRequestReloadRevalidatingCacheData = 5 // 验证本地数据与远程数据是否相同 如果不同则下载远程数据 否则使用本地数据
    //    };
    //    typedef NSUInteger NSURLRequestCachePolicy;
    
    // 创建连接 该消息一发送下载就会立即开始
    // 在代理收到connectionDidFinishLoading:或者didFailWithError:消息之前 可以通过给连接发送一个cancel:消息来中断
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if (connection) {
        if (!self.resultData) {
            self.resultData = [NSMutableData data];
        }
        
        while (!_finished) {
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        }
        
    } else {
        NSLog(@"Connection Failed.");
    }
    
}

- (void)loadDone
{
    NSError *error;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:self.resultData options:NSJSONReadingMutableContainers error:&error];
    
    // 参数说明
    //    enum {
    //        NSJSONReadingMutableContainers = (1UL << 0), // 返回的容器是可变类型的 (Array和Dictionary)
    //        NSJSONReadingMutableLeaves = (1UL << 1), // 返回的NSString是可变类型的
    //        NSJSONReadingAllowFragments = (1UL << 2) // 允许顶层的界面不是NSArray或NSDictionary
    //    };
    //    typedef NSUInteger NSJSONReadingOptions;
    
    _results = [dict objectForKey:@"results"];
    [self loadDataFinish];
}

- (void)loadDataFinish
{

}

#pragma mark - NSURLRequestDelegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [self.resultData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.resultData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    _finished = YES;
    [self loadDone];
}

// 当代理接受到连接的connection: didFailWithError消息后 该连接不再接受任何消息
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Connection failed! Error - %@ %@", [error localizedDescription], [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
}

@end

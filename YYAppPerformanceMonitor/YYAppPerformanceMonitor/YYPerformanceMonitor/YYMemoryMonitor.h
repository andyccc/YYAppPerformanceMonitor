//
//  YYMemoryMonitor.h
//  YYAppPerformanceMonitor
//
//  Created by yans on 2018/7/3.
//

#import <Foundation/Foundation.h>

@interface YYMemoryMonitor : NSObject

@property (nonatomic, copy) void(^display)(NSString *text);

+ (YYMemoryMonitor *)sharedMonitor;
- (void)startMonitor;
- (void)stopMonitor;

@end

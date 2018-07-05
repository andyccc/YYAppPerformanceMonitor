//
//  YYCPUMonitor.h
//  YYAppPerformanceMonitor
//
//  Created by yans on 2018/7/3.
//

#import <Foundation/Foundation.h>

@interface YYCPUMonitor : NSObject

@property (nonatomic, copy) void(^display)(NSString *text);

+ (YYCPUMonitor *)sharedMonitor;

- (void)startMonitor;
- (void)stopMonitor;

@end

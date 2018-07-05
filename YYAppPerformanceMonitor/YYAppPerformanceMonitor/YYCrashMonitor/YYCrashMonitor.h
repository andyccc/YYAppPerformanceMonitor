//
//  YYCrashMonitor.h
//  YYAppPerformanceMonitor
//
//  Created by yans on 2018/7/3.
//

#import <Foundation/Foundation.h>

@interface YYCrashMonitor : NSObject

+ (YYCrashMonitor *)sharedMonitor;
- (void)startMonitor;

@end

//
//  YYFPSMonitor.h
//  YYAppPerformanceMonitor
//
//  Created by yans on 2018/7/3.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface YYFPSMonitor : NSObject
@property (nonatomic, strong) CADisplayLink *link;

@property (nonatomic, copy) void(^display)(NSString *text);

+ (YYFPSMonitor *)sharedMonitor;
- (void)startMonitor;
- (void)stopMonitor;

@end

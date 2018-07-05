//
//  YYException.h
//  YYAppPerformanceMonitor
//
//  Created by yans on 2018/7/3.
//

#import <Foundation/Foundation.h>
#import "YYAppInfo.h"

@interface YYException : YYAppInfo

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * reason;
@property (nonatomic, copy) NSString * callStack;
@property (nonatomic, copy) NSString * time;

@end

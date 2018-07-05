//
//  YYAppInfo.h
//  YYAppPerformanceMonitor
//
//  Created by yans on 2018/7/3.
//

#import <Foundation/Foundation.h>

@interface YYAppInfo : NSObject

@property (nonatomic, copy) NSString *appVersion;
@property (nonatomic, copy) NSString *device;
@property (nonatomic, copy) NSString *system;

@property (nonatomic, copy) NSString *appInfo;

+ (NSString *)appInfo;

@end

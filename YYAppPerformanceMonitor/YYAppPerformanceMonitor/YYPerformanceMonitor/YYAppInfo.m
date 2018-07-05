//
//  YYAppInfo.m
//  YYAppPerformanceMonitor
//
//  Created by yans on 2018/7/3.
//

#import "YYAppInfo.h"
#import <UIKit/UIKit.h>

static NSString *const kAppVersionKey = @"CFBundleShortVersionString";
static NSString *const kAppInfoFmt    = @"Device: %@\nVersion: %@\nSystem: %@";

@implementation YYAppInfo

+ (NSString *)appInfo {
    NSDictionary * infoDict = [[NSBundle mainBundle] infoDictionary];
    return [NSString stringWithFormat:kAppInfoFmt, [UIDevice currentDevice].model, infoDict[kAppVersionKey], [[UIDevice currentDevice].systemName stringByAppendingString: [UIDevice currentDevice].systemVersion]];
}

- (NSString *)device {
    _device = [UIDevice currentDevice].model;
    return _device;
}

- (NSString *)appVersion {
    NSDictionary * infoDict = [[NSBundle mainBundle] infoDictionary];
    _appVersion = infoDict[kAppVersionKey];
    return _appVersion;
}

- (NSString *)system {
    _system = [[UIDevice currentDevice].systemName stringByAppendingString: [UIDevice currentDevice].systemVersion];
    return _system;
}

@end

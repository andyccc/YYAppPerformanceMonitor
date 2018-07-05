//
//  YYPerformanceModel.h
//  YYAppPerformanceMonitor
//
//  Created by yans on 2018/7/3.
//

#import <Foundation/Foundation.h>
#import "YYAppInfo.h"

typedef NS_ENUM(NSUInteger, YYPerformanceType) {
    YYPerformanceTypeFPS,
    YYPerformanceTypeCPU,
    YYPerformanceTypeMemory
};

@interface YYPerformanceModel : YYAppInfo
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, assign) YYPerformanceType type;
@property (nonatomic, assign) NSInteger value;
@end

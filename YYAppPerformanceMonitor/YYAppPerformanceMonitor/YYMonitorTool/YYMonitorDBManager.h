//
//  YYMonitorDBManager.h
//  YYAppPerformanceMonitor
//
//  Created by yans on 2018/7/3.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, YYAppMonitorDBType) {
    YYAppMonitorDBTypeFPS,
    YYAppMonitorDBTypeCPU,
    YYAppMonitorDBTypeMemory,
    YYAppMonitorDBTypeException
};

/***********
 * 数据库的设计需求是一段时间获取所有本地异常信息上传到服务器统计，然后删除本地数据，
 * 防止数据增长导致磁盘内存不可控，因此仅支持查找和删除一张表内所有数据
 **********/

@interface YYMonitorDBManager : NSObject

+ (instancetype)sharedManager;

- (void)creatTableWithType:(YYAppMonitorDBType)type;
- (void)insertWithType:(YYAppMonitorDBType)type obj:(__kindof id)obj;
- (void)deleteAllRecordWithType:(YYAppMonitorDBType)type;
- (NSArray <__kindof id> *)selectAllRecordWithType:(YYAppMonitorDBType)type;

@end

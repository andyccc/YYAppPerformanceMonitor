//
//  YYException
//  YYAppPerformanceMonitor
//
//  Created by yans on 2018/7/3.
//

#import "YYException.h"

@implementation YYException

- (NSString *)description {
    return [NSString stringWithFormat: @"Error: %@\nReson: %@\n%@\nCrash time: %@\n\nCall Stack: \n%@", self.name, self.reason, self.appInfo, self.time, self.callStack];
}

@end

//
//  YYWeakTarget.m
//  YYAppPerformanceMonitor
//
//  Created by yans on 2018/7/3.
//

#import "YYWeakTarget.h"

@implementation YYWeakTarget

- (instancetype)initWithTarget:(id)target selector:(SEL)selector {
    
    self.weakTarget = target;
    self.seletor = selector;
    return self;
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
- (void)timerFire:(id)sender {
    if (self.weakTarget) {
        [self.weakTarget performSelector:self.seletor withObject:sender];
    } else {
        [sender invalidate];
    }
}
#pragma clang diagnostic pop

@end

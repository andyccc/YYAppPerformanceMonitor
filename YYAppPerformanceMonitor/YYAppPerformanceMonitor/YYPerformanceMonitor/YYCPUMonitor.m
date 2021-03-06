//
//  YYCPUMonitor.m
//  YYAppPerformanceMonitor
//
//  Created by yans on 2018/7/3.
//

#import "YYCPUMonitor.h"
#import "YYWeakTarget.h"

#include <mach/thread_info.h>
#include <mach/mach_types.h>
#include <mach/task.h>
#include <mach/mach_init.h>
#include <mach/thread_act.h>
#include <mach/vm_map.h>
#import "YYPerformanceModel.h"
#import "YYMonitorDBManager.h"

@interface YYCPUMonitor()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) BOOL isMonitoring;

@end

@implementation YYCPUMonitor

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"

static dispatch_queue_t sharedQueue() {
    static dispatch_queue_t queue = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        queue = dispatch_queue_create("com.andyccc.monitor.cpuQueue", DISPATCH_QUEUE_SERIAL);
    });
    return queue;
}

+ (YYCPUMonitor *)sharedMonitor {
    static YYCPUMonitor *sharedMonitor = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMonitor = [[[self class] alloc] init];
    });
    return sharedMonitor;
}

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)startMonitor {
    if (!self.isMonitoring) {
        dispatch_async(sharedQueue(), ^{
            NSLog(@"%@",[NSThread currentThread].name);
            self.isMonitoring = YES;
            YYWeakTarget *t = [[YYWeakTarget alloc] initWithTarget:self selector:@selector(tick:)];
            self.timer = [NSTimer scheduledTimerWithTimeInterval:.5f target:t selector:@selector(timerFire:) userInfo:nil repeats:YES];
            [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
            [[NSRunLoop currentRunLoop] run];
        });
    }
}

- (void)stopMonitor {
    NSLog(@"stopped");
    self.isMonitoring = NO;
    [self.timer invalidate];
}

- (void)tick:(NSTimer *)sender {
    int cpu = (int)round(cpu_usage());
//    NSLog(@"CPU Usage: %d", (int)round(cpuUsage()));
//        if (cpu > 80) {
    YYPerformanceModel *model = [YYPerformanceModel new];
    model.value = cpu;
    [[YYMonitorDBManager sharedManager] insertWithType:YYAppMonitorDBTypeCPU obj:model];
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.display) {
            self.display([NSString stringWithFormat:@"CPU:%d", cpu]);
        }
    });
//        }
}

float cpu_usage() {
    double usage_ratio = 0;
    thread_info_data_t thinfo;
    thread_act_array_t threads;
    // ???????????????????????????????????????????????????????????????????????????????????????CPU ????????????????????????
    thread_basic_info_t basic_info_t;
    mach_msg_type_number_t count = 0;
    mach_msg_type_number_t thread_info_count = THREAD_INFO_MAX;
    
    if (task_threads(mach_task_self(), &threads, &count) == KERN_SUCCESS) {
        for (int idx = 0; idx < count; idx++) {
            if (thread_info(threads[idx], THREAD_BASIC_INFO, (thread_info_t)thinfo, &thread_info_count) == KERN_SUCCESS) {
                basic_info_t = (thread_basic_info_t)thinfo;
                if (!(basic_info_t->flags & TH_FLAGS_IDLE)) {
                    usage_ratio += basic_info_t->cpu_usage / (double)TH_USAGE_SCALE;
                }
            }
        }
        assert(vm_deallocate(mach_task_self(), (vm_address_t)threads, count * sizeof(thread_t)) == KERN_SUCCESS);
    }
    return usage_ratio * 100.;
}

#pragma clang diagnostic pop

@end

//
//  YYWeakTarget.h
//  YYAppPerformanceMonitor
//
//  Created by yans on 2018/7/3.
//

#import <Foundation/Foundation.h>

// 解决 NSTimer、CADisplayLink 的循环引用问题
@interface YYWeakTarget : NSProxy

/*********
 * NSTimer target
 * XXObject -> Timer -> weakTarget ···> XXObject
 * -> 强引用; ···> 弱引用
 *********/
@property (nonatomic, weak) id weakTarget;
// NSTimer 处理消息
@property (nonatomic, assign) SEL seletor;

- (instancetype)initWithTarget:(id)target selector:(SEL)selector;

@end

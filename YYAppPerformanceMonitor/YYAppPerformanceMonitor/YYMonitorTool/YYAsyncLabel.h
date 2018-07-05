//
//  YYAsyncLabel.h
//  YYAppPerformanceMonitor
//
//  Created by yans on 2018/7/3.
//

#import <UIKit/UIKit.h>

@interface YYAsyncLabel : UILabel

+ (instancetype)showInView:(UIView *)view frame:(CGRect)frame;
+ (instancetype)showInWindowWithframe:(CGRect)frame;

@end

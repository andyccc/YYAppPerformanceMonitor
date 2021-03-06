# YYAppPerformanceMonitor

### 关于本项目

一个采用后台线程的 app 性能检测工具，检测 APP CPU、内存、FPS、异常等性能信息。

所有信息的收集和计算都由子线程完成，不会影响 APP 性能和阻塞主线程。

本地信息仅供调试使用，建议有统计需求的，将收集的信息上送到服务器统计。

NOTE：本项目所有的 c 函数，c 变量采用下划线分割的命名规则，OC 变量和函数采用驼峰命名规则。

### 用法

```objc
#import "YYCrashMonitor.h"
#import "YYCPUMonitor.h"
#import "YYMemoryMonitor.h"
#import "YYFPSMonitor.h"

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[YYCrashMonitor sharedMonitor] startMonitor];
    
    [[YYFPSMonitor sharedMonitor] startMonitor];
    [[YYCPUMonitor sharedMonitor] startMonitor];
    [[YYMemoryMonitor sharedMonitor] startMonitor];
    
    return YES;
}
```

采用异步绘制的方式将监控到的数据实时显示：

```objc
YYAsyncLabel *fpsLab = [YYAsyncLabel showInWindowWithframe:CGRectMake(30, 50, 100, 30)];
[YYFPSMonitor sharedMonitor].display = ^(NSString *text) {
    // 子线程完成绘制，不会阻塞主线程
    fpsLab.text = text;
};
```

效果：



![](https://github.com/andyccc/YYAppPerformanceMonitor/blob/master/display_demo/foo.gif?raw=true)

//
//  AppDelegate.m
//  YYAppPerformanceMonitor
//
//  Created by yans on 2018/7/5.
//

#import "AppDelegate.h"
#import "YYCPUMonitor.h"
#import "YYFPSMonitor.h"
#import "YYMemoryMonitor.h"
#import "YYCrashMonitor.h"
#import "YYAsyncLabel.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    [[YYFPSMonitor sharedMonitor] startMonitor];
//    [[YYCPUMonitor sharedMonitor] startMonitor];
//    [[YYMemoryMonitor sharedMonitor] startMonitor];
//    [[YYCrashMonitor sharedMonitor] startMonitor];
    
    self.window  = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    ViewController *v = [ViewController new];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:v];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    YYAsyncLabel *fpsLab = [YYAsyncLabel showInWindowWithframe:CGRectMake(30, 50, 100, 30)];
    YYAsyncLabel *cpuLab = [YYAsyncLabel showInWindowWithframe:CGRectMake(130, 50, 100, 30)];
    YYAsyncLabel *memoryLab = [YYAsyncLabel showInWindowWithframe:CGRectMake(230, 50, 100, 30)];
    [[YYFPSMonitor sharedMonitor] startMonitor];
    [YYFPSMonitor sharedMonitor].display = ^(NSString *text) {
        fpsLab.text = text;
    };
    
    [[YYCPUMonitor sharedMonitor] startMonitor];
    [YYCPUMonitor sharedMonitor].display = ^(NSString *text) {
        cpuLab.text = text;
    };
    
    [[YYMemoryMonitor sharedMonitor] startMonitor];
    [YYMemoryMonitor sharedMonitor].display = ^(NSString *text) {
        memoryLab.text = text;
    };
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

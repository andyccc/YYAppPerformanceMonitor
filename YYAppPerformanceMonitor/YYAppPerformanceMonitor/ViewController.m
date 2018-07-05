//
//  ViewController.m
//  YYAppPerformanceMonitor
//
//  Created by yans on 2018/7/5.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "YYMonitorDBManager.h"

@interface ViewController ()
@property (nonatomic, strong) UIButton *push;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *b = [[UIButton alloc] initWithFrame:CGRectMake(200, 200, 50, 50)];
    [b setTitle:@"push" forState:UIControlStateNormal];
    [b setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [b addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b];
}

- (void)push:(id)sender {
    [self.navigationController pushViewController:[SecondViewController new] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

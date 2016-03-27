//
//  ViewController.m
//  Reachability
//
//  Created by 王龙 on 16/3/27.
//  Copyright © 2016年 Larry（Lawrence）. All rights reserved.
//

#import "ViewController.h"
//1.导入类名
#import "Reachability.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    //    2.创建对象
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    //    3.添加一个观察者 接收网络环境变化的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(change:) name:kReachabilityChangedNotification object:nil];
    //    4.还是监测
    [reachability startNotifier];

    
    
}

- (void)change:(NSNotification *)not{
    //    5.得到通知中Reachability的对象  用来获得网络状态
    Reachability *reach = not.object;
    NSString *statue;
    switch (reach.currentReachabilityStatus) {
        case NotReachable:
            statue = @"无网络";
            break;
        case ReachableViaWiFi:
            statue = @"WIFI网络";
            break;
        case ReachableViaWWAN:
            statue = @"蜂窝网络";
            break;
            
        default:
            break;
    }
    NSLog(@"%@",statue);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

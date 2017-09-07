//
//  ViewController.m
//  notification
//
//  Created by yangxutao on 17/4/27.
//  Copyright © 2017年 yangxutao. All rights reserved.
//

#import "ViewController.h"
#import <UserNotifications/UserNotifications.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //通过type来判断用户是不是打开了推送开关
    CGFloat version = [[UIDevice currentDevice].systemVersion floatValue];
    if (version >= 8) {
        UIUserNotificationType type = [UIApplication sharedApplication].currentUserNotificationSettings.types;
    } else {
         UIRemoteNotificationType type = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
    }
    
}
// 主动获取设备通知是否授权(iOS 10+)
- (void)getNotificationSettingStatus {
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
        if (settings.authorizationStatus == UNAuthorizationStatusAuthorized) {
            NSLog(@"User authed.");
        } else {
            NSLog(@"User denied.");
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

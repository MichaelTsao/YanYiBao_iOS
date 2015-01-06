//
//  AppDelegate.h
//  YanYiBao
//
//  Created by 郭 旭 on 14-8-1.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "ThirdViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate,MBProgressHUDDelegate>
{
    UITabBarController *tabViewController;
    MBProgressHUD *HUD;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabViewController;
@property (strong, nonatomic) ThirdViewController *myViewController;

-(void)hideLoading;
-(void)showLoading:(NSString *)info;

@end

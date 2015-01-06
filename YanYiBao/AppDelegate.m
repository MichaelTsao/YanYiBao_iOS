//
//  AppDelegate.m
//  YanYiBao
//
//  Created by 郭 旭 on 14-8-1.
//  Copyright (c) 2014年 郭 旭. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "ForthViewController.h"
#import "UIColor+Helper.h"
#import "UserInfoData.h"
#import "LoginViewController.h"

@implementation AppDelegate
@synthesize tabViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithHexString:@"#df4b48" withAlpha:1.0]];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlackTranslucent];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    tabViewController = [[UITabBarController alloc] init];
    [self.window setRootViewController:tabViewController];
    
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    homeNav.navigationBarHidden = YES;
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *user = [userDefaults valueForKey:@"user"];
    UIViewController *meController = nil;
    if (user == nil) {
        meController = [[LoginViewController alloc] init];
    }else{
        meController = [[ThirdViewController alloc] init];
    }
    
    UINavigationController *thirdNav = [[UINavigationController alloc] initWithRootViewController:meController];
    thirdNav.navigationBarHidden = YES;
    
    ForthViewController *forthVC = [[ForthViewController alloc] init];
    UINavigationController *forthNav = [[UINavigationController alloc] initWithRootViewController:forthVC];
    tabViewController.viewControllers = [NSArray arrayWithObjects:homeNav, thirdNav, forthNav ,nil];
    
    UITabBar *tabBar = tabViewController.tabBar;
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];
    
    tabBar.tintColor = [UIColor colorWithHexString:@"#df4b48" withAlpha:1.0];
    
    UIImage *itme1 = [UIImage imageNamed:@"repertoire"];
    UIImage *itme2 = [UIImage imageNamed:@"my"];
    UIImage *itme3 = [UIImage imageNamed:@"more"];
    
    tabBarItem1.title = @"剧目";
    tabBarItem2.title = @"我的";
    tabBarItem3.title = @"更多";
    
    tabBarItem1.image = itme1;
    tabBarItem2.image = itme2;
    tabBarItem3.image = itme3;
    
    return YES;
}

-(void)showLoading:(NSString *)info
{
    if (!info) {
        info = @"正在加载...";
    }
    if (!HUD) {
        HUD = [[MBProgressHUD alloc] initWithView:self.window];
        HUD.delegate = self;
    }
    [self.window addSubview:HUD];
    HUD.labelText = info;
    [HUD show:YES];
}

-(void)hideLoading
{
    if(HUD){
        [HUD hide:YES];
        [HUD removeFromSuperview];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

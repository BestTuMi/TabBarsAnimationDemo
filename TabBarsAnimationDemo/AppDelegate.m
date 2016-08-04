//
//  AppDelegate.m
//  TabBarsAnimationDemo
//
//  Created by ArJun on 16/8/5.
//  Copyright © 2016年 ArJun. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseTabBarViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    NSArray *images = @[@"tabbar_home",
                        @"tabbar_message_center",
                        @"tabbar_discover",
                        @"tabbar_home",
                        @"tabbar_profile"];
    NSArray *selectedImages = @[@"tabbar_home_selected",
                                @"tabbar_message_center_selected",
                                @"tabbar_discover_selected",
                                @"tabbar_home_selected",
                                @"tabbar_profile_selected"];

    AJTestOneViewController *one = [[AJTestOneViewController alloc]init];
    AJTestTwoViewController *two = [[AJTestTwoViewController alloc]init];
    AJTestFiveViewController *five = [[AJTestFiveViewController alloc]init];
    AJTestFourViewController *four = [[AJTestFourViewController alloc]init];
    AJTestThreeViewController *three = [[AJTestThreeViewController alloc]init];
    
    NSArray *vcs = @[one,two,five,four,three];
    BaseTabBarViewController *tabBarVC = [BaseTabBarViewController addChildVc:vcs titles:@[@"首页",@"消息",@"搜索",@"最近",@"个人"] images:images selectedImages:selectedImages tabBarNaviChildVC:[[UINavigationController alloc]init]];

    self.window.rootViewController = tabBarVC;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

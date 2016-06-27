//
//  AppDelegate.m
//  TabBarDemo
//
//  Created by sks on 16/6/27.
//  Copyright © 2016年 NJ. All rights reserved.
//

#import "AppDelegate.h"
#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //首页
    UIViewController *homeVC = [[UIViewController alloc] init];
    homeVC.title = @"首页";
    UINavigationController *homeNC = [[UINavigationController alloc] initWithRootViewController:homeVC];
    homeNC.title = @"首页";
    
    
    //发布
    UIViewController *publishVC = [[UIViewController alloc] init];
    UINavigationController *publishNC = [[UINavigationController alloc] initWithRootViewController:publishVC];
    publishNC.title = @"发布需求";
    
    //我的
    UIViewController *mineVC = [[UIViewController alloc] init];
    mineVC.title = @"我";
    UINavigationController *mineNC = [[UINavigationController alloc] initWithRootViewController:mineVC];
    mineNC.title = @"我";
    
    //创建TabBarController
    RDVTabBarController *rootTBC = [[RDVTabBarController alloc] init];
    
    //controllers
    rootTBC.viewControllers = @[homeNC,publishNC,mineNC];
    
    [[UIApplication sharedApplication] delegate].window.rootViewController = rootTBC;
    
    [self customizeTabBarForController:rootTBC];
    
    
    return YES;
}

- (void)customizeTabBarForController:(RDVTabBarController *)tabBarController {
    NSArray *tabBarItemImages = @[@"home",@"kong",@"mine"];
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[tabBarController tabBar] items]) {
        //        [item setBackgroundColor:RGBACOLOR(39, 145, 245, 1)];
        item.badgeTextColor = [UIColor redColor];
        item.badgeTextFont = [UIFont systemFontOfSize:4.0f];
        [item setBackgroundSelectedImage:[UIImage imageNamed:@"bar_background"] withUnselectedImage:[UIImage imageNamed:@"bar_background"]];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",
                                                      [tabBarItemImages objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@",
                                                        [tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        
        
        [item setSelectedTitleAttributes:@{NSForegroundColorAttributeName: RGBACOLOR(39, 145, 245, 1)}];
        [item setUnselectedTitleAttributes:@{NSForegroundColorAttributeName: RGBACOLOR(135, 135, 135, 1)}];
        
        index++;
    }
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

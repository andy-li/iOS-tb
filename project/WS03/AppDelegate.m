//
//  AppDelegate.m
//  WS03
//
//  Created by andy li on 13-3-7.
//  Copyright (c) 2013年 andy li<lidi8013@gmail.com>. All rights reserved.
//

#import "defines.h"

#import "TopIOSClient.h"
#import "TopAppConnector.h"

#import "AppDelegate.h"

#import "HomeViewController.h"
#import "CategoryViewController.h"
#import "LikeViewController.h"
#import "SettingViewController.h"

@implementation AppDelegate

@synthesize tabBarController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];            
        
    // TaobaoAuth
    TopIOSClient *topIOSClient = [TopIOSClient registerIOSClient:kTaobaoAppKey appSecret:kTaobaoAppSecret callbackUrl:@"appcallback://" needAutoRefreshToken:TRUE];
    [TopAppConnector registerAppConnector:kTaobaoAppKey topclient:topIOSClient];
    
    // Initialize
    [self performSelectorInBackground:@selector(initialize) withObject:nil];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    TopAppConnector *appConnector = [TopAppConnector getAppConnectorbyAppKey:kTaobaoAppKey];
    
    [appConnector receiveMessageFromApp:[url absoluteString]];
    
    return YES;
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

#pragma mark - Private Method

- (void)initialize
{    
    UIColor *titleBarColor = [UIColor blackColor];
    UIColor *tabBarSelectedColor = [UIColor colorWithRed:250.0/255.0 green:250.0/255.0 blue:250.0/255.0 alpha:1.0];
    
    NSMutableArray *viewControllers = [[NSMutableArray alloc] init];
    
    // Home
    HomeViewController *homeViewController = [[HomeViewController alloc] init];
    UINavigationController *homeNavigationController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    homeNavigationController.navigationBar.tintColor = titleBarColor;
    [viewControllers addObject:homeNavigationController];
    
    // Category
    CategoryViewController *categoryViewController = [[CategoryViewController alloc] init];
    UINavigationController *categoryNavigationController = [[UINavigationController alloc] initWithRootViewController:categoryViewController];
    categoryNavigationController.navigationBar.tintColor = titleBarColor;
    [viewControllers addObject:categoryNavigationController];
    
    // Like
    LikeViewController *likeViewController = [[LikeViewController alloc] init];
    UINavigationController *likeNavigationController = [[UINavigationController alloc] initWithRootViewController:likeViewController];
    likeNavigationController.navigationBar.tintColor = titleBarColor;
    [viewControllers addObject:likeNavigationController];
    
    // Settings
    SettingViewController *settingViewController = [[SettingViewController alloc] init];
    UINavigationController *settingNavigationController = [[UINavigationController alloc] initWithRootViewController:settingViewController];
    settingNavigationController.navigationBar.tintColor = titleBarColor;
    [viewControllers addObject:settingNavigationController];
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.tabBar.selectedImageTintColor = tabBarSelectedColor;
    //    self.tabBarController.tabBar.alpha = 0.9;
    
    [self.tabBarController setViewControllers:viewControllers];
    [self.window setRootViewController:self.tabBarController];
    
    [self.window makeKeyAndVisible];
}

@end

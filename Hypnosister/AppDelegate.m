//
//  AppDelegate.m
//  Hypnosister
//
//  Created by Glenn on 12/30/14.
//  Copyright (c) 2014 Glenn. All rights reserved.
//

#import "AppDelegate.h"
#import "BNRHypnosisView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

// Override point for customization after application launch.
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /* Window setup */
    self.window                 = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    /* Render circles and make it scrollable */
    //  - declare the bounds of the frame for our child view
    //  - set the area of the frame to be 4x the viewport area (for scrollability)
    CGRect frame1X = self.window.bounds;
    CGRect frame2X = frame1X;
    frame2X.size.width  *= 2.0;
    frame2X.size.height *= 2.0;
    //  - add scroll view to window
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame1X];
    scrollView.contentSize = frame2X.size;
    [self.window addSubview:scrollView];
    //  - add hypnoview to scroll view
    BNRHypnosisView *hypnoView  = [[BNRHypnosisView alloc] initWithFrame:frame2X];
    [scrollView addSubview:hypnoView];
    
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

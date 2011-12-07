//
//  LDTAppDelegate.m
//  ldtrkpoc1
//
//  Created by Shane Zatezalo on 12/6/11.
//  Copyright (c) 2011 Personal. All rights reserved.
//

#import "LDTAppDelegate.h"
#import "LDTViewController.h"
#import <RestKit/RestKit.h>
#import "LDTWidget.h"

@implementation LDTAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[LDTViewController alloc] initWithNibName:@"LDTViewController" bundle:nil];
    self.window.rootViewController = self.viewController;

    
    //Setup Restkit
    RKClient *client = [RKClient clientWithBaseURL:LDTHOSTNAME];
    RKLogConfigureByName("RestKit/Network", RKLogLevelDebug);
    RKLogInfo(@"Configured RestKit Client: %@", client);
    // Enable automatic network activity indicator management
    client.requestQueue.showsNetworkActivityIndicatorWhenBusy = YES;

    //Setup Restkit Mappings
    RKObjectManager* objectManager = [RKObjectManager objectManagerWithBaseURL:LDTHOSTNAME];
    
    // Enable automatic network activity indicator management
    objectManager.client.requestQueue.showsNetworkActivityIndicatorWhenBusy = YES;
    
    RKObjectMapping *widgetMapping = [RKObjectMapping mappingForClass:[LDTWidget class]];
    [widgetMapping mapKeyPath:@"id" toAttribute:@"widgetID"];
    [widgetMapping mapKeyPath:@"title" toAttribute:@"title"];
    [widgetMapping mapKeyPath:@"summary" toAttribute:@"summary"];

    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end

//
//  TCAppAppDelegate_iPhone.m
//  TCApp
//
//  Created by Frank McAuley on 2/18/11.
//  Copyright 2011 Frank McAuley LLC. All rights reserved.
//
#define DEBUG_TC

#import "TCAppAppDelegate_iPhone.h"
#import "TCFileProcessing.h"

@implementation TCAppAppDelegate_iPhone

@synthesize window;
@synthesize tabBarController;
@synthesize fileDownLoadData;
@synthesize tcdown;

- (void)dealloc
{
	[window release];
    [tabBarController release];
    [tcdown release];
    [super dealloc];
}

#pragma mark - Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{  
  
    self.tcdown = [[TCDownLoadXML alloc]init];
    [self.tcdown downloadAndProcess];
    self.tcdown.delegate = self;
    
    [[UIApplication sharedApplication] setStatusBarStyle: UIStatusBarStyleBlackOpaque];
    [self.window addSubview:tabBarController.view];
    [self.window makeKeyAndVisible];
    return YES;
    
    
}

#pragma -
#pragma DownLoad Delegate method:
- (void)tcDownLoadXML:(TCDownLoadXML *)sender didDownLoadData:(NSData *)data{
    
    self.fileDownLoadData = data;
    
    
    TCFileProcessing* tcf = [[TCFileProcessing alloc]init];
    [tcf processTheDownLoadedFileIntoCoreData:self.fileDownLoadData];
    //setup a notification.
    
    //need to filter the data
    //test if the file exists...
    //then check the date for a signifcate change...
    //inset into the core data
    
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
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
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
	[super applicationWillTerminate:application];
	// Superclass implementation saves changes in the application's managed object context before the application terminates.
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    [super applicationDidReceiveMemoryWarning:application];
    // Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
}

@end

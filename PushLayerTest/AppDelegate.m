//
//  AppDelegate.m
//  PushLayerTest
//
//  Created by Ryan Twomey on 12/3/12.
//  Copyright (c) 2012 Draconis Software, LLC. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

- (void)saveDeviceToken:(NSString *)deviceToken;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	[[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert |
																																				 UIRemoteNotificationTypeBadge |
																																				 UIRemoteNotificationTypeSound)];

	return YES;
}

#pragma mark - Push notification callbacks

- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)err {
	NSLog(@"Failed to register for pushes: %@", err);
}

- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
	const unsigned *tokenBytes = [deviceToken bytes];
	NSString *hexToken = [NSString stringWithFormat:@"%08x%08x%08x%08x%08x%08x%08x%08x",
												ntohl(tokenBytes[0]), ntohl(tokenBytes[1]), ntohl(tokenBytes[2]),
												ntohl(tokenBytes[3]), ntohl(tokenBytes[4]), ntohl(tokenBytes[5]),
												ntohl(tokenBytes[6]), ntohl(tokenBytes[7])];

	[self saveDeviceToken:hexToken];
}

#pragma mark - Public methods

- (NSString *)deviceToken {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	return [defaults objectForKey:@"deviceToken"];
}

#pragma mark - Private methods

- (void)saveDeviceToken:(NSString *)deviceToken {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setObject:deviceToken forKey:@"deviceToken"];
	[defaults synchronize];
}

@end
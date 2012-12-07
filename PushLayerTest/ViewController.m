//
//  ViewController.m
//  PushLayerTest
//
//  Created by Ryan Twomey on 12/3/12.
//  Copyright (c) 2012 Draconis Software, LLC. All rights reserved.
//

#import "AFHTTPClient.h"

#import "AppDelegate.h"
#import "ViewController.h"

#define kAPIBase								@"http://192.168.1.9:5000"
#define kAPIKey									@"e6cfb022e1b4bbe10865acc8ca76f9d0"
#define kNotificationEndpoint		@"applications/2/notifications.json"

@interface ViewController ()

- (NSDictionary *)notificationParamsForDeviceToken:(NSString *)deviceToken;
- (NSString *)notificationPath;
- (void)sendPushNotification:(NSString *)deviceToken;

@end

@implementation ViewController

#pragma mark - Callbacks

- (IBAction)handleSendPush:(id)sender {
	AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
	NSString *deviceToken = [appDelegate deviceToken];

	if (deviceToken != nil) {
		[self sendPushNotification:deviceToken];
	} else {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Device Token"
																										message:@"You need to authorize this app before pushing!"
																									 delegate:nil
																					cancelButtonTitle:@"OK"
																					otherButtonTitles:nil];
		[alert show];
	}
}

#pragma mark - Private methods

- (NSDictionary *)notificationParamsForDeviceToken:(NSString *)deviceToken {
	return [NSDictionary dictionaryWithObjectsAndKeys:
					deviceToken, @"notification[device_token]",
					@"Hello from PushLayer!", @"notification[alert_body]",
					nil];
}

- (NSString *)notificationPath {
	return [NSString stringWithFormat:@"%@?api_key=%@", kNotificationEndpoint, kAPIKey];
}

- (void)sendPushNotification:(NSString *)deviceToken {
	AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:kAPIBase]];

	[client postPath:[self notificationPath] parameters:[self notificationParamsForDeviceToken:deviceToken]
					 success:^(AFHTTPRequestOperation *operation, id responseObject) {
	  NSLog(@"Successfully queued push notification with PushLayer.");
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		NSLog(@"%@", [error localizedDescription]);
	}];
}

@end

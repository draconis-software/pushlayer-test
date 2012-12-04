//
//  ViewController.m
//  PushLayerTest
//
//  Created by Ryan Twomey on 12/3/12.
//  Copyright (c) 2012 Draconis Software, LLC. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];

	// Dispose of any resources that can be recreated.
}

#pragma mark - Callbacks

- (IBAction)handleSendPush:(id)sender {
	AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
	NSString *deviceToken = [appDelegate deviceToken];

	if (deviceToken != nil) {
		// TODO: communicate with PushLayer to send the push notification
	} else {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Device Token"
																										message:@"You need to authorize this app before pushing!"
																									 delegate:nil
																					cancelButtonTitle:@"OK"
																					otherButtonTitles:nil];
		[alert show];
	}
}

@end

//
//  AppDelegate.h
//  PushLayerTest
//
//  Created by Ryan Twomey on 12/3/12.
//  Copyright (c) 2012 Draconis Software, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (NSString *)deviceToken;

@end

//
//  HBAppDelegate.h
//  InterfaceMonitorTool
//
//  Created by pengchao.yan on 13-4-9.
//  Copyright (c) 2013年 pengchao.yan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HBViewController;
@class HBNavigationViewController;

@interface HBAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) HBNavigationViewController* navigationViewController;
@property (strong, nonatomic) HBViewController *viewController;

@end

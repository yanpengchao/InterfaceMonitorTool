//
//  HBViewController.h
//  InterfaceMonitorTool
//
//  Created by pengchao.yan on 13-4-9.
//  Copyright (c) 2013年 pengchao.yan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBDataManager.h"
#import "FPPopoverController.h"
#import "HBPopoverContentViewController.h"

@interface HBViewController : UIViewController <HBDataManagerDelegate, FPPopoverControllerDelegate, HBPopoverContentViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>
{
    //
}

@property (nonatomic, strong)NSArray* interfaceArray;
@property (nonatomic, strong)FPPopoverController* popoverViewController;
@property (nonatomic, strong)IBOutlet UIButton* testInterfaceButton;
@property (nonatomic, strong)IBOutlet UITableView* tableView;
@property (nonatomic, strong)NSArray* logInfoArray;

@property (nonatomic, strong)NSTimer* mainTimer;
@property (nonatomic, strong)NSArray* timerArray;

- (IBAction)testInterfaceButtonClicked:(id)sender;
- (IBAction)settingButtonClicked:(id)sender;
- (IBAction)showLogButtonClicked:(id)sender;

- (void)resetMainTimer;

@end

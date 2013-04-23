//
//  HBLogListViewController.h
//  InterfaceMonitorTool
//
//  Created by pengchao.yan on 13-4-10.
//  Copyright (c) 2013年 pengchao.yan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HBLogListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    //
}

@property (nonatomic, strong)NSArray* logFileArray;
@property (nonatomic, strong)IBOutlet UITableView* tableView;
@end

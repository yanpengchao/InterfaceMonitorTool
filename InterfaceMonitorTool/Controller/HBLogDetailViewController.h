//
//  HBLogDetailViewController.h
//  InterfaceMonitorTool
//
//  Created by pengchao.yan on 13-4-10.
//  Copyright (c) 2013年 pengchao.yan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HBLogDetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    //
}

@property (nonatomic, strong)NSString* logFileName;
@property (nonatomic, strong)NSArray* logDataArray;
@property (nonatomic, strong)IBOutlet UITableView* tableView;
@end

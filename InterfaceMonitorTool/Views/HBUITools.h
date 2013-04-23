//
//  HBUITools.h
//  CircleMenuDemo
//
//  Created by pengchao.yan on 12-8-29.
//  Copyright (c) 2012年 howbuy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBUITools : NSObject

+ (id)loadCellFromNibName:(NSString *)nibNameOrNil reuseIdentifier:(NSString *)reuseIdentifier;
+ (id)loadCellForTableView:(UITableView*)tableView byNibName:(NSString *)nibNameOrNil reuseIdentifier:(NSString *)reuseIdentifier;
+ (void)MessageBoxWithMessage:(NSString*)message title:(NSString*)title;
@end

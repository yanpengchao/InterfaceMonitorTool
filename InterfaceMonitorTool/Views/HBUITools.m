//
//  HBUITools.m
//  CircleMenuDemo
//
//  Created by pengchao.yan on 12-8-29.
//  Copyright (c) 2012年 howbuy. All rights reserved.
//

#import "HBUITools.h"

@implementation HBUITools

+ (id)loadCellFromNibName:(NSString *)nibNameOrNil reuseIdentifier:(NSString *)reuseIdentifier {
    UITableViewCell *cell = nil;
    
    @synchronized ([NSBundle mainBundle])
    {
        NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:nibNameOrNil owner:nil options:nil];
        for (id obj in nibs) {
            if ([obj isKindOfClass:[UITableViewCell class]]) {
                cell = obj;
                if ([cell.reuseIdentifier isEqualToString:reuseIdentifier]) {
                    return cell;
                }
            }
        }
        if (cell == nil) {
            Class class = NSClassFromString(reuseIdentifier);
            if (class == Nil) {
                HBErrorLog(@"Failed to load cell from Nib or create with class reuseIdentifier:%@, maybe you need to create by yourself", reuseIdentifier);
                return nil;
            }
            cell = [[class alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
        }
    }
    
    return cell;
}

+ (id)loadCellForTableView:(UITableView*)tableView byNibName:(NSString *)nibNameOrNil reuseIdentifier:(NSString *)reuseIdentifier
{
    UITableViewCell *cell = nil;
    if (tableView != nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    }
    
    if (cell == nil) {
        cell = [self loadCellFromNibName:nibNameOrNil reuseIdentifier:reuseIdentifier];
    }
    
    return cell;
}

+ (void)MessageBoxWithMessage:(NSString*)message title:(NSString*)title
{
    if (title == nil) {
        title = @"信托大全";
    }
    
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
}
@end

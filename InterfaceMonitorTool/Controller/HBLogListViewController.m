//
//  HBLogListViewController.m
//  InterfaceMonitorTool
//
//  Created by pengchao.yan on 13-4-10.
//  Copyright (c) 2013年 pengchao.yan. All rights reserved.
//

#import "HBLogListViewController.h"
#import "HBFileLog.h"
#import "HBLogDetailViewController.h"

@interface HBLogListViewController ()

@end

@implementation HBLogListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStyleBordered target:self action:@selector(editButtonClicked)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
//    [self fackData];
    self.logFileArray = [HBFileLog listAllLogFiles];
    // Do any additional setup after loading the view from its nib.
}

- (void)fackData
{
    [[HBFileLog getInstance] startLog];
    [[HBFileLog getInstance] writeLog:@"盘面分析\n这项记录工作既可以在看盘中进行，也可以在收盘后进行。记录的内容主要是市场的变化以及观察到的特点。比如，今日是否有重大资讯公布？如果有，市场对此的反应是怎样的？你的反应又是怎样的？市场原有趋势发展如何？波动和行为是怎样的？多头（空头）是否后劲不足？空头（多头）是否准备反攻？价格是否逼近重要的压力或支撑？有否新的交易机会出现？预期的情况是否已经发生？原有仓位可否继续持有？是否发现了新的规律？有否异常现象和你曾经学习的理论发生违背？"];
    [[HBFileLog getInstance] writeLog:@"交易细节\n交易细节主要包括交易日期、品种名称、买入价格、卖出价格、止损设置、投入资金占比、全部佣金、交易理由、交易目标。另外还包括是否按计划执行？如不是，原因是什么？当前盈利亏损是怎样的？"];
    [[HBFileLog getInstance] writeLog:@"思想状态\n进行交易前的期望是什么？当你观察和实际交易过程时，有什么感受？尤其是没有达到预期时，你是什么感觉？哪些情况会引起你情绪上的波动？带来何种行为？当出现你预料外的走势时，你是怎样想、怎么做的？当出现你预期中的走势你又是怎样想的？做了什么？"];
    [[HBFileLog getInstance] writeLog:@"绩效评估\n在你的分析和交易中，你所有的判断其准确性如何？原来的交易信号现在看起来怎样？你对哪些地方感到满意？对哪些地方你现在会有不同的做法？如何改进？你学到了哪些教训？在新方法的交易中，你犯下了哪些错误？经验和教训是什么？对于未平仓品种，价格是否达到目标区？是否已经进了目标区而需要更严密观察？是否需要加仓或减仓？是否按照计划发展？如果资金运用到其他方面，绩效是否更理想？现在就应该出场，或再持有一段时间？行情是否逼近止损点？你是否忽略了止损点？价格波动程度是否发生变化？对于平仓品种，你是遵循了先前设定的退出策略，还是因为其他原因退出的？原因是什么？"];
    [[HBFileLog getInstance] writeLog:@"总结提高\n在今天的交易和观察中，你得到了什么启发？如何使其发扬光大并服务于自己的交易？对于获得的经验和教训，需要做什么工作使其得以巩固和完善？需要制定和执行哪些规则才能够更好地改正自己的错误？"];
    [[HBFileLog getInstance] endLog];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"日志列表";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.logFileArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [cell.textLabel setText:[self.logFileArray objectAtIndex:([self.logFileArray count] - indexPath.row - 1)]];
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [HBFileLog deleteLogFile:[self.logFileArray objectAtIndex:([self.logFileArray count] - indexPath.row - 1)]];
        NSMutableArray* tempLogFileArray = [NSMutableArray arrayWithArray:self.logFileArray];
        [tempLogFileArray removeObjectAtIndex:([self.logFileArray count] - indexPath.row - 1)];
        self.logFileArray = tempLogFileArray;
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HBLogDetailViewController* logDetailViewController = nil;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        logDetailViewController = [[HBLogDetailViewController alloc] initWithNibName:@"HBLogListViewController_iPhone" bundle:nil];
    }
    else
    {
        logDetailViewController = [[HBLogDetailViewController alloc] initWithNibName:@"HBLogListViewController_iPad" bundle:nil];
    }
    
    logDetailViewController.logFileName = [self.logFileArray objectAtIndex:([self.logFileArray count] - indexPath.row - 1)];
    [self.navigationController pushViewController:logDetailViewController animated:YES];
}

#pragma mark - local functions
- (void)editButtonClicked
{
    [self.tableView setEditing:![self.tableView isEditing] animated:YES];
}
@end

//
//  HBViewController.m
//  InterfaceMonitorTool
//
//  Created by pengchao.yan on 13-4-9.
//  Copyright (c) 2013年 pengchao.yan. All rights reserved.
//

#import "HBViewController.h"
#import "HBFeiXin.h"
#import "HBSettingViewController.h"
#import "HBLogListViewController.h"
#import "HBPopoverContentViewController.h"
#import "HBAppConfig.h"
#import "HBFileLog.h"
#import "HBDefine.h"
#import "HBMultiLineCell.h"
#import "HBUITools.h"

//#define TEST_TIMER

@interface HBInterfaceItem : HBMultiSelectItem
{
    //
}

@property (nonatomic)EMessageID eMessageType;
@property (nonatomic)BOOL isMonitorFinished;

@end

@implementation HBInterfaceItem 

//

@end

@interface HBViewController ()

@property (nonatomic)BOOL isMonitoring;
@property (nonatomic, strong)NSArray* monitorInterfaceArray;

@end

@implementation HBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableArray* mInterfaceArray = [NSMutableArray array];
    HBInterfaceItem* item = nil;
    
    item = [[HBInterfaceItem alloc] init];
    item.title = @"获取开放式基金净值接口";
    item.isSelected = YES;
    item.eMessageType = eMessageIDGetOpenFundNetValue;
    [mInterfaceArray addObject:item];
    
    item = [[HBInterfaceItem alloc] init];
    item.title = @"获取封闭式基金净值接口";
    item.isSelected = YES;
    item.eMessageType = eMessageIDGetCloseFundNetValue;
    [mInterfaceArray addObject:item];
    
    item = [[HBInterfaceItem alloc] init];
    item.title = @"获取货币式基金净值接口";
    item.isSelected = YES;
    item.eMessageType = eMessageIDGetMoneyFundNetValue;
    [mInterfaceArray addObject:item];
    
    item = [[HBInterfaceItem alloc] init];
    item.title = @"获取私募基金净值接口";
    item.isSelected = YES;
    item.eMessageType = eMessageIDGetPrivateFundNetValue;
    [mInterfaceArray addObject:item];
    
    item = [[HBInterfaceItem alloc] init];
    item.title = @"获取基金基本信息接口";
    item.isSelected = YES;
    item.eMessageType = eMessageIDUpdateFundsBasicInfo;
    [mInterfaceArray addObject:item];
    
    item = [[HBInterfaceItem alloc] init];
    item.title = @"按类型获取分页新闻接口";
    item.isSelected = YES;
    item.eMessageType = eMessageIDGetNewsByType;
    [mInterfaceArray addObject:item];
    
    item = [[HBInterfaceItem alloc] init];
    item.title = @"单多条获取净值接口";
    item.eMessageType = eMessageIDGetFundNetValueByIDs;
    item.isSelected = YES;
    [mInterfaceArray addObject:item];
    
    item = [[HBInterfaceItem alloc] init];
    item.title = @"分页获取信托产品接口";
    item.eMessageType = eMessageIDGetTrustByPage;
    item.isSelected = YES;
    [mInterfaceArray addObject:item];
    
    self.interfaceArray = mInterfaceArray;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"检测工具";
    
    [self resetMainTimer];
}

- (void)resetMainTimer
{
    if ([HBAppConfig getInstance].timerConfigChanged) {
        [HBAppConfig getInstance].timerConfigChanged = NO;
    
        [self.mainTimer invalidate];
#ifdef TEST_TIMER
        self.mainTimer = [NSTimer timerWithTimeInterval:2*60 target:self selector:@selector(setupTimer) userInfo:nil repeats:YES];
        [self writeMyLog:@"主定时器将每隔8分钟启动一次"];
#else
        self.mainTimer = [NSTimer timerWithTimeInterval:24*60*60 target:self selector:@selector(setupTimer) userInfo:nil repeats:YES];
        [self writeMyLog:@"主定时器将每隔24小时启动一次"];
#endif
        [[NSRunLoop currentRunLoop] addTimer:self.mainTimer forMode:NSRunLoopCommonModes];
        
        [self setupTimer];
    }
}

- (IBAction)testInterfaceButtonClicked:(id)sender
{
    if (self.isMonitoring) {
        self.isMonitoring = NO;
        [self.testInterfaceButton setTitle:@"检测接口" forState:UIControlStateNormal];
    }
    else
    {
        HBPopoverContentViewController *controller = [[HBPopoverContentViewController alloc] init];
        controller.items = self.interfaceArray;
        controller.delegate = self;
        
        if ([controller.items count] <= 0) {
            return;
        }
        
        int height = [controller.items count]*44 + 50 + 20;
        CGSize size = CGSizeMake(260, 300);
        size.height = height;
        
        CGRect rect = controller.view.bounds;
        rect.size = size;
        [controller.view setBounds:rect];
        
        self.popoverViewController = [[FPPopoverController alloc] initWithViewController:controller];
        self.popoverViewController.tint = FPPopoverDefaultTint;
        self.popoverViewController.arrowDirection = FPPopoverArrowDirectionAny;
        [self.popoverViewController setDelegate:self];
        [self.popoverViewController presentPopoverFromView:sender];
    }
}

- (IBAction)settingButtonClicked:(id)sender
{
    HBSettingViewController* settingViewController = nil;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        settingViewController = [[HBSettingViewController alloc] initWithNibName:@"HBSettingViewController_iPhone" bundle:nil];
    }
    else
    {
        settingViewController = [[HBSettingViewController alloc] initWithNibName:@"HBSettingViewController_iPad" bundle:nil];
    }
    
    [self.navigationController pushViewController:settingViewController animated:YES];
}

- (IBAction)showLogButtonClicked:(id)sender
{
    HBLogListViewController* listViewController = nil;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        listViewController = [[HBLogListViewController alloc] initWithNibName:@"HBLogListViewController_iPhone" bundle:nil];
    }
    else
    {
        listViewController = [[HBLogListViewController alloc] initWithNibName:@"HBLogListViewController_iPad" bundle:nil];
    }
    
    [self.navigationController pushViewController:listViewController animated:YES];
}

#pragma mark - HBDataManagerDelegate functions

- (void)requestStarted:(ASIHTTPRequest *)request withTag:(EMessageID)tag
{
    NSString* logString = [NSString stringWithFormat:@"%@ 接口调用开始", [self interfaceDescriptionForTag:tag]];
    [self writeMyLog:logString];
}

- (void)requestFinished:(ASIHTTPRequest *)request withData:(NSDictionary*)data andTag:(EMessageID)tag
{
    if ([[data objectForKey:KNWK_ResponseCode] intValue] != 1) {
        NSString* logString = [NSString stringWithFormat:@"%@ 接口调用失败，原因：%@", [self interfaceDescriptionForTag:tag], [data objectForKey:KNWK_ResponseContent]];
        [self writeMyLog:logString];
        [[HBFeiXin getInstance] sendSms:logString];
    }
    else
    {
        NSString* logString = [NSString stringWithFormat:@"%@ 接口调用成功", [self interfaceDescriptionForTag:tag]];
        [self writeMyLog:logString];
    }
    
    [NSThread detachNewThreadSelector:@selector(monitorThread) toTarget:self withObject:nil];
}

- (void)requestFailed:(ASIHTTPRequest *)request withTag:(EMessageID)tag
{
    NSString* logString = [NSString stringWithFormat:@"%@ 接口调用失败", [self interfaceDescriptionForTag:tag]];
    [self writeMyLog:logString];
    [[HBFeiXin getInstance] sendSms:logString];
    
    [NSThread detachNewThreadSelector:@selector(monitorThread) toTarget:self withObject:nil];
}

- (NSString*)interfaceDescriptionForTag:(EMessageID)tag
{
    for (HBInterfaceItem* item in self.interfaceArray) {
        if (item.eMessageType == tag) {
            return item.title;
        }
    }
    
    return @"";
}

#pragma mark - FPPopoverControllerDelegate functions
- (void)popoverControllerDidDismissPopover:(FPPopoverController *)popoverController
{
    //
}

- (void)presentedNewPopoverController:(FPPopoverController *)newPopoverController shouldDismissVisiblePopover:(FPPopoverController*)visiblePopoverController
{
    //
}

#pragma mark - HBPopoverContentViewControllerDelegate functions

- (void)cancelButtonClicked
{
    [self.popoverViewController dismissPopoverAnimated:YES];
}

- (void)okButtonClicked
{
    [self.popoverViewController dismissPopoverAnimated:YES];
    [self monitorSelectedInterface];
}

- (void)monitorSelectedInterface
{
    NSMutableArray* array = [NSMutableArray array];
    for (HBInterfaceItem* item in self.interfaceArray) {
        item.isMonitorFinished = NO;
        if (item.isSelected) {
            [array addObject:item];
        }
    }
    
    if ([array count] > 0) {
        self.monitorInterfaceArray = array;
        self.isMonitoring = YES;
        [self.testInterfaceButton setTitle:@"取消检测" forState:UIControlStateNormal];
        
        [[HBFileLog getInstance] startLog];
        self.logInfoArray = [NSArray array];
        [self writeMyLog:@"开始检测接口"];
        
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateStyle:NSDateFormatterFullStyle];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSString* dateString = [dateFormatter stringFromDate:[NSDate date]];
        
        NSString* logString = [NSString stringWithFormat:@"%@ 开始检测接口", dateString];
        [[HBFeiXin getInstance] sendSms:logString];
        [NSThread detachNewThreadSelector:@selector(monitorThread) toTarget:self withObject:nil];
    }
}

- (void)monitorThread
{
    @autoreleasepool {
        BOOL finished = YES;
        for (HBInterfaceItem* item in self.monitorInterfaceArray) {
            if (item.isSelected && !item.isMonitorFinished) {
                item.isMonitorFinished = YES;
                [self monitorInterface:item.eMessageType];
                finished = NO;
                break;
            }
        }
        
        if (finished) {
            [self writeMyLog:@"接口检测结束"];
            
            [self performSelector:@selector(endLog) withObject:nil afterDelay:.1];
            
            NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateStyle:NSDateFormatterFullStyle];
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            NSString* dateString = [dateFormatter stringFromDate:[NSDate date]];
            
            NSString* logString = [NSString stringWithFormat:@"%@ 接口检测结束", dateString];
            [[HBFeiXin getInstance] sendSms:logString];
            
            self.isMonitoring = NO;
            [self.testInterfaceButton setTitle:@"检测接口" forState:UIControlStateNormal];
        }
    }
}

- (void)monitorInterface:(EMessageID)interfaceType
{
    id request = nil;
    switch (interfaceType) {
        case eMessageIDGetOpenFundNetValue:
        {
            NSMutableDictionary* userInfo = [[NSMutableDictionary alloc]init];
            [userInfo setObject:@"1" forKey:@"type"];
            [userInfo setObject:[[HBAppConfig getInstance] openFundsVersion] forKey:@"typeVer"];
            [[HBDataManager getInstance] addDelegate:self forRequestTag:eMessageIDGetOpenFundNetValue];
            request = [[HBDataManager getInstance] requestNetWork:eMessageIDGetOpenFundNetValue withParams:userInfo];
        }
            break;
        case eMessageIDGetCloseFundNetValue:
        {
            NSMutableDictionary* userInfo = [[NSMutableDictionary alloc]init];
            [userInfo setObject:@"4" forKey:@"type"];
            [userInfo setObject:[[HBAppConfig getInstance] closeFundsVersion] forKey:@"typeVer"];
            [[HBDataManager getInstance] addDelegate:self forRequestTag:eMessageIDGetCloseFundNetValue];
            request = [[HBDataManager getInstance] requestNetWork:eMessageIDGetCloseFundNetValue withParams:userInfo];
        }
            break;
        case eMessageIDGetMoneyFundNetValue:
        {
            NSMutableDictionary* userInfo = [[NSMutableDictionary alloc]init];
            [userInfo setObject:@"2" forKey:@"type"];
            [userInfo setObject:[[HBAppConfig getInstance] moneyFundsVersion] forKey:@"typeVer"];
            [[HBDataManager getInstance] addDelegate:self forRequestTag:eMessageIDGetMoneyFundNetValue];
            request = [[HBDataManager getInstance] requestNetWork:eMessageIDGetMoneyFundNetValue withParams:userInfo];
        }
            break;
        case eMessageIDGetPrivateFundNetValue:
        {
            NSMutableDictionary* userInfo = [[NSMutableDictionary alloc]init];
            [userInfo setObject:@"3" forKey:@"type"];
            [userInfo setObject:[[HBAppConfig getInstance] privateFundsVersion] forKey:@"typeVer"];
            [[HBDataManager getInstance] addDelegate:self forRequestTag:eMessageIDGetPrivateFundNetValue];
            request = [[HBDataManager getInstance] requestNetWork:eMessageIDGetPrivateFundNetValue withParams:userInfo];
        }
            break;
        case eMessageIDUpdateFundsBasicInfo:
        {
            [[HBDataManager getInstance] addDelegate:self forRequestTag:eMessageIDUpdateFundsBasicInfo];
            request = [[HBDataManager getInstance] requestNetWork:eMessageIDUpdateFundsBasicInfo withParams:nil];
        }
            break;
        case eMessageIDGetNewsByType:
        {
            NSDictionary* userInfo = [NSDictionary dictionaryWithObjectsAndKeys:@"129013", @"newsType", [NSNumber numberWithInt:20], @"pageCount", [NSNumber numberWithInt:1], @"currentPage", nil];
            [[HBDataManager getInstance] addDelegate:self forRequestTag:eMessageIDGetNewsByType];
            request = [[HBDataManager getInstance] requestNetWork:eMessageIDGetNewsByType withParams:userInfo];
        }
            break;
        case eMessageIDGetFundNetValueByIDs:
        {
            NSMutableDictionary* userInfo = [[NSMutableDictionary alloc]init];
            NSArray* ids = [HBAppConfig getInstance].customIDsArray;
            [userInfo setObject:ids forKey:@"fundCodes"];
            [[HBDataManager getInstance] addDelegate:self forRequestTag:eMessageIDGetFundNetValueByIDs];
            request = [[HBDataManager getInstance] requestNetWork:eMessageIDGetFundNetValueByIDs withParams:userInfo];
        }
            break;
        case eMessageIDGetTrustByPage:
        {
            NSDictionary* dic = nil;
            dic = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1], @"currentPage", [NSNumber numberWithInt:20], @"pageCount", nil];
            [[HBDataManager getInstance] addDelegate:self forRequestTag:eMessageIDGetTrustByPage];
            request = [[HBDataManager getInstance] requestNetWork:eMessageIDGetTrustByPage withParams:dic];
        }
            break;
        default:
            break;
    }
    
    if (request == nil) {
        [self writeMyLog:@"本地网络不通"];
    }
}

- (void)writeMyLog:(NSString*)string
{
    [self performSelectorOnMainThread:@selector(_writeMyLog_:) withObject:string waitUntilDone:NO];
}

- (void)_writeMyLog_:(NSString*)string
{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterFullStyle];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString* dateString = [dateFormatter stringFromDate:[NSDate date]];
    
    NSString* logString = [NSString stringWithFormat:@"%@ %@", dateString, string];
    NSMutableArray* mLogArray = [NSMutableArray arrayWithArray:self.logInfoArray];
    [mLogArray addObject:logString];
    self.logInfoArray = mLogArray;
    [self.tableView reloadData];
    
    HBInfoLog(@"%@ %@", dateString, string);
    [[HBFileLog getInstance] writeLog:logString];
}

- (void)endLog
{
    [self performSelectorOnMainThread:@selector(_endLog_) withObject:nil waitUntilDone:NO];
}

- (void)_endLog_
{
    [[HBFileLog getInstance] endLog];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.logInfoArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"HBMultiLineCell";
    HBMultiLineCell* cell = [HBUITools loadCellForTableView:tableView byNibName:CellIdentifier reuseIdentifier:CellIdentifier];
    
    [cell.multiLineTextLabel setText:[self.logInfoArray objectAtIndex:[self.logInfoArray count] - indexPath.row - 1]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* showText = [self.logInfoArray objectAtIndex:[self.logInfoArray count] - indexPath.row - 1];
    CGFloat textHeight = [self getMutableTextHeight:showText withFont:[UIFont systemFontOfSize:14]];
    textHeight = textHeight + 16;
    return textHeight;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //
}

#pragma mark - local functions
- (CGFloat)getMutableTextHeight:(NSString*)text withFont:(UIFont*)font
{
    NSInteger width = 300;
    if (![[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        width = 655;
    }
    CGSize sizeToFit = [text sizeWithFont:font constrainedToSize:CGSizeMake(width, CGFLOAT_MAX)lineBreakMode:UILineBreakModeWordWrap];
    
    return sizeToFit.height;
}

- (void)setupTimer
{   
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *weekdayComponents =[gregorian components:NSWeekdayCalendarUnit fromDate:[NSDate date]];
    NSInteger weekday = [weekdayComponents weekday];
    
    NSMutableArray* tempArray = [NSMutableArray array];
    for (NSDictionary* dic in [HBAppConfig getInstance].monitorTimerArray) {
        NSString* timerName = [dic objectForKey:MONITOR_TIMER_DISPLAY_NAME_KEY];
        NSString* timerTime = [dic objectForKey:MONITOR_TIMER_RUN_TIME_KEY];
        NSDate* timerDate = [NSDate dateWithTimeIntervalSince1970:[timerTime doubleValue]/1000];
        BOOL timerOn = [[dic objectForKey:MONITOR_TIMER_ON_KEY] boolValue];
        BOOL weekendFlag = [[dic objectForKey:MONITOR_TIMER_WEEKEND_FLAG_KEY] boolValue];
        
        if (!timerOn) {
            [self writeMyLog:[NSString stringWithFormat:@"%@ 开关已关闭", timerName]];
        }
        else
        {
            // weekday 1 = Sunday for Gregorian calendar
            // 周五，周日单独检查（周五有可能漏掉周六的定时器，周日可能漏掉周一的定时器）
            if (weekday > 1 && weekday < 6) {   // 周一到周四
                if (weekendFlag) {
                    [self writeMyLog:[NSString stringWithFormat:@"%@ 今天不工作", timerName]];
                }
                else
                {
                    NSUInteger timeDelay = [self getTimerDelayTime:timerDate];
                    NSTimer* timer = [NSTimer timerWithTimeInterval:timeDelay target:self selector:@selector(timerStart) userInfo:nil repeats:NO];
                    [self writeMyLog:[NSString stringWithFormat:@"%@ 将在%d时%d分%d秒后启动", timerName, timeDelay/(60*60), (timeDelay%(60*60))/60, timeDelay%60]];
                    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
                    [tempArray addObject:timer];
                }
            }
            else if (weekday == 6)  // 周五
            {
                if (weekendFlag && ![self isTomorrow:timerDate]) {
                    [self writeMyLog:[NSString stringWithFormat:@"%@ 今天不工作", timerName]];
                }
                else
                {
                    NSUInteger timeDelay = [self getTimerDelayTime:timerDate];
                    NSTimer* timer = [NSTimer timerWithTimeInterval:timeDelay target:self selector:@selector(timerStart) userInfo:nil repeats:NO];
                    [self writeMyLog:[NSString stringWithFormat:@"%@ 将在%d时%d分%d秒后启动", timerName, timeDelay/(60*60), (timeDelay%(60*60))/60, timeDelay%60]];
                    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
                    [tempArray addObject:timer];
                }
            }
            else if (weekday == 7)  // 周六
            {
                if (weekendFlag) {
                    NSUInteger timeDelay = [self getTimerDelayTime:timerDate];
                    NSTimer* timer = [NSTimer timerWithTimeInterval:timeDelay target:self selector:@selector(timerStart) userInfo:nil repeats:NO];
                    [self writeMyLog:[NSString stringWithFormat:@"%@ 将在%d时%d分%d秒后启动", timerName, timeDelay/(60*60), (timeDelay%(60*60))/60, timeDelay%60]];
                    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
                    [tempArray addObject:timer];
                }
                else
                {
                    [self writeMyLog:[NSString stringWithFormat:@"%@ 今天不工作", timerName]];
                }
            }
            else if (weekday == 1)  // 周日
            {
                if ((weekendFlag && ![self isTomorrow:timerDate]) || (!weekendFlag && [self isTomorrow:timerDate])) {
                    NSUInteger timeDelay = [self getTimerDelayTime:timerDate];
                    NSTimer* timer = [NSTimer timerWithTimeInterval:timeDelay target:self selector:@selector(timerStart) userInfo:nil repeats:NO];
                    [self writeMyLog:[NSString stringWithFormat:@"%@ 将在%d时%d分%d秒后启动", timerName, timeDelay/(60*60), (timeDelay%(60*60))/60, timeDelay%60]];
                    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
                    [tempArray addObject:timer];
                }
                else
                {
                    [self writeMyLog:[NSString stringWithFormat:@"%@ 今天不工作", timerName]];
                }
            }
        }
    }
    
    [self performSelector:@selector(endLog) withObject:nil afterDelay:.1];
    
    for (NSTimer* timer in self.timerArray) {
        [timer invalidate];
    }
    self.timerArray = tempArray;
}

- (void)timerStart
{
    for (HBInterfaceItem* item in self.interfaceArray) {
        item.isSelected = YES;
        item.isMonitorFinished = NO;
    }
    
    [self performSelectorOnMainThread:@selector(monitorSelectedInterface) withObject:nil waitUntilDone:NO];
}

- (BOOL)isTomorrow:(NSDate*)date
{
    NSDate* now = [NSDate date];
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* nowComponents = [calendar components:NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:now];
    NSDateComponents* timerComponents = [calendar components:NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:date];
    
    NSInteger nowHour = [nowComponents hour];
    NSInteger nowMinute = [nowComponents minute];
    NSInteger nowSecond = [nowComponents second];
    NSInteger timerHour = [timerComponents hour];
    NSInteger timerMinute = [timerComponents minute];
    NSInteger timerSecond = [timerComponents second];
    NSInteger hourGap = timerHour - nowHour;
    NSInteger timeGap= (hourGap*60 + (timerMinute - nowMinute))*60 + (timerSecond - nowSecond);
    
    return timeGap < 0;
}

- (NSUInteger)getTimerDelayTime:(NSDate*)date
{
    NSDate* now = [NSDate date];
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* nowComponents = [calendar components:NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:now];
    NSDateComponents* timerComponents = [calendar components:NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:date];
    
    NSInteger nowHour = [nowComponents hour];
    NSInteger nowMinute = [nowComponents minute];
    NSInteger nowSecond = [nowComponents second];
    NSInteger timerHour = [timerComponents hour];
    NSInteger timerMinute = [timerComponents minute];
    NSInteger timerSecond = [timerComponents second];
    NSInteger hourGap = timerHour - nowHour;
    NSInteger timeGap= (hourGap*60 + (timerMinute - nowMinute))*60 + (timerSecond - nowSecond);
    
#ifdef TEST_TIMER
    while (timeGap <= 0) {
        timeGap = timeGap + 1*60;
    }
    
#else
    if (timeGap < 0) {
        timeGap = timeGap + 24*60*60;
    }
#endif
    
    return timeGap;
}

@end

//
//  HBSettingViewController.m
//  InterfaceMonitorTool
//
//  Created by pengchao.yan on 13-4-10.
//  Copyright (c) 2013年 pengchao.yan. All rights reserved.
//

#import "HBSettingViewController.h"
#import "HBSettingDateCell.h"
#import "HBAppConfig.h"
#import "HBSimpleFunctionsDef.h"
#import "HBDefine.h"

@interface HBSettingViewController ()

@end

@implementation HBSettingViewController

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
    
    NSMutableArray* array = [NSMutableArray array];
    [array addObject:@"开放式基金净值时间戳"];
    [array addObject:@"封闭式基金净值时间戳"];
    [array addObject:@"货币型基金净值时间戳"];
    [array addObject:@"私募基金净值时间戳"];
    [array addObject:@"基金基本信息时间戳"];
    [array addObject:@"短信发送开关"];
    self.settingArray = array;
    
    self.timerArray = [HBAppConfig getInstance].monitorTimerArray;
    self.usersArray = [HBAppConfig getInstance].monitorUserArray;
    
    UIView* rightItemView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 120, 38)];
    
//    self.addWorkDayMonitorTimerBt = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.addWorkDayMonitorTimerBt = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.addWorkDayMonitorTimerBt setFrame: CGRectMake(0, 0, 60, 38)];
//    [self.addWorkDayMonitorTimerBt setBackgroundColor:[UIColor blackColor]];
    [self.addWorkDayMonitorTimerBt setBackgroundImage:[UIImage imageNamedHB:@"btn_bg"] forState:UIControlStateNormal];
    [[self.addWorkDayMonitorTimerBt titleLabel] setFont:[UIFont fontWithName:KHBZhBoldFontName size:12]];
    [self.addWorkDayMonitorTimerBt setTitle:@"+工作日" forState:UIControlStateNormal];
    [self.addWorkDayMonitorTimerBt setTitleColor:UIColorFromRGB(0x780000) forState:UIControlStateNormal];
    [self.addWorkDayMonitorTimerBt addTarget:self action:@selector(addWorkDayMonitorTimer) forControlEvents:UIControlEventTouchDown];
    [rightItemView addSubview:self.addWorkDayMonitorTimerBt];
    
//    self.addWeekendMonitorTimerBt = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.addWeekendMonitorTimerBt = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.addWeekendMonitorTimerBt setFrame: CGRectMake(60, 0, 60, 38)];
//    [self.addWeekendMonitorTimerBt setBackgroundColor:[UIColor blackColor]];
    [self.addWeekendMonitorTimerBt setBackgroundImage:[UIImage imageNamedHB:@"btn_bg"] forState:UIControlStateNormal];
    [[self.addWeekendMonitorTimerBt titleLabel] setFont:[UIFont fontWithName:KHBZhBoldFontName size:12]];
    [self.addWeekendMonitorTimerBt setTitle:@"+周末" forState:UIControlStateNormal];
    [self.addWeekendMonitorTimerBt setTitleColor:UIColorFromRGB(0x780000) forState:UIControlStateNormal];
    [self.addWeekendMonitorTimerBt addTarget:self action:@selector(addWeekendMonitorTimer) forControlEvents:UIControlEventTouchDown];
    [rightItemView addSubview:self.addWeekendMonitorTimerBt];
    
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightItemView];
    self.navigationItem.rightBarButtonItem = rightItem;
    
//    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addMonitorTimer)];
//    self.navigationItem.rightBarButtonItem = rightItem;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.userPickerView = [[ALPickerView alloc] initWithFrame:CGRectMake(0, 51, 320, 216)];
    }
    else
    {
        self.userPickerView = [[ALPickerView alloc] initWithFrame:CGRectMake(0, 0, 672, 216)];
    }
	self.userPickerView.delegate = self;
	[self.userPickerViewParent addSubview:self.userPickerView];
    // Do any additional setup after loading the view from its nib.
}

- (void)addWeekendMonitorTimer
{
    [self.addWeekendMonitorTimerBt setEnabled:NO];
    [self addMonitorTimer:YES];
    [self.addWeekendMonitorTimerBt setEnabled:YES];
}

- (void)addWorkDayMonitorTimer
{
    [self.addWorkDayMonitorTimerBt setEnabled:NO];
    [self addMonitorTimer:NO];
    [self.addWorkDayMonitorTimerBt setEnabled:YES];
}

- (void)addMonitorTimer:(BOOL)weekendFlag
{
    NSInteger count = [self getATimerIndex];
    NSString* name = [NSString stringWithFormat:@"定时器%d", count];
    
    NSDate* now = [NSDate date];
    NSString* dateStr = [NSString stringWithFormat:@"%.0f", [now timeIntervalSince1970]*1000];
    NSDictionary* dic = [NSDictionary dictionaryWithObjectsAndKeys:name, MONITOR_TIMER_DISPLAY_NAME_KEY, [NSNumber numberWithBool:YES], MONITOR_TIMER_ON_KEY, [NSNumber numberWithBool:weekendFlag], MONITOR_TIMER_WEEKEND_FLAG_KEY, dateStr, MONITOR_TIMER_RUN_TIME_KEY, nil];
    
    NSMutableArray* newArray = [NSMutableArray arrayWithArray:self.timerArray];
    [newArray insertObject:dic atIndex:count-1];
//    [newArray addObject:dic];
    
    self.timerArray = newArray;
    [HBAppConfig getInstance].monitorTimerArray = newArray;
    [HBAppConfig getInstance].timerConfigChanged = YES;
    
    [self.tableView reloadData];
    
    NSIndexPath* toRow = [NSIndexPath indexPathForRow:count - 1 inSection:1];
//    [self.tableView scrollToRowAtIndexPath:toRow atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    [self.tableView selectRowAtIndexPath:toRow animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    [self datePickerValueChanged:self.pickerView];
}

- (NSInteger)getATimerIndex
{
    NSInteger count = 1;
    for (NSDictionary* dic in self.timerArray) {
        NSString* name = [dic objectForKey:MONITOR_TIMER_DISPLAY_NAME_KEY];
        NSString* compareName = [NSString stringWithFormat:@"定时器%d", count];
        if (![name isEqualToString:compareName]) {
            return count;
        }
        
        count ++;
    }
    
    return count;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"设置";
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if (self.isShowingPickerView) {
        [self dismissDatePicker];
    }
    if (self.isShowingUserPickerView) {
        [self dismissUserPicker];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return [self.settingArray count];
    }
    else if (section == 1)
    {
        return [self.timerArray count];
    }
    
    return 0;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"基本配置";
    }
    else if (section == 1)
    {
        return @"定时器";
    }
    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        static NSString *CellIdentifier = @"HBSettingDateCell";
        HBSettingDateCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [HBSettingDateCell createSettingDateCell];
        }
        
        [cell.settingWeekLabel setHidden:YES];
        cell.settingKeyLabel.text = [self.settingArray objectAtIndex:indexPath.row];
        cell.settingValueLabel.text = [self getDateByRow:indexPath.row];
        
        if (indexPath.row >= [self.settingArray count] - 1) {
            [cell.settingSwitch setHidden:NO];
            cell.settingSwitch.on = [HBAppConfig getInstance].isSendSmsOn;
        }
        else
        {
            [cell.settingSwitch setHidden:YES];
        }
        
        cell.delegate = self;
        return cell;
    }
    else
    {
        static NSString *CellIdentifier = @"HBSettingTimerCell";
        HBSettingTimerCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [HBSettingTimerCell createSettingTimerCell];
        }
        
        [cell.settingWeekLabel setHidden:NO];
        [cell.settingSwitch setHidden:NO];
        if (indexPath.row < [self.timerArray count]) {
            NSDictionary* dic = [self.timerArray objectAtIndex:indexPath.row];
            cell.settingKeyLabel.text = [dic objectForKey:MONITOR_TIMER_DISPLAY_NAME_KEY];
            cell.settingValueLabel.text = [self getTimeByRow:indexPath.row];
            cell.settingSwitch.on = [[dic objectForKey:MONITOR_TIMER_ON_KEY] boolValue];
            BOOL weekendFlag = [[dic objectForKey:MONITOR_TIMER_WEEKEND_FLAG_KEY] boolValue];
            if (weekendFlag) {
                [cell.settingWeekLabel setText:@"仅周末"];
            }
            else
            {
                [cell.settingWeekLabel setText:@"周一到周五"];
            }
        }
        
        cell.delegate = self;
        return cell;
    }
}

- (NSString*)getDateByRow:(NSUInteger)index
{
    switch (index) {
        case 0:
        {
            NSString* dateStr = [HBAppConfig getInstance].openFundsVersion;
            NSDate* date = [NSDate dateWithTimeIntervalSince1970:[dateStr doubleValue]/1000];
            return [self getDateStringFromDate:date];
        }
        case 1:
        {
            NSString* dateStr = [HBAppConfig getInstance].closeFundsVersion;
            NSDate* date = [NSDate dateWithTimeIntervalSince1970:[dateStr doubleValue]/1000];
            return [self getDateStringFromDate:date];
        }
        case 2:
        {
            NSString* dateStr = [HBAppConfig getInstance].moneyFundsVersion;
            NSDate* date = [NSDate dateWithTimeIntervalSince1970:[dateStr doubleValue]/1000];
            return [self getDateStringFromDate:date];
        }
        case 3:
        {
            NSString* dateStr = [HBAppConfig getInstance].privateFundsVersion;
            NSDate* date = [NSDate dateWithTimeIntervalSince1970:[dateStr doubleValue]/1000];
            return [self getDateStringFromDate:date];
        }
        case 4:
            return [HBAppConfig getInstance].basicinfo;
        case 5:
        {
            NSString* description = nil;
            if ([HBAppConfig getInstance].isSendSmsOn) {
                description = @"关闭开关，则不发送告警短信";
            }
            else
            {
                description = @"打开开关，则会发送告警短信";
            }
            return description;
        }
        default:
            break;
    }
    return @"";
}

- (NSString*)getTimeByRow:(NSUInteger)index
{
    if (index < [self.timerArray count]) {
        NSDictionary* dic = [self.timerArray objectAtIndex:index];
        NSString* dateStr = [dic objectForKey:MONITOR_TIMER_RUN_TIME_KEY];
        NSDate* date = [NSDate dateWithTimeIntervalSince1970:[dateStr doubleValue]/1000];
        return [[self getDateStringFromDate:date] substringFromIndex:11];
    }
    
    return @"";
}

- (NSString*)getDateStringFromDate:(NSDate*)date
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:date];
    
    NSInteger year = [components year];
    NSInteger month = [components month];
    NSInteger day = [components day];
    NSInteger hour = [components hour];
    NSInteger minute = [components minute];
    NSInteger second = [components second];
    
    NSString* dateString = [NSString stringWithFormat:@"%4d-%02d-%02d %02d:%02d:%02d", year, month, day, hour, minute, second];
    return dateString;
}

 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
     if (indexPath.section == 1 && indexPath.row >= 3) {
         return YES;
     }
     
     return NO;
 }


 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
     if (editingStyle == UITableViewCellEditingStyleDelete) {
         NSMutableArray* tempArray = [NSMutableArray arrayWithArray:self.timerArray];
         [tempArray removeObjectAtIndex:indexPath.row];
         self.timerArray = tempArray;
         [HBAppConfig getInstance].monitorTimerArray = tempArray;
         [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
         
         [HBAppConfig getInstance].timerConfigChanged = YES;
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
    if (indexPath.section == 0) {
        if (indexPath.row == 5) {
            [self showUserPickerForRow:indexPath.row];
        }
        else
        {
            [self showDatePickerForRow:indexPath];
        }
    }
    else
    {
        [self showTimePickerForRow:indexPath];
    }
}

#pragma mark - local functions

- (void)showTimePickerForRow:(NSIndexPath*)indexPath
{
    if (self.isShowingUserPickerView) {
        [self dismissUserPicker];
        self.isShowingUserPickerView = NO;
    }
    
    self.currentIndexPath = indexPath;
    NSDictionary* dic = [self.timerArray objectAtIndex:indexPath.row];
    NSString* dateStr = [dic objectForKey:MONITOR_TIMER_RUN_TIME_KEY];
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[dateStr doubleValue]/1000];
    [self.pickerView setDate:date];
    self.pickerView.datePickerMode = UIDatePickerModeTime;
    [self.yearLabel setHidden:YES];
    
    if (!self.isShowingPickerView) {
        if (self.pickerViewParent.superview == nil)
        {
            [self.view.window addSubview:self.pickerViewParent];
        }
        
        CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
        CGSize pickerSize = [self.pickerViewParent sizeThatFits:CGSizeZero];
        CGRect startRect = CGRectMake(0.0, screenRect.origin.y + screenRect.size.height, pickerSize.width, pickerSize.height);
        self.pickerViewParent.frame = startRect;
        CGRect pickerRect = CGRectMake(0.0, screenRect.origin.y + screenRect.size.height - pickerSize.height, pickerSize.width, pickerSize.height);
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        [UIView setAnimationDelegate:self];
        self.pickerViewParent.frame = pickerRect;
        CGRect newFrame = self.view.frame;
        newFrame.size.height -= self.pickerViewParent.frame.size.height;
        self.view.frame = newFrame;
        [UIView commitAnimations];
    }
    
    self.isShowingPickerView = YES;
    
    NSIndexPath* toRow = [NSIndexPath indexPathForRow:self.currentIndexPath.row inSection:self.currentIndexPath.section];
    [self.tableView scrollToRowAtIndexPath:toRow atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    [self datePickerValueChanged:self.pickerView];
}

- (void)showDatePickerForRow:(NSIndexPath*)indexPath
{
    if (self.isShowingUserPickerView) {
        [self dismissUserPicker];
        self.isShowingUserPickerView = NO;
    }
    
    self.currentIndexPath = indexPath;
    switch (self.currentIndexPath.row) {
        case 0:
        {
            NSString* dateStr = [HBAppConfig getInstance].openFundsVersion;
            NSDate* date = [NSDate dateWithTimeIntervalSince1970:[dateStr doubleValue]/1000];
            [self.pickerView setDate:date];
            self.pickerView.datePickerMode = UIDatePickerModeDateAndTime;
            [self.yearLabel setHidden:NO];
        }
            break;
        case 1:
        {
            NSString* dateStr = [HBAppConfig getInstance].closeFundsVersion;
            NSDate* date = [NSDate dateWithTimeIntervalSince1970:[dateStr doubleValue]/1000];
            [self.pickerView setDate:date];
            self.pickerView.datePickerMode = UIDatePickerModeDateAndTime;
            [self.yearLabel setHidden:NO];
        }
            break;
        case 2:
        {
            NSString* dateStr = [HBAppConfig getInstance].moneyFundsVersion;
            NSDate* date = [NSDate dateWithTimeIntervalSince1970:[dateStr doubleValue]/1000];
            [self.pickerView setDate:date];
            self.pickerView.datePickerMode = UIDatePickerModeDateAndTime;
            [self.yearLabel setHidden:NO];
        }
            break;
        case 3:
        {
            NSString* dateStr = [HBAppConfig getInstance].privateFundsVersion;
            NSDate* date = [NSDate dateWithTimeIntervalSince1970:[dateStr doubleValue]/1000];
            [self.pickerView setDate:date];
            self.pickerView.datePickerMode = UIDatePickerModeDateAndTime;
            [self.yearLabel setHidden:NO];
        }
            break;
        case 4:
        {
            NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyyMMdd"];
            NSDate* date = [dateFormatter dateFromString:[HBAppConfig getInstance].basicinfo];
            [self.pickerView setDate:date];
            self.pickerView.datePickerMode = UIDatePickerModeDateAndTime;
            [self.yearLabel setHidden:NO];
        }
            break;
        default:
            break;
    }
    
    if (!self.isShowingPickerView) {
        if (self.pickerViewParent.superview == nil)
        {
            [self.view.window addSubview:self.pickerViewParent];
        }
        
        CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
        CGSize pickerSize = [self.pickerViewParent sizeThatFits:CGSizeZero];
        CGRect startRect = CGRectMake(0.0, screenRect.origin.y + screenRect.size.height, pickerSize.width, pickerSize.height);
        self.pickerViewParent.frame = startRect;
        CGRect pickerRect = CGRectMake(0.0, screenRect.origin.y + screenRect.size.height - pickerSize.height, pickerSize.width, pickerSize.height);
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        [UIView setAnimationDelegate:self];
        self.pickerViewParent.frame = pickerRect;
        CGRect newFrame = self.view.frame;
        newFrame.size.height -= self.pickerViewParent.frame.size.height;
        self.view.frame = newFrame;
        [UIView commitAnimations];
    }
    
    self.isShowingPickerView = YES;
    
    NSIndexPath* toRow = [NSIndexPath indexPathForRow:self.currentIndexPath.row inSection:self.currentIndexPath.section];
    [self.tableView scrollToRowAtIndexPath:toRow atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    [self datePickerValueChanged:self.pickerView];
}

- (void)showUserPickerForRow:(NSUInteger)index
{
    if (self.isShowingPickerView) {
        [self dismissDatePicker];
        self.isShowingPickerView = NO;
    }
    if (!self.isShowingUserPickerView) {
        if (self.userPickerViewParent.superview == nil)
        {
            [self.view.window addSubview:self.userPickerViewParent];
        }
        
        CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
        CGSize pickerSize = [self.userPickerViewParent sizeThatFits:CGSizeZero];
        CGRect startRect = CGRectMake(0.0, screenRect.origin.y + screenRect.size.height, pickerSize.width, pickerSize.height);
        self.userPickerViewParent.frame = startRect;
        CGRect pickerRect = CGRectMake(0.0, screenRect.origin.y + screenRect.size.height - pickerSize.height, pickerSize.width, pickerSize.height);
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        [UIView setAnimationDelegate:self];
        self.userPickerViewParent.frame = pickerRect;
        CGRect newFrame = self.view.frame;
        newFrame.size.height -= self.userPickerViewParent.frame.size.height;
        self.view.frame = newFrame;
        [UIView commitAnimations];
    }
    
    self.isShowingUserPickerView = YES;
    
    NSIndexPath* toRow = [NSIndexPath indexPathForRow:index inSection:0];
    [self.tableView scrollToRowAtIndexPath:toRow atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    [self datePickerValueChanged:self.pickerView];
}

- (void)dismissDatePicker
{
    CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
	CGRect endFrame = self.pickerViewParent.frame;
	endFrame.origin.y = screenRect.origin.y + screenRect.size.height;
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.3];
	[UIView setAnimationDelegate:self];
	self.pickerViewParent.frame = endFrame;
	[UIView commitAnimations];
	CGRect newFrame = self.view.frame;
	newFrame.size.height += self.pickerViewParent.frame.size.height;
	self.view.frame = newFrame;
    
    self.isShowingPickerView = NO;
}

- (void)dismissUserPicker
{
    CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
	CGRect endFrame = self.userPickerViewParent.frame;
	endFrame.origin.y = screenRect.origin.y + screenRect.size.height;
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.3];
	[UIView setAnimationDelegate:self];
	self.userPickerViewParent.frame = endFrame;
	[UIView commitAnimations];
	CGRect newFrame = self.view.frame;
	newFrame.size.height += self.userPickerViewParent.frame.size.height;
	self.view.frame = newFrame;
    
    self.isShowingUserPickerView = NO;
}

- (IBAction)datePickerOk:(id)sender
{
    [self dismissDatePicker];
    
    NSDate* settingDate = self.pickerView.date;
    NSString* dateStr = [NSString stringWithFormat:@"%.0f", [settingDate timeIntervalSince1970]*1000];
    
    if (self.currentIndexPath.section == 0) {
        switch (self.currentIndexPath.row) {
            case 0:
            {
                [HBAppConfig getInstance].openFundsVersion = dateStr;
            }
                break;
            case 1:
            {
                [HBAppConfig getInstance].closeFundsVersion = dateStr;
            }
                break;
            case 2:
            {
                [HBAppConfig getInstance].moneyFundsVersion = dateStr;
            }
                break;
            case 3:
            {
                [HBAppConfig getInstance].privateFundsVersion = dateStr;
            }
                break;
            case 4:
            {
                NSCalendar* calendar = [NSCalendar currentCalendar];
                NSDateComponents* components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:settingDate];
                
                NSInteger year = [components year];
                NSInteger month = [components month];
                NSInteger day = [components day];
                
                NSString* dateString = [NSString stringWithFormat:@"%04d%02d%02d", year, month, day];
                [HBAppConfig getInstance].basicinfo = dateString;
            }
                break;
            default:
                break;
        }
    }
    else
    {
        NSMutableArray* array = [NSMutableArray arrayWithArray:self.timerArray];
        NSMutableDictionary* dic = [NSMutableDictionary dictionaryWithDictionary:[array objectAtIndex:self.currentIndexPath.row]];
        [dic setObject:dateStr forKey:MONITOR_TIMER_RUN_TIME_KEY];
        [array replaceObjectAtIndex:self.currentIndexPath.row withObject:dic];
        
        self.timerArray = array;
        [HBAppConfig getInstance].monitorTimerArray = array;
        
        [HBAppConfig getInstance].timerConfigChanged = YES;
    }
    
    [self.tableView reloadData];
}

- (IBAction)datePickerCancel:(id)sender
{
    [self dismissDatePicker];
}

- (IBAction)datePickerNow:(id)sender
{
    [self.pickerView setDate:[NSDate date]];
    
    [self datePickerValueChanged:self.pickerView];
}

- (IBAction)datePickerValueChanged:(id)sender
{
    NSDate* dateNow = self.pickerView.date;
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:dateNow];
    
    NSInteger year = [components year];
    NSString* yearString = [NSString stringWithFormat:@"%d年", year];
    [self.yearLabel setText:yearString];
}

- (IBAction)userPickerViewOk:(id)sender
{
    [self dismissUserPicker];
}

- (IBAction)userPickerViewCancel:(id)sender
{
    [self dismissUserPicker];
}

#pragma mark - HBSettingDateCellDelegate functions

- (void)settingSwitchValueChanged:(BOOL)on atIndex:(NSIndexPath*)indexPath
{
    if (indexPath.section == 0) {
        [HBAppConfig getInstance].isSendSmsOn = on;
    }
    else
    {
        NSMutableArray* array = [NSMutableArray arrayWithArray:self.timerArray];
        NSMutableDictionary* dic = [NSMutableDictionary dictionaryWithDictionary:[array objectAtIndex:indexPath.row]];
        [dic setObject:[NSNumber numberWithBool:on] forKey:MONITOR_TIMER_ON_KEY];
        [array replaceObjectAtIndex:indexPath.row withObject:dic];
        
        self.timerArray = array;
        [HBAppConfig getInstance].monitorTimerArray = array;
        
        [HBAppConfig getInstance].timerConfigChanged = YES;
    }
    
    [self.tableView reloadData];
}

#pragma mark -
#pragma mark ALPickerView delegate methods

- (NSInteger)numberOfRowsForPickerView:(ALPickerView *)pickerView {
	return [self.usersArray count];
}

- (NSString *)pickerView:(ALPickerView *)pickerView textForRow:(NSInteger)row {
    NSDictionary* item = [self.usersArray objectAtIndex:row];
	return [item objectForKey:MONITOR_USER_NAME_KEY];
}

- (BOOL)pickerView:(ALPickerView *)pickerView selectionStateForRow:(NSInteger)row {
	NSDictionary* item = [self.usersArray objectAtIndex:row];
    return [[item objectForKey:MONITOR_USER_SENDFLAG_KEY] boolValue];
}

- (void)pickerView:(ALPickerView *)pickerView didCheckRow:(NSInteger)row {
	// Check whether all rows are checked or only one
	if (row == -1)
    {
        NSMutableArray* array = [NSMutableArray arrayWithCapacity:[self.usersArray count]];
        for (NSDictionary* item  in self.usersArray)
        {
            NSMutableDictionary* dic = [NSMutableDictionary dictionaryWithDictionary:item];
            [dic setObject:[NSNumber numberWithBool:YES] forKey:MONITOR_USER_SENDFLAG_KEY];
            [array addObject:dic];
        }
        self.usersArray = array;
        [HBAppConfig getInstance].monitorUserArray = array;
    }
	else
    {
        NSMutableArray* mArray = [NSMutableArray arrayWithArray:self.usersArray];
        NSMutableDictionary* dic = [NSMutableDictionary dictionaryWithDictionary:[mArray objectAtIndex:row]];
        [dic setObject:[NSNumber numberWithBool:YES] forKey:MONITOR_USER_SENDFLAG_KEY];
        [mArray replaceObjectAtIndex:row withObject:dic];
        
        self.usersArray = mArray;
        [HBAppConfig getInstance].monitorUserArray = mArray;
    }
}

- (void)pickerView:(ALPickerView *)pickerView didUncheckRow:(NSInteger)row {
	// Check whether all rows are unchecked or only one
    if (row == -1)
    {
        NSMutableArray* array = [NSMutableArray arrayWithCapacity:[self.usersArray count]];
        for (NSDictionary* item  in self.usersArray)
        {
            NSMutableDictionary* dic = [NSMutableDictionary dictionaryWithDictionary:item];
            [dic setObject:[NSNumber numberWithBool:NO] forKey:MONITOR_USER_SENDFLAG_KEY];
            [array addObject:dic];
        }
        self.usersArray = array;
        [HBAppConfig getInstance].monitorUserArray = array;
    }
	else
    {
        NSMutableArray* mArray = [NSMutableArray arrayWithArray:self.usersArray];
        NSMutableDictionary* dic = [NSMutableDictionary dictionaryWithDictionary:[mArray objectAtIndex:row]];
        [dic setObject:[NSNumber numberWithBool:NO] forKey:MONITOR_USER_SENDFLAG_KEY];
        [mArray replaceObjectAtIndex:row withObject:dic];
        
        self.usersArray = mArray;
        [HBAppConfig getInstance].monitorUserArray = mArray;
    }
}
@end

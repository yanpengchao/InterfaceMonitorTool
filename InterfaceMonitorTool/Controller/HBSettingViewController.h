//
//  HBSettingViewController.h
//  InterfaceMonitorTool
//
//  Created by pengchao.yan on 13-4-10.
//  Copyright (c) 2013年 pengchao.yan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBSettingDateCell.h"
#import "HBSettingTimerCell.h"
#import "ALPickerView.h"

@interface HBSettingViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, HBSettingDateCellDelegate, ALPickerViewDelegate>
{
    //
}

@property (nonatomic, strong)IBOutlet UITableView* tableView;
@property (nonatomic, strong)NSArray* settingArray;
@property (nonatomic, strong)NSArray* timerArray;

@property (nonatomic, strong)NSArray* usersArray;

@property (nonatomic, strong)IBOutlet UIView* pickerViewParent;
@property (nonatomic, strong)IBOutlet UIDatePicker* pickerView;
@property (nonatomic, strong)IBOutlet UILabel* yearLabel;

@property (nonatomic, strong)IBOutlet UIView* userPickerViewParent;
@property (nonatomic, strong)ALPickerView* userPickerView;

@property (nonatomic, strong)UIButton* addWorkDayMonitorTimerBt;
@property (nonatomic, strong)UIButton* addWeekendMonitorTimerBt;

@property (nonatomic)BOOL isShowingPickerView;
@property (nonatomic)BOOL isShowingUserPickerView;
@property (nonatomic, strong)NSIndexPath* currentIndexPath;

- (IBAction)datePickerOk:(id)sender;
- (IBAction)datePickerCancel:(id)sender;
- (IBAction)datePickerNow:(id)sender;
- (IBAction)datePickerValueChanged:(id)sender;

- (IBAction)userPickerViewOk:(id)sender;
- (IBAction)userPickerViewCancel:(id)sender;
@end

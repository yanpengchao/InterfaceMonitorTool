//
//  HBSettingTimerCell.h
//  InterfaceMonitorTool
//
//  Created by pengchao.yan on 13-4-23.
//  Copyright (c) 2013年 pengchao.yan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBSettingDateCell.h"

@interface HBSettingTimerCell : UITableViewCell

@property (nonatomic, strong)IBOutlet UILabel* settingKeyLabel;
@property (nonatomic, strong)IBOutlet UILabel* settingWeekLabel;
@property (nonatomic, strong)IBOutlet UILabel* settingValueLabel;
@property (nonatomic, strong)IBOutlet UISwitch* settingSwitch;
@property (nonatomic)id<HBSettingDateCellDelegate> delegate;

- (IBAction)valueChanged:(id)sender;

+ (HBSettingTimerCell*)createSettingTimerCell;

@end

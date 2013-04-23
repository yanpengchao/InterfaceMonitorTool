//
//  HBSettingDateCell.h
//  InterfaceMonitorTool
//
//  Created by pengchao.yan on 13-4-10.
//  Copyright (c) 2013年 pengchao.yan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HBSettingDateCellDelegate <NSObject>

- (void)settingSwitchValueChanged:(BOOL)on atIndex:(NSIndexPath*)indexPath;

@end

@interface HBSettingDateCell : UITableViewCell

@property (nonatomic, strong)IBOutlet UILabel* settingKeyLabel;
@property (nonatomic, strong)IBOutlet UILabel* settingWeekLabel;
@property (nonatomic, strong)IBOutlet UILabel* settingValueLabel;
@property (nonatomic, strong)IBOutlet UISwitch* settingSwitch;
@property (nonatomic)id<HBSettingDateCellDelegate> delegate;

- (IBAction)valueChanged:(id)sender;

+ (HBSettingDateCell*)createSettingDateCell;

@end

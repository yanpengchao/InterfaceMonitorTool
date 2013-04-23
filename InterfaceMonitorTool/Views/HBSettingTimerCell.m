//
//  HBSettingTimerCell.m
//  InterfaceMonitorTool
//
//  Created by pengchao.yan on 13-4-23.
//  Copyright (c) 2013年 pengchao.yan. All rights reserved.
//

#import "HBSettingTimerCell.h"

@implementation HBSettingTimerCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (HBSettingTimerCell*)createSettingTimerCell
{
    HBSettingTimerCell* headerView = nil;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        headerView = [[[NSBundle mainBundle] loadNibNamed:@"HBSettingTimerCell_iPhone" owner:self options:nil] lastObject];
    }
    else
    {
        headerView = [[[NSBundle mainBundle] loadNibNamed:@"HBSettingTimerCell_iPad" owner:self options:nil] lastObject];
    }
    
    return headerView;
}

- (IBAction)valueChanged:(id)sender
{
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(settingSwitchValueChanged:atIndex:)]) {
        UITableView* tableView = (UITableView*)self.superview;
        if (tableView != nil) {
            NSIndexPath* indexPath = [tableView indexPathForCell:self];
            UISwitch* switchView = (UISwitch*)sender;
            [self.delegate settingSwitchValueChanged:switchView.on atIndex:indexPath];
        }
    }
}
@end

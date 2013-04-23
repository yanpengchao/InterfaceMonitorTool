//
//  HBSettingDateCell.m
//  InterfaceMonitorTool
//
//  Created by pengchao.yan on 13-4-10.
//  Copyright (c) 2013年 pengchao.yan. All rights reserved.
//

#import "HBSettingDateCell.h"

@implementation HBSettingDateCell

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

+ (HBSettingDateCell*)createSettingDateCell
{
    HBSettingDateCell* headerView = nil;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        headerView = [[[NSBundle mainBundle] loadNibNamed:@"HBSettingDateCell_iPhone" owner:self options:nil] lastObject];
    }
    else
    {
        headerView = [[[NSBundle mainBundle] loadNibNamed:@"HBSettingDateCell_iPad" owner:self options:nil] lastObject];
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

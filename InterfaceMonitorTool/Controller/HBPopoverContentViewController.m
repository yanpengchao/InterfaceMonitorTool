//
//  HBPopoverContentViewController.m
//  TrustCollection
//
//  Created by pengchao.yan on 13-1-21.
//  Copyright (c) 2013年 pengchao.yan. All rights reserved.
//

#import "HBPopoverContentViewController.h"
#import "HBMultiSelelctCell.h"
#import <QuartzCore/QuartzCore.h>

#pragma mark - HBMultiSelectItem implementation
@implementation HBMultiSelectItem

//

@end

#pragma mark - HBPopoverContentViewController implementation

@interface HBPopoverContentViewController ()

@end

@implementation HBPopoverContentViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)cancelButtonClicked
{
    if ([self.delegate respondsToSelector:@selector(cancelButtonClicked)]) {
        [self.delegate cancelButtonClicked];
    }
}

- (void)okButtonClicked
{
    if ([self.delegate respondsToSelector:@selector(okButtonClicked)]) {
        [self.delegate okButtonClicked];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.allowsSelectionDuringEditing = YES;
    [self setEditing:YES animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) setEditing:(BOOL)editting animated:(BOOL)animated
{	
	[super setEditing:editting animated:YES];
    [self.tableView performSelector:@selector(reloadData) withObject:nil afterDelay:0.3];
}

#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return UITableViewCellEditingStyleNone;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    HBMultiSelelctCell *cell = (HBMultiSelelctCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[HBMultiSelelctCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
		cell.textLabel.font = [cell.textLabel.font fontWithSize:17];
    }
	
	cell.accessoryType = UITableViewCellAccessoryNone;
	cell.textLabel.textColor = [UIColor blackColor];
	
    HBMultiSelectItem* item = [self.items objectAtIndex:indexPath.row];
    
	cell.textLabel.text = item.title;
	[cell setChecked:item.isSelected];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HBMultiSelectItem* item = [self.items objectAtIndex:indexPath.row];
	
	if (self.editing)
	{
		HBMultiSelelctCell *cell = (HBMultiSelelctCell*)[tableView cellForRowAtIndexPath:indexPath];
        item.isSelected = !item.isSelected;
        
		[cell setChecked:item.isSelected];
	}
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - FPPopoverControllerSource functions

- (UIView*)myTitleView
{
    if (self.titleView == nil) {
        self.titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 13, 260, 44)];
        [self.titleView setBackgroundColor:[UIColor clearColor]];
        
        UIButton* cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(24, 4, 94, 36)];
        [cancelButton.layer setMasksToBounds:YES];
        [cancelButton.layer setCornerRadius:5.0];   //设置矩形四个圆角半径
        [cancelButton.layer setBorderWidth:2.0];    //边框宽度
        [cancelButton setBackgroundColor:[UIColor grayColor]];
        [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [cancelButton addTarget:self action:@selector(cancelButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.titleView addSubview:cancelButton];
        
        UIButton* okButton = [[UIButton alloc] initWithFrame:CGRectMake(24*2+94, 4, 94, 36)];
        [okButton.layer setMasksToBounds:YES];
        [okButton.layer setCornerRadius:5.0];   //设置矩形四个圆角半径
        [okButton.layer setBorderWidth:2.0];    //边框宽度
        [okButton setBackgroundColor:[UIColor grayColor]];
        [okButton setTitle:@"检测" forState:UIControlStateNormal];
        [okButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [okButton addTarget:self action:@selector(okButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.titleView addSubview:okButton];
    }
    
    return self.titleView;
}

@end

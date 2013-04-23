//
//  HBPopoverContentViewController.h
//  TrustCollection
//
//  Created by pengchao.yan on 13-1-21.
//  Copyright (c) 2013年 pengchao.yan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FPPopoverController.h"

@interface HBMultiSelectItem : NSObject
@property (nonatomic, strong)NSString* title;
@property (nonatomic)BOOL isSelected;
@end

@protocol HBPopoverContentViewControllerDelegate <NSObject>

@optional
- (void)cancelButtonClicked;
- (void)okButtonClicked;

@end

@interface HBPopoverContentViewController : UITableViewController <FPPopoverControllerSource>
{
    //
}

@property (nonatomic)id<HBPopoverContentViewControllerDelegate> delegate;
@property (nonatomic, strong)UIView* titleView;
@property (nonatomic, strong)NSArray* items;
@end

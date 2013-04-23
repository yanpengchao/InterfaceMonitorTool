//
//  HBMultiSelelctCell.h
//  TrustCollection
//
//  Created by pengchao.yan on 13-1-21.
//  Copyright (c) 2013年 pengchao.yan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HBMultiSelelctCell : UITableViewCell
{
    UIImageView*	m_checkImageView;
	BOOL			m_checked;
}

- (void) setChecked:(BOOL)checked;
@end

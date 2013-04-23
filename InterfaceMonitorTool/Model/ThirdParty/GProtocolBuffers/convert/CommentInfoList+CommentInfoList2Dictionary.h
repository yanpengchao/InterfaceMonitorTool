//
//  CommentInfoList+CommentInfoList2Dictionary.h
//  HowbuyFund
//
//  Created by yan pengchao on 12-5-29.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "CommentInfoList.pb.h"

@interface CommentInfoList (CommentInfoList2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic;

@end

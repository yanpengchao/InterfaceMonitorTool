//
//  CommentInfo+CommentInfo2Dictionary.m
//  HowbuyFund
//
//  Created by yan pengchao on 12-5-29.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "CommentInfo+CommentInfo2Dictionary.h"

@implementation CommentInfo (CommentInfo2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasUserName]) {
        [dic setObject:userName forKey:@"userName"];
    }
    
    if ([self hasComments]) {
        [dic setObject:comments forKey:@"comments"];
    }
    
    if ([self hasPostTime]) {
        [dic setObject:postTime forKey:@"postTime"];
    }
    
    if ([self hasCommentId]) {
        [dic setObject:commentId forKey:@"commentId"];
    }
    
    if ([self hasRefComments]) {
        [dic setObject:refComments forKey:@"refComments"];
    }
    
    if ([self hasRefUserName]) {
        [dic setObject:refUserName forKey:@"refUserName"];
    }
    return dic;
}

@end

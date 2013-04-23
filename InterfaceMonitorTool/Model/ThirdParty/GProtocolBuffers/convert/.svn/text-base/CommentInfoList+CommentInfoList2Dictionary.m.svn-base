//
//  CommentInfoList+CommentInfoList2Dictionary.m
//  HowbuyFund
//
//  Created by yan pengchao on 12-5-29.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "CommentInfoList+CommentInfoList2Dictionary.h"
#import "Common+Common2Dictionary.h"
#import "CommentInfo+CommentInfo2Dictionary.h"

@implementation CommentInfoList (CommentInfoList2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasTotalNum]) 
    {
        NSNumber* number = [[NSNumber alloc]initWithInt:totalNum];
        [dic setObject:number forKey:@"totalNum"];
        [number release];
    }
    
    if ([self hasCommon]) 
    {
        [common dictionary:dic];
    }
    
    NSMutableArray* commentInfoArray = [[NSMutableArray alloc]init];
    for (CommentInfo* commentInfoItem in mutableCommentInfoList) 
    {
        NSMutableDictionary* subDic = [[NSMutableDictionary alloc]init];
        [commentInfoItem dictionary:subDic];
        [commentInfoArray addObject:subDic];
        [subDic release];
    }
    [dic setObject:commentInfoArray forKey:@"commentInfoList"];
    [commentInfoArray release];
    
    return dic;
}

@end

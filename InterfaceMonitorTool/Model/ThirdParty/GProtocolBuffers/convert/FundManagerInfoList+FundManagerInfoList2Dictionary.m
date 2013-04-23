//
//  FundManagerInfoList+FundManagerInfoList2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-23.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "FundManagerInfoList+FundManagerInfoList2Dictionary.h"
#import "Common+Common2Dictionary.h"
#import "FundManagerInfo+FundManagerInfo2Dictionary.h"

@implementation FundManagerInfoList (FundManagerInfoList2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasNewestManagerInfoVer]) 
    {
        [dic setObject:newestManagerInfoVer forKey:@"newestManagerInfoVer"];
    }
    
    if ([self hasCommon]) 
    {
        [common dictionary:dic];
    }
    
    NSMutableArray* fundManagerInfoArray = [[NSMutableArray alloc]init];
    for (FundManagerInfo* fundManagerInfoItem in mutableFundManagerInfoList) 
    {
        NSMutableDictionary* subDic = [[NSMutableDictionary alloc]init];
        [fundManagerInfoItem dictionary:subDic];
        [fundManagerInfoArray addObject:subDic];
        [subDic release];
    }
    [dic setObject:fundManagerInfoArray forKey:@"fundManagerInfoList"];
    [fundManagerInfoArray release];
    
    return dic;
}

@end

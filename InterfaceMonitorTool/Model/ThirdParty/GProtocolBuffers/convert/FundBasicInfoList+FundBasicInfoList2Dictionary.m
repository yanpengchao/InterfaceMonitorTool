//
//  FundBasicInfoList+FundBasicInfoList2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-23.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "FundBasicInfoList+FundBasicInfoList2Dictionary.h"
#import "Common+Common2Dictionary.h"
#import "FundBasic+FundBasic2Dictionary.h"

@implementation FundBasicInfoList (FundBasicInfoList2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasNewestFundInfoVer]) 
    {
        [dic setObject:newestFundInfoVer forKey:@"newestFundInfoVer"];
    }
    
    if ([self hasCommon]) 
    {
        [common dictionary:dic];
    }
    
    NSMutableArray* fundBasicArray = [[NSMutableArray alloc]init];
    for (FundBasic* fundBasicItem in mutableFundBasicList) 
    {
        NSMutableDictionary* subDic = [[NSMutableDictionary alloc]init];
        [fundBasicItem dictionary:subDic];
        [fundBasicArray addObject:subDic];
        [subDic release];
    }
    [dic setObject:fundBasicArray forKey:@"fundBasicList"];
    [fundBasicArray release];
    
    return dic;
}

@end

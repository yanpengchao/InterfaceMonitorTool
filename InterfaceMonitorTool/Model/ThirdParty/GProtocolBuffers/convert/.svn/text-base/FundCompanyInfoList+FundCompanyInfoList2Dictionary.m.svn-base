//
//  FundCompanyInfoList+FundCompanyInfoList2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-23.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "FundCompanyInfoList+FundCompanyInfoList2Dictionary.h"
#import "Common+Common2Dictionary.h"
#import "FundCompanyInfo+FundCompanyInfo2Dictionary.h"

@implementation FundCompanyInfoList (FundCompanyInfoList2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasNewestCompanyInfoVer]) 
    {
        [dic setObject:newestCompanyInfoVer forKey:@"newestCompanyInfoVer"];
    }
    
    if ([self hasCommon]) 
    {
        [common dictionary:dic];
    }
    
    NSMutableArray* fundCompanyInfoArray = [[NSMutableArray alloc]init];
    for (FundCompanyInfo* fundCompanyInfoItem in mutableFundCompanyInfoList) 
    {
        NSMutableDictionary* subDic = [[NSMutableDictionary alloc]init];
        [fundCompanyInfoItem dictionary:subDic];
        [fundCompanyInfoArray addObject:subDic];
        [subDic release];
    }
    [dic setObject:fundCompanyInfoArray forKey:@"fundCompanyInfoList"];
    [fundCompanyInfoArray release];
    
    return dic;
}

@end

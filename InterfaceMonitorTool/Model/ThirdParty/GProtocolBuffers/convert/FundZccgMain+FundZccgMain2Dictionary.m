//
//  FundZccgMain+FundZccgMain2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-23.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "FundZccgMain+FundZccgMain2Dictionary.h"
#import "Common+Common2Dictionary.h"
#import "FundZccgInfo+FundZccgInfo2Dictionary.h"

@implementation FundZccgMain (FundZccgMain2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasTotalNum]) 
    {
        NSNumber* number = [[NSNumber alloc]initWithLongLong:totalNum];
        [dic setObject:number forKey:@"totalNum"];
        [number release];
    }
    
    if ([self hasCommon]) 
    {
        [common dictionary:dic];
    }
    
    NSMutableArray* fundZccgInfoArray = [[NSMutableArray alloc]init];
    for (FundZccgInfo* fundZccgInfoItem in mutableFundZccgInfoList) 
    {
        NSMutableDictionary* subDic = [[NSMutableDictionary alloc]init];
        [fundZccgInfoItem dictionary:subDic];
        [fundZccgInfoArray addObject:subDic];
        [subDic release];
    }
    [dic setObject:fundZccgInfoArray forKey:@"fundZccgInfoList"];
    [fundZccgInfoArray release];
    
    return dic;
}

@end

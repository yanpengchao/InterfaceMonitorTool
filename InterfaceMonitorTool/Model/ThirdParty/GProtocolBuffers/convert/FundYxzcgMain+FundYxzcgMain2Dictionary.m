//
//  FundYxzcgMain+FundYxzcgMain2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-23.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "FundYxzcgMain+FundYxzcgMain2Dictionary.h"
#import "Common+Common2Dictionary.h"
#import "FundHiddenStockInfoProb+FundHiddenStockInfoProb2Dictionary.h"

@implementation FundYxzcgMain (FundYxzcgMain2Dictionary)

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
    
    NSMutableArray* fundHiddenStockInfoProbArray = [[NSMutableArray alloc]init];
    for (FundHiddenStockInfoProb* fundHiddenStockInfoProbItem in mutableFundHiddenStockInfoProbList) 
    {
        NSMutableDictionary* subDic = [[NSMutableDictionary alloc]init];
        [fundHiddenStockInfoProbItem dictionary:subDic];
        [fundHiddenStockInfoProbArray addObject:subDic];
        [subDic release];
    }
    [dic setObject:fundHiddenStockInfoProbArray forKey:@"fundHiddenStockInfoProbList"];
    [fundHiddenStockInfoProbArray release];
    
    return dic;
}

@end

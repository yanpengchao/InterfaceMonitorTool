//
//  FundInfoMoneys+FundInfoMoneys2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-22.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "FundInfoMoneys+FundInfoMoneys2Dictionary.h"
#import "Common+Common2Dictionary.h"
#import "Moneys+Moneys2Dictionary.h"

@implementation FundInfoMoneys (FundInfoMoneys2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasCommon]) {
        [common dictionary:dic];
    }
    
    if ([self hasServerTime]) 
    {
        NSNumber* number = [[NSNumber alloc]initWithLongLong:serverTime];
        [dic setObject:number forKey:@"serverTime"];
        [number release];
    }
    
    if ([self hasDateVersion]) 
    {
        NSNumber* number = [[NSNumber alloc]initWithLongLong:dateVersion];
        [dic setObject:number forKey:@"dateVersion"];
        [number release];
    }
    
    NSMutableArray* moneyArray = [[NSMutableArray alloc]init];
    for (Moneys* moneyItem in mutableMoneysList) 
    {
        NSMutableDictionary* subDic = [[NSMutableDictionary alloc]init];
        [moneyItem dictionary:subDic];
        [moneyArray addObject:subDic];
        [subDic release];
    }
    [dic setObject:moneyArray forKey:@"moneyList"];
    [moneyArray release];
    
    return dic;
}

@end

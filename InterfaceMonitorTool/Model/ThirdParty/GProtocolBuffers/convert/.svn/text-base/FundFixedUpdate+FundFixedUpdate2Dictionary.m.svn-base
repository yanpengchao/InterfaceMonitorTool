//
//  FundFixedUpdate+FundFixedUpdate2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-23.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "FundFixedUpdate+FundFixedUpdate2Dictionary.h"
#import "Common+Common2Dictionary.h"
#import "Fundfixed+Fundfixed2Dictionary.h"

@implementation FundFixedUpdate (FundFixedUpdate2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasSumPage]) 
    {
        NSNumber* number = [[NSNumber alloc]initWithLongLong:sumPage];
        [dic setObject:number forKey:@"sumPage"];
        [number release];
    }
    
    if ([self hasCommon]) 
    {
        [common dictionary:dic];
    }
    
    NSMutableArray* fundfixedArray = [[NSMutableArray alloc]init];
    for (Fundfixed* fundfixedItem in mutableFundfixedList) 
    {
        NSMutableDictionary* subDic = [[NSMutableDictionary alloc]init];
        [fundfixedItem dictionary:subDic];
        [fundfixedArray addObject:subDic];
        [subDic release];
    }
    [dic setObject:fundfixedArray forKey:@"fundfixedList"];
    [fundfixedArray release];
    
    return dic;
}

@end

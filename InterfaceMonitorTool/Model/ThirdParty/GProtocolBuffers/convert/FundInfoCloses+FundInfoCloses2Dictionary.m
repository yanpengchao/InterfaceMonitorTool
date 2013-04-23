//
//  FundInfoCloses+FundInfoCloses2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-22.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "FundInfoCloses+FundInfoCloses2Dictionary.h"
#import "Common+Common2Dictionary.h"
#import "Closes+Closes2Dictionary.h"

@implementation FundInfoCloses (FundInfoCloses2Dictionary)

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
    
    NSMutableArray* closeArray = [[NSMutableArray alloc]init];
    for (Closes* closeItem in mutableClosesList) 
    {
        NSMutableDictionary* subDic = [[NSMutableDictionary alloc]init];
        [closeItem dictionary:subDic];
        [closeArray addObject:subDic];
        [subDic release];
    }
    [dic setObject:closeArray forKey:@"closeList"];
    [closeArray release];
    
    return dic;
}

@end

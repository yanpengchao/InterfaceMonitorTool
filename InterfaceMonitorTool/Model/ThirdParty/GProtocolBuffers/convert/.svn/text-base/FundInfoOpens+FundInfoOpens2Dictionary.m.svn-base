//
//  FundInfoOpens+FundInfoOpens2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-21.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "FundInfoOpens+FundInfoOpens2Dictionary.h"
#import "Common+Common2Dictionary.h"
#import "Opens+Opens2Dictionary.h"

@implementation FundInfoOpens (FundInfoOpens2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
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
    
    if ([self hasCommon]) 
    {
        [common dictionary:dic];
    }
    
    NSMutableArray* openArray = [[NSMutableArray alloc]init];
    for (Opens* openItem in mutableOpensList) 
    {
        NSMutableDictionary* subDic = [[NSMutableDictionary alloc]init];
        [openItem dictionary:subDic];
        [openArray addObject:subDic];
        [subDic release];
    }
    [dic setObject:openArray forKey:@"openList"];
    [openArray release];
    
    return dic;
}

@end

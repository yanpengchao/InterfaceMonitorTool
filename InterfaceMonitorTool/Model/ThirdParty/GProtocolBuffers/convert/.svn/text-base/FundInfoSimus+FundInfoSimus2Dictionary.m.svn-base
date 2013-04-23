//
//  FundInfoSimus+FundInfoSimus2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-22.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "FundInfoSimus+FundInfoSimus2Dictionary.h"
#import "Common+Common2Dictionary.h"
#import "Simus+Simus2Dictionary.h"

@implementation FundInfoSimus (FundInfoSimus2Dictionary)

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
    
    NSMutableArray* simusArray = [[NSMutableArray alloc]init];
    for (Simus* simusItem in mutableSimusList) 
    {
        NSMutableDictionary* subDic = [[NSMutableDictionary alloc]init];
        [simusItem dictionary:subDic];
        [simusArray addObject:subDic];
        [subDic release];
    }
    [dic setObject:simusArray forKey:@"simusList"];
    [simusArray release];
    
    return dic;
}

@end

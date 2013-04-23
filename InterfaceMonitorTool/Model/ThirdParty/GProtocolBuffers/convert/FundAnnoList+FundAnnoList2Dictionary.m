//
//  FundAnnoList+FundAnnoList2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-23.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "FundAnnoList+FundAnnoList2Dictionary.h"
#import "Common+Common2Dictionary.h"
#import "FundAnno+FundAnno2Dictionary.h"

@implementation FundAnnoList (FundAnnoList2Dictionary)

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
    
    NSMutableArray* fndAnnoArray = [[NSMutableArray alloc]init];
    for (FundAnno* fndAnnoItem in mutableFndAnnoList) 
    {
        NSMutableDictionary* subDic = [[NSMutableDictionary alloc]init];
        [fndAnnoItem dictionary:subDic];
        [fndAnnoArray addObject:subDic];
        [subDic release];
    }
    [dic setObject:fndAnnoArray forKey:@"fndAnnoList"];
    [fndAnnoArray release];
    
    return dic;
}

@end

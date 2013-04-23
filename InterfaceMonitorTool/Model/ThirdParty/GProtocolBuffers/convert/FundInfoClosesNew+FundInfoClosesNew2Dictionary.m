//
//  FundInfoClosesNew+FundInfoClosesNew2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-3-9.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "FundInfoClosesNew+FundInfoClosesNew2Dictionary.h"
#import "Common+Common2Dictionary.h"
#import "ClosesNew+ClosesNew2Dictionary.h"

@implementation FundInfoClosesNew (FundInfoClosesNew2Dictionary)

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
    for (ClosesNew* closeItem in mutableClosesNewList) 
    {
        NSMutableDictionary* subDic = [[NSMutableDictionary alloc]init];
        [closeItem dictionary:subDic];
        [closeArray addObject:subDic];
        [subDic release];
    }
    [dic setObject:closeArray forKey:@"closesNewList"];
    [closeArray release];
    
    return dic;
}

@end

//
//  TrustInfoPageList+TrustInfoPageList2Dictionary.m
//  HowbuyFund
//
//  Created by yan pengchao on 12-8-1.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "TrustInfoPageList+TrustInfoPageList2Dictionary.h"
#import "Common+Common2Dictionary.h"
#import "TrustInfo+TrustInfo2Dictionary.h"

@implementation TrustInfoPageList (TrustInfoPageList2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }

    if ([self hasCommon]) 
    {
        [common dictionary:dic];
    }
    
    if ([self hasTotalNum]) 
    {
        NSNumber* number = [[NSNumber alloc]initWithInt:totalNum];
        [dic setObject:number forKey:@"totalNum"];
        [number release];
    }

    NSMutableArray* trustInfoArray = [[NSMutableArray alloc]init];
    for (TrustInfo* trustInfoItem in mutableTrustInfoList) 
    {
        NSMutableDictionary* subDic = [[NSMutableDictionary alloc]init];
        [trustInfoItem dictionary:subDic];
        [trustInfoArray addObject:subDic];
        [subDic release];
    }
    [dic setObject:trustInfoArray forKey:@"trustInfoList"];
    [trustInfoArray release];

    return dic;
}
@end

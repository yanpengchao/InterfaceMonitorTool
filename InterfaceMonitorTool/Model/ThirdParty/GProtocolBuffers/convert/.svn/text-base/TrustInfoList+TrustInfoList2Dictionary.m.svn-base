//
//  TrustInfoList+TrustInfoList2Dictionary.m
//  HowbuyFund
//
//  Created by yan pengchao on 12-6-7.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "TrustInfoList+TrustInfoList2Dictionary.h"
#import "Common+Common2Dictionary.h"
#import "TrustInfo+TrustInfo2Dictionary.h"

@implementation TrustInfoList (TrustInfoList2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasCommon]) 
    {
        [common dictionary:dic];
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

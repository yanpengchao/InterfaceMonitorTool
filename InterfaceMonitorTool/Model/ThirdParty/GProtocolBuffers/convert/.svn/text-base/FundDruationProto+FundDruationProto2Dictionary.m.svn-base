//
//  FundDruationProto+FundDruationProto2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-23.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "FundDruationProto+FundDruationProto2Dictionary.h"
#import "Common+Common2Dictionary.h"
#import "FundDruation+FundDruation2Dictionary.h"

@implementation FundDruationProto (FundDruationProto2Dictionary)


-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasCommon]) 
    {
        [common dictionary:dic];
    }
    
    NSMutableArray* fundDruationArray = [[NSMutableArray alloc]init];
    for (FundDruation* fundDruationItem in mutableFundDruationList) 
    {
        NSMutableDictionary* subDic = [[NSMutableDictionary alloc]init];
        [fundDruationItem dictionary:subDic];
        [fundDruationArray addObject:subDic];
        [subDic release];
    }
    [dic setObject:fundDruationArray forKey:@"fundDruationList"];
    [fundDruationArray release];
    
    return dic;
}

@end

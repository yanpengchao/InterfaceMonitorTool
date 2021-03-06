//
//  FundDruation+FundDruation2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-23.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "FundDruation+FundDruation2Dictionary.h"
#import "FundDruationInfo+FundDruationInfo2Dictionary.h"

@implementation FundDruation (FundDruation2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasJjdm]) 
    {
        [dic setObject:jjdm forKey:@"jjdm"];
    }
    
    if ([self hasJyzt]) {
        [dic setObject:jyzt forKey:@"jyzt"];
    }
    
    NSMutableArray* fundDruationInfoArray = [[NSMutableArray alloc]init];
    for (FundDruationInfo* fundDruationInfoItem in mutableFundDruationInfoList) 
    {
        NSMutableDictionary* subDic = [[NSMutableDictionary alloc]init];
        [fundDruationInfoItem dictionary:subDic];
        [fundDruationInfoArray addObject:subDic];
        [subDic release];
    }
    [dic setObject:fundDruationInfoArray forKey:@"fundDruationInfoList"];
    [fundDruationInfoArray release];
    
    return dic;
}

@end

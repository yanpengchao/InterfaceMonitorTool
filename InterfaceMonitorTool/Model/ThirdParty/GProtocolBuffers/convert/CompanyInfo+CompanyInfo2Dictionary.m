//
//  CompanyInfo+CompanyInfo2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-22.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "CompanyInfo+CompanyInfo2Dictionary.h"
#import "Common+Common2Dictionary.h"
#import "FundInfo+FundInfo2Dictionary.h"
#import "Opinion+Opinion2Dictionary.h"

@implementation CompanyInfo (CompanyInfo2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasJjsl]) 
    {
        NSNumber* number = [[NSNumber alloc]initWithLongLong:jjsl];
        [dic setObject:number forKey:@"jjsl"];
        [number release];
    }
    
    if ([self hasJlsl]) 
    {
        NSNumber* number = [[NSNumber alloc]initWithLongLong:jlsl];
        [dic setObject:number forKey:@"jlsl"];
        [number release];
    }
    
    if ([self hasCommon]) 
    {
        [common dictionary:dic];
    }
    
    if ([self hasClnx]) {
        [dic setObject:clnx forKey:@"clnx"];
    }
    
    if ([self hasJgmc]) {
        [dic setObject:jgmc forKey:@"jgmc"];
    }
    
    if ([self hasZzxs]) {
        [dic setObject:zzxs forKey:@"zzxs"];
    }

    if ([self hasZczb]) 
    {
        NSNumber* number = [[NSNumber alloc]initWithFloat:zczb];
        [dic setObject:number forKey:@"zczb"];
        [number release];
    }
    
    if ([self hasClrq]) {
        [dic setObject:clrq forKey:@"clrq"];
    }
    
    if ([self hasGsyg]) {
        [dic setObject:gsyg forKey:@"gsyg"];
    }
    
    NSMutableArray* fundInfoArray = [[NSMutableArray alloc]init];
    for (FundInfo* fundInfoItem in mutableFundInfoList) 
    {
        NSMutableDictionary* subDic = [[NSMutableDictionary alloc]init];
        [fundInfoItem dictionary:subDic];
        [fundInfoArray addObject:subDic];
        [subDic release];
    }
    [dic setObject:fundInfoArray forKey:@"fundInfoList"];
    [fundInfoArray release];
    
    NSMutableArray* opinionArray = [[NSMutableArray alloc]init];
    for (Opinion* opinionItem in mutableOpinionList) 
    {
        NSMutableDictionary* subDic = [[NSMutableDictionary alloc]init];
        [opinionItem dictionary:subDic];
        [opinionArray addObject:subDic];
        [subDic release];
    }
    [dic setObject:opinionArray forKey:@"opinionList"];
    [opinionArray release];
    
    // extra add code
    [dic setObject:@"YES" forKey:@"companyInfo"];
    
    return dic;
}

@end

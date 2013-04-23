//
//  HostDistribution+HostDistribution2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-23.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "HostDistribution+HostDistribution2Dictionary.h"
#import "Common+Common2Dictionary.h"
#import "PhoneNewsType+PhoneNewsType2Dictionary.h"
#import "PhoneOpinionType+PhoneOpinionType2Dictionary.h"

@implementation HostDistribution (HostDistribution2Dictionary)

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
    
    if ([self hasBasicInfoNeedUpdate]) 
    {
        [dic setObject:basicInfoNeedUpdate forKey:@"basicInfoNeedUpdate"];
    }
    
    if ([self hasUpdateUrl]) 
    {
        [dic setObject:updateUrl forKey:@"updateUrl"];
    }
    
    if ([self hasVersionNeedUpdate]) {
        [dic setObject:versionNeedUpdate forKey:@"versionNeedUpdate"];
    }
    
    if ([self hasManagerNeedUpdate]) {
        [dic setObject:managerNeedUpdate forKey:@"managerNeedUpdate"];
    }
    
    if ([self hasCompanyNeedUpdate]) {
        [dic setObject:companyNeedUpdate forKey:@"companyNeedUpdate"];
    }
    
    if ([self hasNewsTypeNeedUpdate]) {
        [dic setObject:newsTypeNeedUpdate forKey:@"newsTypeNeedUpdate"];
    }
    
    if ([self hasOpinionTypeNeedUpdate]) {
        [dic setObject:opinionTypeNeedUpdate forKey:@"opinionTypeNeedUpdate"];
    }
    
    if ([self hasKfsNeedUpdate]) {
        [dic setObject:kfsNeedUpdate forKey:@"kfsNeedUpdate"];
    }
    
    if ([self hasFbsNeedUpdate]) {
        [dic setObject:fbsNeedUpdate forKey:@"fbsNeedUpdate"];
    }
    
    if ([self hasHbsNeedUpdate]) {
        [dic setObject:hbsNeedUpdate forKey:@"hbsNeedUpdate"];
    }
    
    if ([self hasSmNeedUpdate]) {
        [dic setObject:smNeedUpdate forKey:@"smNeedUpdate"];
    }
    
    if ([self hasDtNeedUpdate]) {
        [dic setObject:dtNeedUpdate forKey:@"dtNeedUpdate"];
    }
    
    if ([self hasUpdateDesc]) {
        [dic setObject:updateDesc forKey:@"updateDesc"];
    }
    
    if ([self hasCommon]) {
        [common dictionary:dic];
    }
    
    NSMutableArray* phoneNewsTypeArray = [[NSMutableArray alloc]init];
    for (PhoneNewsType* phoneNewsTypeItem in mutablePhoneNewsTypeList) 
    {
        NSMutableDictionary* subDic = [[NSMutableDictionary alloc]init];
        [phoneNewsTypeItem dictionary:subDic];
        [phoneNewsTypeArray addObject:subDic];
        [subDic release];
    }
    [dic setObject:phoneNewsTypeArray forKey:@"phoneNewsTypeList"];
    [phoneNewsTypeArray release];
    
    NSMutableArray* phoneOpinionTypeArray = [[NSMutableArray alloc]init];
    for (PhoneOpinionType* phoneOpinionTypeItem in mutablePhoneOpinionTypeList) 
    {
        NSMutableDictionary* subDic = [[NSMutableDictionary alloc]init];
        [phoneOpinionTypeItem dictionary:subDic];
        [phoneOpinionTypeArray addObject:subDic];
        [subDic release];
    }
    [dic setObject:phoneOpinionTypeArray forKey:@"phoneOpinionTypeList"];
    [phoneOpinionTypeArray release];
    
    return dic;
}

@end

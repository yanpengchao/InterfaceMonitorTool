//
//  FundCompanyInfo+FundCompanyInfo2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-23.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "FundCompanyInfo+FundCompanyInfo2Dictionary.h"

@implementation FundCompanyInfo (FundCompanyInfo2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasJgdm]) {
        [dic setObject:jgdm forKey:@"jgdm"];
    }
    
    if ([self hasJgjc]) {
        [dic setObject:jgjc forKey:@"jgjc"];
    }
    
    if ([self hasJgpy]) {
        [dic setObject:jgpy forKey:@"jgpy"];
    }
    
    if ([self hasStatus]) {
        [dic setObject:status forKey:@"status"];
    }
    
    if ([self hasType]) {
        [dic setObject:type forKey:@"type"];
    }
    
    return dic;
}

@end

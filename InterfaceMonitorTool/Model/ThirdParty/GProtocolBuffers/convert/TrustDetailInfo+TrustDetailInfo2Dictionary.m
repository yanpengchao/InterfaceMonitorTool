//
//  TrustDetailInfo+TrustDetailInfo2Dictionary.m
//  HowbuyFund
//
//  Created by yan pengchao on 12-6-7.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "TrustDetailInfo+TrustDetailInfo2Dictionary.h"
#import "Common+Common2Dictionary.h"

@implementation TrustDetailInfo (TrustDetailInfo2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasCommon]) 
    {
        [common dictionary:dic];
    }
    
    if ([self hasDp]) {
        [dic setObject:dp forKey:@"dp"];
    }
    
    if ([self hasFullname]) {
        [dic setObject:fullname forKey:@"fullname"];
    }
    
    if ([self hasStr]) {
        [dic setObject:str forKey:@"str"];
    }
    
    if ([self hasYjfxgm]) {
        [dic setObject:yjfxgm forKey:@"yjfxgm"];
    }
    
    if ([self hasYqnhsysm]) {
        [dic setObject:yqnhsysm forKey:@"yqnhsysm"];
    }
    
    if ([self hasZdrgzj]) {
        [dic setObject:zdrgzj forKey:@"zdrgzj"];
    }
    
    return dic;
}

@end

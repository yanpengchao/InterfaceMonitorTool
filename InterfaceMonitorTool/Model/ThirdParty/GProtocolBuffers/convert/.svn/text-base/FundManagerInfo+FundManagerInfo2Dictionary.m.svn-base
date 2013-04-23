//
//  FundManagerInfo+FundManagerInfo2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-23.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "FundManagerInfo+FundManagerInfo2Dictionary.h"

@implementation FundManagerInfo (FundManagerInfo2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasRydm]) {
        [dic setObject:rydm forKey:@"rydm"];
    }
    
    if ([self hasRyxm]) {
        [dic setObject:ryxm forKey:@"ryxm"];
    }
    
    if ([self hasStatus]) {
        [dic setObject:status forKey:@"status"];
    }
    
    if ([self hasXmpy]) {
        [dic setObject:xmpy forKey:@"xmpy"];
    }
    
    if ([self hasType]) {
        [dic setObject:type forKey:@"type"];
    }
    
    return dic;
}

@end

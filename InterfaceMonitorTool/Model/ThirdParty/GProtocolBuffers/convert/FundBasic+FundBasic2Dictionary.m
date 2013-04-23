//
//  FundBasic+FundBasic2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-23.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "FundBasic+FundBasic2Dictionary.h"

@implementation FundBasic (FundBasic2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasJjdm]) {
        [dic setObject:jjdm forKey:@"jjdm"];
    }
    
    if ([self hasJjjc]) {
        [dic setObject:jjjc forKey:@"jjjc"];
    }
    
    if ([self hasJjfl]) {
        [dic setObject:jjfl forKey:@"jjfl"];
    }
    
    if ([self hasJjpy]) {
        [dic setObject:jjpy forKey:@"jjpy"];
    }
    
    if ([self hasJyzt]) {
        [dic setObject:jyzt forKey:@"jyzt"];
    }
    
    if ([self hasJzdw]) {
        [dic setObject:jzdw forKey:@"jzdw"];
    }
    
    if ([self hasJjfl2]) {
        [dic setObject:jjfl2 forKey:@"jjfl2"];
    }
    
    if ([self hasStatus]) {
        [dic setObject:status forKey:@"status"];
    }
    
    return dic;
}

@end

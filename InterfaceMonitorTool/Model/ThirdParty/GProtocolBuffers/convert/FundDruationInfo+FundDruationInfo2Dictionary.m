//
//  FundDruationInfo+FundDruationInfo2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-23.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "FundDruationInfo+FundDruationInfo2Dictionary.h"

@implementation FundDruationInfo (FundDruationInfo2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasJjjz]) {
        [dic setObject:jjjz forKey:@"jjjz"];
    }
    
    if ([self hasJzrq]) {
        [dic setObject:jzrq forKey:@"jzrq"];
    }

    return dic;
}

@end

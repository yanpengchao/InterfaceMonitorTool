//
//  FundZccgInfo+FundZccgInfo2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-23.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "FundZccgInfo+FundZccgInfo2Dictionary.h"

@implementation FundZccgInfo (FundZccgInfo2Dictionary)

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
    
    if ([self hasJzrq]) {
        [dic setObject:jzrq forKey:@"jsrq"];
    }
    
    return dic;
}

@end

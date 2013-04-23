//
//  Closes+Closes2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-21.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "Closes+Closes2Dictionary.h"

@implementation Closes (Closes2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasDqrq]) {
        [dic setObject:dqrq forKey:@"dqrq"];
    }
    
    if ([self hasJjdm]) {
        [dic setObject:jjdm forKey:@"jjdm"];
    }
    
    if ([self hasJjjz]) {
        [dic setObject:jjjz forKey:@"jjjz"];
    }
    
    if ([self hasJzrq]) {
        [dic setObject:jzrq forKey:@"jzrq"];
    }
    
    if ([self hasLjjz]) {
        [dic setObject:ljjz forKey:@"ljjz"];
    }
    
    if ([self hasZfxz]) {
        [dic setObject:zfxz forKey:@"zfxz"];
    }
    
    if ([self hasZyjl]) {
        [dic setObject:zyjl forKey:@"zyjl"];
    }
    return dic;
}

@end

//
//  Moneys+Moneys2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-22.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "Moneys+Moneys2Dictionary.h"

@implementation Moneys (Moneys2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasJjdm]) {
        [dic setObject:jjdm forKey:@"jjdm"];
    }
    
    if ([self hasJzrq]) {
        [dic setObject:jzrq forKey:@"jzrq"];
    }
    
    if ([self hasQrsy]) {
        [dic setObject:qrsy forKey:@"qrsy"];
    }
    
    if ([self hasWfsy]) {
        [dic setObject:wfsy forKey:@"wfsy"];
    }
    
    if ([self hasZfxz]) {
        [dic setObject:zfxz forKey:@"zfxz"];
    }
    
    if ([self hasHb1Y]) {
        [dic setObject:hb1Y forKey:@"hb1Y"];
    }
    
    if ([self hasHbjn]) {
        [dic setObject:hbjn forKey:@"hbjn"];
    }
    
    if ([self hasHb3Y]) {
        [dic setObject:hb3Y forKey:@"hb3Y"];
    }
    
    if ([self hasHb6Y]) {
        [dic setObject:hb6Y forKey:@"hb6Y"];
    }
    
    if ([self hasHb1N]) {
        [dic setObject:hb1N forKey:@"hb1N"];
    }
    
    return dic;
}

@end

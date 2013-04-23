//
//  ClosesNew+ClosesNew2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-3-9.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "ClosesNew+ClosesNew2Dictionary.h"

@implementation ClosesNew (ClosesNew2Dictionary)

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
    
    if ([self hasJjjz]) {
        [dic setObject:jjjz forKey:@"jjjz"];
    }
    
    if ([self hasLjjz]) {
        [dic setObject:ljjz forKey:@"ljjz"];
    }
    
    if ([self hasHbdr]) {
        [dic setObject:hbdr forKey:@"hbdr"];
    }
    
    if ([self hasHb1Y]) {
        [dic setObject:hb1Y forKey:@"hb1Y"];
    }
    
    if ([self hasHb3Y]) {
        [dic setObject:hb3Y forKey:@"hb3Y"];
    }
    
    if ([self hasHb6Y]) {
        [dic setObject:hb6Y forKey:@"hb6Y"];
    }
    
    if ([self hasHbjn]) {
        [dic setObject:hbjn forKey:@"hbjn"];
    }
    
    if ([self hasHb1N]) {
        [dic setObject:hb1N forKey:@"hb1N"];
    }
    
    if ([self hasZfxz]) {
        [dic setObject:zfxz forKey:@"zfxz"];
    }
    
    return dic;
}

@end

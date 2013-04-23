//
//  Issue+Issue2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-23.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "Issue+Issue2Dictionary.h"

@implementation Issue (Issue2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasFbrq]) {
        [dic setObject:fbrq forKey:@"fbrq"];
    }
    
    if ([self hasJlzj]) {
        [dic setObject:jlzj forKey:@"jlzj"];
    }
    
    if ([self hasWzbt]) {
        [dic setObject:wzbt forKey:@"wzbt"];
    }
    
    return dic;
}

@end

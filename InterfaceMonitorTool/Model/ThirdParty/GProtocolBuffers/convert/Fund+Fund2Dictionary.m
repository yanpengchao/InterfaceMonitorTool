//
//  Fund+Fund2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-22.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "Fund+Fund2Dictionary.h"

@implementation Fund (Fund2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }

    if ([self hasRqhb]) {
        [dic setObject:rqhb forKey:@"rqhb"];
    }
    
    if ([self hasJjjc]) {
        [dic setObject:jjjc forKey:@"jjjc"];
    }
    
    if ([self hasRzrq]) {
        [dic setObject:rzrq forKey:@"rzrq"];
    }
    return dic;
}

@end

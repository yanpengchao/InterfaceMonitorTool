//
//  Common+Common2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-21.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "Common+Common2Dictionary.h"

@implementation Common (Common2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasResponseCode]) {
        [dic setObject:responseCode forKey:@"responseCode"];
    }
    
    if ([self hasResponseContent]) {
        [dic setObject:responseContent forKey:@"responseContent"];
    }
    
    return dic;
}

@end

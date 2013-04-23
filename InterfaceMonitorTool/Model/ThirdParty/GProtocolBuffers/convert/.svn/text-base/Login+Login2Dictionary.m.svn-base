//
//  Login+Login2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-3-8.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "Login+Login2Dictionary.h"
#import "Common+Common2Dictionary.h"

@implementation Login (Login2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasCustNo]) {
        [dic setObject:custNo forKey:@"custNo"];
    }
    
    if ([self hasCommon]) 
    {
        [common dictionary:dic];
    }
    
    return dic;
}

@end

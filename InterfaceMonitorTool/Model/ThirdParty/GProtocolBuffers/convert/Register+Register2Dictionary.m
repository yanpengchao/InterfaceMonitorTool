//
//  Register+Register2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-23.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "Register+Register2Dictionary.h"
#import "Common+Common2Dictionary.h"

@implementation Register (Register2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasCustNo]) 
    {
        [dic setObject:custNo forKey:@"custNo"];
    }
    
    if ([self hasCommon]) {
        [common dictionary:dic];
    }
    
    return dic;
}

@end

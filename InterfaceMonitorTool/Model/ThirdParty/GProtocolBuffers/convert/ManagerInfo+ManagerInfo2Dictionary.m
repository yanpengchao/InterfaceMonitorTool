//
//  ManagerInfo+ManagerInfo2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-23.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "ManagerInfo+ManagerInfo2Dictionary.h"

@implementation ManagerInfo (ManagerInfo2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasRydm]) {
        [dic setObject:rydm forKey:@"rydm"];
    }
    
    if ([self hasRyxm]) {
        [dic setObject:ryxm forKey:@"ryxm"];
    }
    
    if ([self hasType]) {
        [dic setObject:type forKey:@"type"];
    }
    
    return dic;
}

@end

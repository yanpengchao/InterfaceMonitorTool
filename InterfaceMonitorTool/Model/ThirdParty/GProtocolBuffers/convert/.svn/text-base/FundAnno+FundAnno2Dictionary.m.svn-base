//
//  FundAnno+FundAnno2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-23.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "FundAnno+FundAnno2Dictionary.h"

@implementation FundAnno (FundAnno2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasGgbt]) {
        [dic setObject:ggbt forKey:@"ggbt"];
    }
    
    if ([self hasGgrq]) {
        [dic setObject:ggrq forKey:@"ggrq"];
    }
    
    if ([self hasJlzj]) {
        [dic setObject:jlzj forKey:@"jlzj"];
    }
    
    return dic;
}

@end

//
//  FundInfo+FundInfo2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-22.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "FundInfo+FundInfo2Dictionary.h"

@implementation FundInfo (FundInfo2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasJjdm]) {
        [dic setObject:jjdm forKey:@"jjdm"];
    }
    
    if ([self hasJjjc]) {
        [dic setObject:jjjc forKey:@"jjjc"];
    }
    
    if ([self hasRyxm]) {
        [dic setObject:ryxm forKey:@"ryxm"];
    }
    
    return dic;
}

@end

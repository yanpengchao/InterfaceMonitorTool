//
//  TrustInfo+TrustInfo2Dictionary.m
//  HowbuyFund
//
//  Created by yan pengchao on 12-6-7.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "TrustInfo+TrustInfo2Dictionary.h"

@implementation TrustInfo (TrustInfo2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasUid]) 
    {
        [dic setObject:uid forKey:@"uid"];
    }
    
    if ([self hasName]) 
    {
        [dic setObject:name forKey:@"name"];
    }
    
    if ([self hasTimeline]) 
    {
        [dic setObject:timeline forKey:@"timeline"];
    }
    
    if ([self hasYqnhsy]) {
        [dic setObject:yqnhsy forKey:@"yqnhsy"];
    }
    
    return dic;
}

@end

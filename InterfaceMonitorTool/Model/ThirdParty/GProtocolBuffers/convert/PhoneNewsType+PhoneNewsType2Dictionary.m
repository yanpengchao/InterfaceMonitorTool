//
//  PhoneNewsType+PhoneNewsType2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-23.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "PhoneNewsType+PhoneNewsType2Dictionary.h"

@implementation PhoneNewsType (PhoneNewsType2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasUid]) 
    {
        NSNumber* number = [[NSNumber alloc]initWithLongLong:uid];
        [dic setObject:number forKey:@"uid"];
        [number release];
    }
    
    if ([self hasTypeName]) 
    {
        [dic setObject:typeName forKey:@"typeName"];
    }
    
    return dic;
}

@end

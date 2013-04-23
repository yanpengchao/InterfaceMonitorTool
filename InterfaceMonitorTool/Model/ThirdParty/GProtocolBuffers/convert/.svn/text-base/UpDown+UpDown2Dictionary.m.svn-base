//
//  UpDown+UpDown2Dictionary.m
//  HowbuyFund
//
//  Created by yan pengchao on 12-5-29.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "UpDown+UpDown2Dictionary.h"
#import "Common+Common2Dictionary.h"

@implementation UpDown (UpDown2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasDownTimes]) 
    {
        NSNumber* number = [[NSNumber alloc]initWithInt:downTimes];
        [dic setObject:number forKey:@"downTimes"];
        [number release];
    }
    
    if ([self hasUpTimes]) 
    {
        NSNumber* number = [[NSNumber alloc]initWithInt:upTimes];
        [dic setObject:number forKey:@"upTimes"];
        [number release];
    }
    
    if ([self hasCommon]) 
    {
        [common dictionary:dic];
    }
    
    return dic;
}

@end

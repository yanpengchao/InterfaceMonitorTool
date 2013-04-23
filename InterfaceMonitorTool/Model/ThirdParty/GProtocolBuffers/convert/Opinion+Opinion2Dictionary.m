//
//  Opinion+Opinion2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-22.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "Opinion+Opinion2Dictionary.h"

@implementation Opinion (Opinion2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasOpinionType]) 
    {
        NSNumber* number = [[NSNumber alloc]initWithLongLong:opinionType];
        [dic setObject:number forKey:@"opinionType"];
        [number release];
    }
    
    if ([self hasPublishTime]) 
    {
        NSNumber* number = [[NSNumber alloc]initWithLongLong:publishTime];
        [dic setObject:number forKey:@"publishTime"];
        [number release];
    }
    
    if ([self hasUid]) 
    {
        NSNumber* number = [[NSNumber alloc]initWithLongLong:uid];
        [dic setObject:number forKey:@"uid"];
        [number release];
    }
    
    if ([self hasTitle]) 
    {
        [dic setObject:title forKey:@"title"];
    }
    
    if ([self hasLabel]) 
    {
        [dic setObject:label forKey:@"label"];
    }
    
    if ([self hasTagName]) 
    {
        [dic setObject:tagName forKey:@"tagName"];
    }
    
    if ([self hasInterviewDate]) 
    {
        [dic setObject:interviewDate forKey:@"interviewDate"];
    }
    
    return dic;
}

@end

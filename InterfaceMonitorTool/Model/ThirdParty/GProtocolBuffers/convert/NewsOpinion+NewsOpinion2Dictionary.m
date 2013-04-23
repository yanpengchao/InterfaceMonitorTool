//
//  NewsOpinion+NewsOpinion2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-3-9.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "NewsOpinion+NewsOpinion2Dictionary.h"

@implementation NewsOpinion (NewsOpinion2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
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
    
    if ([self hasContentType]) {
        [dic setObject:contentType forKey:@"contentType"];
    }
    
    return dic;
}


@end

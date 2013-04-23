//
//  NewsInfo+NewsInfo2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-23.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "NewsInfo+NewsInfo2Dictionary.h"
#import "Common+Common2Dictionary.h"
#import "News+News2Dictionary.h"

@implementation NewsInfo (NewsInfo2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasTotalNum]) 
    {
        NSNumber* number = [[NSNumber alloc]initWithLongLong:totalNum];
        [dic setObject:number forKey:@"totalNum"];
        [number release];
    }
    
    if ([self hasCommon]) {
        [common dictionary:dic];
    }
    
    NSMutableArray* newsArray = [[NSMutableArray alloc]init];
    for (News* newsItem in mutableNewsList) 
    {
        NSMutableDictionary* subDic = [[NSMutableDictionary alloc]init];
        [newsItem dictionary:subDic];
        [newsArray addObject:subDic];
        [subDic release];
    }
    [dic setObject:newsArray forKey:@"newsList"];
    [newsArray release];
    
    return dic;
}

@end

//
//  NewsAndOpinionInfo+NewsAndOpinionInfo2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-3-5.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "NewsAndOpinionInfo+NewsAndOpinionInfo2Dictionary.h"
#import "Common+Common2Dictionary.h"
#import "NewsOpinion+NewsOpinion2Dictionary.h"

@implementation NewsAndOpinionInfo (NewsAndOpinionInfo2Dictionary)

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
    for (NewsOpinion* newsItem in mutableContentListList) 
    {
        NSMutableDictionary* subDic = [[NSMutableDictionary alloc]init];
        [newsItem dictionary:subDic];
        [newsArray addObject:subDic];
        [subDic release];
    }
    [dic setObject:newsArray forKey:@"contentListList"];
    [newsArray release];
    
    return dic;
}

@end

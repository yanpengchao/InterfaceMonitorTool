//
//  OpinionInfo+OpinionInfo2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-23.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "OpinionInfo+OpinionInfo2Dictionary.h"
#import "Common+Common2Dictionary.h"
#import "Opinion+Opinion2Dictionary.h"

@implementation OpinionInfo (OpinionInfo2Dictionary)

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
    
    NSMutableArray* opinionArray = [[NSMutableArray alloc]init];
    for (Opinion* opinionItem in mutableOpinionList) 
    {
        NSMutableDictionary* subDic = [[NSMutableDictionary alloc]init];
        [opinionItem dictionary:subDic];
        [opinionArray addObject:subDic];
        [subDic release];
    }
    [dic setObject:opinionArray forKey:@"opinionList"];
    [opinionArray release];
    
    return dic;
}

@end

//
//  ManagerInfoList+ManagerInfoList2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-23.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "ManagerInfoList+ManagerInfoList2Dictionary.h"
#import "Common+Common2Dictionary.h"
#import "ManagerInfo+ManagerInfo2Dictionary.h"

@implementation ManagerInfoList (ManagerInfoList2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasCommon]) {
        [common dictionary:dic];
    }
    
    NSMutableArray* managerInfoArray = [[NSMutableArray alloc]init];
    for (ManagerInfo* managerInfoItem in mutableManagerInfoList) 
    {
        NSMutableDictionary* subDic = [[NSMutableDictionary alloc]init];
        [managerInfoItem dictionary:subDic];
        [managerInfoArray addObject:subDic];
        [subDic release];
    }
    [dic setObject:managerInfoArray forKey:@"managerInfoList"];
    [managerInfoArray release];
    
    // extra add code
    [dic setObject:@"YES" forKey:@"managerList"];
    
    return dic;
}

@end

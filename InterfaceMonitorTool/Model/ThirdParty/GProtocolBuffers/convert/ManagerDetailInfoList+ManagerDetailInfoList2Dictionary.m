//
//  ManagerDetailInfoList+ManagerDetailInfoList2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-23.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "ManagerDetailInfoList+ManagerDetailInfoList2Dictionary.h"
#import "Common+Common2Dictionary.h"
#import "Fund+Fund2Dictionary.h"
#import "Issue+Issue2Dictionary.h"

@implementation ManagerDetailInfoList (ManagerDetailInfoList2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasCynx]) {
        [dic setObject:cynx forKey:@"cynx"];
    }
    
    if ([self hasGzgs]) {
        [dic setObject:gzgs forKey:@"gzgs"];
    }
    
    if ([self hasRyjj]) {
        [dic setObject:ryjj forKey:@"ryjj"];
    }
    
    if ([self hasRyxb]) {
        [dic setObject:ryxb forKey:@"ryxb"];
    }
    
    if ([self hasRyxm]) {
        [dic setObject:ryxm forKey:@"ryxm"];
    }

    if ([self hasZpdz]) {
        [dic setObject:zpdz forKey:@"zpdz"];
    }
    
    if ([self hasCommon]) {
        [common dictionary:dic];
    }
    
    NSMutableArray* fundArray = [[NSMutableArray alloc]init];
    for (Fund* fundItem in mutableFundList) 
    {
        NSMutableDictionary* subDic = [[NSMutableDictionary alloc]init];
        [fundItem dictionary:subDic];
        [fundArray addObject:subDic];
        [subDic release];
    }
    [dic setObject:fundArray forKey:@"fundList"];
    [fundArray release];
    
    NSMutableArray* issueArray = [[NSMutableArray alloc]init];
    for (Issue* issueItem in mutableIssueList) 
    {
        NSMutableDictionary* subDic = [[NSMutableDictionary alloc]init];
        [issueItem dictionary:subDic];
        [issueArray addObject:subDic];
        [subDic release];
    }
    [dic setObject:issueArray forKey:@"issueList"];
    [issueArray release];
    
    // extra add code
    [dic setObject:@"YES" forKey:@"managerInfo"];
    
    return dic;
}

@end

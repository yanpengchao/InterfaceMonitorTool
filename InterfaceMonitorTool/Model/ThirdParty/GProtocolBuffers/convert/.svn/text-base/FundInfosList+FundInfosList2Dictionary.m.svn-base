//
//  FundInfosList+FundInfosList2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-23.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "FundInfosList+FundInfosList2Dictionary.h"
#import "Common+Common2Dictionary.h"
#import "Opens+Opens2Dictionary.h"
#import "Moneys+Moneys2Dictionary.h"
#import "Simus+Simus2Dictionary.h"
#import "ClosesNew+ClosesNew2Dictionary.h"

@implementation FundInfosList (FundInfosList2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasCommon]) 
    {
        [common dictionary:dic];
    }
    
    NSMutableArray* opensArray = [[NSMutableArray alloc]init];
    for (Opens* opensItem in mutableOpensList) 
    {
        NSMutableDictionary* subDic = [[NSMutableDictionary alloc]init];
        [opensItem dictionary:subDic];
        [opensArray addObject:subDic];
        [subDic release];
    }
    [dic setObject:opensArray forKey:@"openList"];
    [opensArray release];
    
    NSMutableArray* moneysArray = [[NSMutableArray alloc]init];
    for (Moneys* moneysItem in mutableMoneysList) 
    {
        NSMutableDictionary* subDic = [[NSMutableDictionary alloc]init];
        [moneysItem dictionary:subDic];
        [moneysArray addObject:subDic];
        [subDic release];
    }
    [dic setObject:moneysArray forKey:@"moneyList"];
    [moneysArray release];
    
    NSMutableArray* closesArray = [[NSMutableArray alloc]init];
    for (ClosesNew* closesItem in mutableClosesNewList) 
    {
        NSMutableDictionary* subDic = [[NSMutableDictionary alloc]init];
        [closesItem dictionary:subDic];
        [closesArray addObject:subDic];
        [subDic release];
    }
    [dic setObject:closesArray forKey:@"closeList"];
    [closesArray release];
    
    NSMutableArray* simusArray = [[NSMutableArray alloc]init];
    for (Simus* simusItem in mutableSimusList) 
    {
        NSMutableDictionary* subDic = [[NSMutableDictionary alloc]init];
        [simusItem dictionary:subDic];
        [simusArray addObject:subDic];
        [subDic release];
    }
    [dic setObject:simusArray forKey:@"simusList"];
    [simusArray release];
    
    return dic;
}

@end

//
//  ICSynFavFund+ICSynFavFund2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-23.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "ICSynFavFund+ICSynFavFund2Dictionary.h"
#import "Common+Common2Dictionary.h"
#import "UserFavorite+UserFavorite2Dictionary.h"

@implementation ICSynFavFund (ICSynFavFund2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasCommon]) {
        [common dictionary:dic];
    }
    
    NSMutableArray* userFavoritesArray = [[NSMutableArray alloc]init];
    for (UserFavorite* userFavoritesItem in mutableUserFavoritesList) 
    {
        NSMutableDictionary* subDic = [[NSMutableDictionary alloc]init];
        [userFavoritesItem dictionary:subDic];
        [userFavoritesArray addObject:subDic];
        [subDic release];
    }
    [dic setObject:userFavoritesArray forKey:@"userFavoritesList"];
    [userFavoritesArray release];
    
    return dic;
}

@end

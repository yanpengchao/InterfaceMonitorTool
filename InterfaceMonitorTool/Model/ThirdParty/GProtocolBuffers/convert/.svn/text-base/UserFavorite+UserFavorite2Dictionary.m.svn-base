//
//  UserFavorite+UserFavorite2Dictionary.m
//  HowbuyFund
//
//  Created by yong xing on 12-2-23.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "UserFavorite+UserFavorite2Dictionary.h"

@implementation UserFavorite (UserFavorite2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasFavoriteObject]) {
        [dic setObject:favoriteObject forKey:@"favoriteObject"];
    }
    
    return dic;
}

@end

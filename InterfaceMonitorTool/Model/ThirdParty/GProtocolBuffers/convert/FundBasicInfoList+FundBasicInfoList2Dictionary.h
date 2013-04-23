//
//  FundBasicInfoList+FundBasicInfoList2Dictionary.h
//  HowbuyFund
//
//  Created by yong xing on 12-2-23.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "FundBasicInfoList.pb.h"

@interface FundBasicInfoList (FundBasicInfoList2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic;

@end

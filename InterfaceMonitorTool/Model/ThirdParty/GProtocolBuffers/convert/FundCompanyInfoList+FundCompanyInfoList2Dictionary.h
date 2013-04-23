//
//  FundCompanyInfoList+FundCompanyInfoList2Dictionary.h
//  HowbuyFund
//
//  Created by yong xing on 12-2-23.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "FundCompanyInfoList.pb.h"

@interface FundCompanyInfoList (FundCompanyInfoList2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic;

@end

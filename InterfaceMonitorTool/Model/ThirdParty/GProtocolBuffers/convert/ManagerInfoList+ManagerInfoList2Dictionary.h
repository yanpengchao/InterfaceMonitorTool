//
//  ManagerInfoList+ManagerInfoList2Dictionary.h
//  HowbuyFund
//
//  Created by yong xing on 12-2-23.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

#import "ManagerInfoList.pb.h"

@interface ManagerInfoList (ManagerInfoList2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic;

@end

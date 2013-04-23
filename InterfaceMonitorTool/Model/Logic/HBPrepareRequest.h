//
//  HBPrepareRequest.h
//  HowbuyFund
//
//  Created by pengchao.yan on 12-9-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBMessageDefine.h"

@class ASIHTTPRequest;

@interface HBPrepareRequest : NSObject

+ (NSString*) getSubUrlByMessageID:(EMessageID)messageID;
+ (ASIHTTPRequest*)prepareWithParameter:(NSDictionary*)parameterInfoDic forMessage:(EMessageID)messageID;

@end

//
//  HBParseNetworkData.h
//  HowbuyFund
//
//  Created by pengchao.yan on 12-9-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBMessageDefine.h"

@class ASIHTTPRequest;
@interface HBParseNetworkData : NSObject
{
    //
}

+ (NSDictionary*)parseRequest:(ASIHTTPRequest*)request withData:(NSData*)data forMessageType:(EMessageID)messageID;
+ (NSDictionary*)parseData:(NSData*)data forMessageType:(EMessageID)messageID withParameters:(NSDictionary*)parameters;

@end

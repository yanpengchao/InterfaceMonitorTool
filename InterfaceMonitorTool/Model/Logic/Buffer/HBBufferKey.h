//
//  HBBufferKey.h
//  HowbuyFund
//
//  Created by pengchao.yan on 12-12-20.
//
//

#import <Foundation/Foundation.h>
#import "HBMessageDefine.h"

@interface HBBufferKey : NSObject
{
    EMessageID      _eMessageID;
    NSDictionary*   _parameterInfoDic;
}
@property (nonatomic, assign)EMessageID eMessageID;
@property (nonatomic, retain)NSDictionary* parameterInfoDic;

- (HBBufferKey*)initWithMessageID:(EMessageID)msgID andParameters:(NSDictionary*)dic;
- (NSString*)key;
@end

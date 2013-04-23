//
//  HBBufferKey.m
//  HowbuyFund
//
//  Created by pengchao.yan on 12-12-20.
//
//

#import "HBBufferKey.h"
#import "HBPrepareRequest.h"

@implementation HBBufferKey
@synthesize eMessageID = _eMessageID;
@synthesize parameterInfoDic = _parameterInfoDic;

- (HBBufferKey*)initWithMessageID:(EMessageID)msgID andParameters:(NSDictionary*)dic
{
    self = [super init];
    if (self) {
        self.eMessageID = msgID;
        self.parameterInfoDic = dic;
    }
    
    return self;
}

- (NSString*)key
{
    switch (self.eMessageID) {
        case eMessageIDGetTrustByPage:
        {
            return [self KeyForGetTrustByPage];
        }
            break;
        case eMessageIDGetFixedInvestOderByPage:
        {
            return [self keyForGetFixedInvestOderByPage];
        }
            break;
        default:
            break;
    }
    
    return nil;
}

- (NSString*)KeyForGetTrustByPage
{
    NSString* subPathUrlString = [HBPrepareRequest getSubUrlByMessageID:self.eMessageID];
    id currentPage = [self.parameterInfoDic objectForKey:@"currentPage"];
    NSString* key = [NSString stringWithFormat:@"GetTrustByPage-%u-%@", [subPathUrlString hash], currentPage];

    return key;
}

- (NSString*)keyForGetFixedInvestOderByPage
{
    NSString* subPathUrlString = [HBPrepareRequest getSubUrlByMessageID:self.eMessageID];
    
//    NSMutableDictionary* userInfo = [[NSMutableDictionary alloc]init];
//    [userInfo setObject:sPageNum forKey:@"pageNum"];
//    [userInfo setObject:[NSNumber numberWithInt:20] forKey:@"pageCount"];
//    [userInfo setObject:sOrderType forKey:@"type"];
//    [userInfo setObject:sOrder forKey:@"order"];
//    [userInfo setObject:sKind forKey:@"kind"];
    
//    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
//    [dic setObject:[userInfo objectForKey:@"kind"] forKey:@"fixedFundType"];
//    [dic setObject:[userInfo objectForKey:@"pageNum"] forKey:@"pageNum"];
//    [dic setObject:[userInfo objectForKey:@"type"] forKey:@"orderType"];
//    [dic setObject:[userInfo objectForKey:@"order"] forKey:@"order"];

    NSString* type = [self.parameterInfoDic objectForKey:@"type"];
    NSString* order = [self.parameterInfoDic objectForKey:@"order"];
    NSString* kind = [self.parameterInfoDic objectForKey:@"kind"];
    NSString* pageNum = [self.parameterInfoDic objectForKey:@"pageNum"];
    
    NSString* key = [NSString stringWithFormat:@"GetFixedInvestOderByPage-%u-%@-%@-%@-%@", [subPathUrlString hash], type, order, kind, pageNum];
    
    return key;
}

@end

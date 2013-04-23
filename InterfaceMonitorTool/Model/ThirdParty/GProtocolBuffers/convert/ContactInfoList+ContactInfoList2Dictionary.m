//
//  ContactInfoList+ContactInfoList2Dictionary.m
//  HowbuyFund
//
//  Created by pengchao.yan on 12-11-5.
//
//

#import "ContactInfoList+ContactInfoList2Dictionary.h"
#import "ContactInfo+ContactInfo2Dictionary.h"

@implementation ContactInfoList (ContactInfoList2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasVersion])
    {
        [dic setObject:version forKey:@"version"];
    }
    if ([self hasChannelId]) {
        [dic setObject:channelId forKey:@"channelId"];
    }
    if ([self hasProductId]) {
        [dic setObject:productId forKey:@"productId"];
    }
    if ([self hasParPhoneModel]) {
        [dic setObject:parPhoneModel forKey:@"hasParPhoneModel"];
    }
    if ([self hasSubPhoneModel]) {
        [dic setObject:subPhoneModel forKey:@"subPhoneModel"];
    }
    if ([self hasToken]) {
        [dic setObject:token forKey:@"token"];
    }
    if ([self hasIVer]) {
        [dic setObject:iVer forKey:@"iVer"];
    }
    
    NSMutableArray* contactInfoArray = [[NSMutableArray alloc]init];
    for (ContactInfo* contactInfoItem in mutableContactInfoList)
    {
        NSMutableDictionary* subDic = [[NSMutableDictionary alloc]init];
        [contactInfoItem dictionary:subDic];
        [contactInfoArray addObject:subDic];
        [subDic release];
    }
    [dic setObject:contactInfoArray forKey:@"contactInfoList"];
    [contactInfoArray release];
    
    return dic;
}

@end

//
//  ContactInfo+ContactInfo2Dictionary.m
//  HowbuyFund
//
//  Created by pengchao.yan on 12-11-5.
//
//

#import "ContactInfo+ContactInfo2Dictionary.h"

@implementation ContactInfo (ContactInfo2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasName]) {
        [dic setObject:name forKey:@"name"];
    }
    if ([self hasCompany]) {
        [dic setObject:company forKey:@"company"];
    }
    if ([self hasTitle]) {
        [dic setObject:title forKey:@"title"];
    }
    if ([self hasEmail]) {
        [dic setObject:email forKey:@"email"];
    }
    if ([self hasPhoneNumber]) {
        [dic setObject:phoneNumber forKey:@"phoneNumber"];
    }
    if ([self hasNote]) {
        [dic setObject:note forKey:@"note"];
    }
    if ([self hasUid]) {
        [dic setObject:uid forKey:@"uid"];
    }
    
    return dic;
}

@end

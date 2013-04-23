//
//  ContactInfoList+ContactInfoList2Dictionary.h
//  HowbuyFund
//
//  Created by pengchao.yan on 12-11-5.
//
//

#import "ContactInfoList.pb.h"

@interface ContactInfoList (ContactInfoList2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic;

@end

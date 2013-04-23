//
//  PerformanceInfo+PerformanceInfo2Dictionary.m
//  HowbuyFund
//
//  Created by pengchao.yan on 13-4-1.
//
//

#import "PerformanceInfo+PerformanceInfo2Dictionary.h"
#import "Common+Common2Dictionary.h"

@implementation PerformanceInfo (PerformanceInfo2Dictionary)

-(NSDictionary*)dictionary:(NSMutableDictionary*)dic
{
    if (nil == dic) {
        return dic;
    }
    
    if ([self hasCommon])
    {
        [common dictionary:dic];
    }
    
    if ([self hasPm2N]) {
        [dic setObject:pm2N forKey:@"pm2N"];
    }
    
    if ([self hasTl2N]) {
        [dic setObject:tl2N forKey:@"tl2N"];
    }
    
    if ([self hasHb3N]) {
        [dic setObject:hb3N forKey:@"hb3N"];
    }
    
    if ([self hasPm3N]) {
        [dic setObject:pm3N forKey:@"pm3N"];
    }
    
    if ([self hasTl3N]) {
        [dic setObject:tl3N forKey:@"tl3N"];
    }
    
    if ([self hasHb4N]) {
        [dic setObject:hb4N forKey:@"hb4N"];
    }
    
    if ([self hasPm4N]) {
        [dic setObject:pm4N forKey:@"pm4N"];
    }
    
    if ([self hasTl4N]) {
        [dic setObject:tl4N forKey:@"tl4N"];
    }
    
    if ([self hasHb5N]) {
        [dic setObject:hb5N forKey:@"hb5N"];
    }
    
    if ([self hasPm5N]) {
        [dic setObject:pm5N forKey:@"pm5N"];
    }
    
    if ([self hasTl5N]) {
        [dic setObject:tl5N forKey:@"tl5N"];
    }
    
    if ([self hasHbjn]) {
        [dic setObject:hbjn forKey:@"hbjn"];
    }
    
    if ([self hasPmjn]) {
        [dic setObject:pmjn forKey:@"pmjn"];
    }
    
    if ([self hasTljn]) {
        [dic setObject:tljn forKey:@"tljn"];
    }
    
    if ([self hasHbcl]) {
        [dic setObject:hbcl forKey:@"hbcl"];
    }
    
    if ([self hasPmcl]) {
        [dic setObject:pmcl forKey:@"pmcl"];
    }
    
    if ([self hasTlcl]) {
        [dic setObject:tlcl forKey:@"tlcl"];
    }
    
    if ([self hasHb1Z]) {
        [dic setObject:hb1Z forKey:@"hb1Z"];
    }
    
    if ([self hasPm1Z]) {
        [dic setObject:pm1Z forKey:@"pm1Z"];
    }
    
    if ([self hasTl1Z]) {
        [dic setObject:tl1Z forKey:@"tl1Z"];
    }
    
    if ([self hasHb1Y]) {
        [dic setObject:hb1Y forKey:@"hb1Y"];
    }
    
    if ([self hasPm1Y]) {
        [dic setObject:pm1Y forKey:@"pm1Y"];
    }
    
    if ([self hasTl1Y]) {
        [dic setObject:tl1Y forKey:@"tl1Y"];
    }
    
    if ([self hasHb3Y]) {
        [dic setObject:hb3Y forKey:@"hb3Y"];
    }
    
    if ([self hasPm3Y]) {
        [dic setObject:pm3Y forKey:@"pm3Y"];
    }
    
    if ([self hasTl3Y]) {
        [dic setObject:tl3Y forKey:@"tl3Y"];
    }
    
    if ([self hasHb6Y]) {
        [dic setObject:hb6Y forKey:@"hb6Y"];
    }
    
    if ([self hasPm6Y]) {
        [dic setObject:pm6Y forKey:@"pm6Y"];
    }
    
    if ([self hasTl6Y]) {
        [dic setObject:tl6Y forKey:@"tl6Y"];
    }
    
    if ([self hasHb1N]) {
        [dic setObject:hb1N forKey:@"hb1N"];
    }
    
    if ([self hasPm1N]) {
        [dic setObject:pm1N forKey:@"pm1N"];
    }
    
    if ([self hasTl1N]) {
        [dic setObject:tl1N forKey:@"tl1N"];
    }
    
    if ([self hasHb2N]) {
        [dic setObject:hb2N forKey:@"hb2N"];
    }
    
    return dic;
}

@end

//
//  HBBufferManager.h
//  HowbuyFund
//
//  Created by pengchao.yan on 12-12-20.
//
//

#import <Foundation/Foundation.h>
#import "HBBufferKey.h"

@interface HBBufferManager : NSObject
{
    //
}

+ (BOOL)hasBuffer:(HBBufferKey*)bufferKey;
+ (void)deleteBuffer:(HBBufferKey*)bufferKey;
+ (NSData*)getBuffer:(HBBufferKey*)bufferKey;
+ (BOOL)saveBuffer:(NSData*)bufferData withKey:(HBBufferKey*)bufferKey;

@end

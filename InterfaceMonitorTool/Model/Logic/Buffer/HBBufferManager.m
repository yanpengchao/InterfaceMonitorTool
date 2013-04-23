//
//  HBBufferManager.m
//  HowbuyFund
//
//  Created by pengchao.yan on 12-12-20.
//
//

#import "HBBufferManager.h"
#import "HBBufferDefine.h"

@implementation HBBufferManager

+ (BOOL)hasBuffer:(HBBufferKey*)bufferKey
{
    NSString* fileName = [bufferKey key];
    if (fileName == nil) {
        return NO;
    }
    
    NSString* filePath = [[HBBufferDefine getBufferPath] stringByAppendingPathComponent:fileName];
    NSFileManager *fileManager	= [NSFileManager defaultManager];
    
	return [fileManager fileExistsAtPath:filePath];
}

+ (void)deleteBuffer:(HBBufferKey*)bufferKey
{
    NSString* fileName = [bufferKey key];
    if (fileName == nil) {
        return ;
    }
    
    NSString* filePath = [[HBBufferDefine getBufferPath] stringByAppendingPathComponent:fileName];
    NSFileManager *fileManager	= [NSFileManager defaultManager];
    NSError *error = nil;
    [fileManager removeItemAtPath:filePath error:&error];
}

+ (NSData*)getBuffer:(HBBufferKey*)bufferKey
{
    NSString* fileName = [bufferKey key];
    if (fileName == nil) {
        return nil;
    }
    
    NSString* filePath = [[HBBufferDefine getBufferPath] stringByAppendingPathComponent:fileName];
    NSFileManager *fileManager	= [NSFileManager defaultManager];
    return [fileManager contentsAtPath:filePath];
}

+ (BOOL)saveBuffer:(NSData*)bufferData withKey:(HBBufferKey*)bufferKey
{
    if ([HBBufferManager hasBuffer:bufferKey]) {
        [HBBufferManager deleteBuffer:bufferKey];
    }
    
    NSString* fileName = [bufferKey key];
    if (fileName == nil) {
        return NO;
    }
    
    NSString* filePath = [[HBBufferDefine getBufferPath] stringByAppendingPathComponent:fileName];
    return [bufferData writeToFile:filePath atomically:YES];
}

@end

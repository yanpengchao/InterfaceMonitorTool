//
//  HBBufferDefine.m
//  HowbuyFund
//
//  Created by pengchao.yan on 12-12-20.
//
//

#import "HBBufferDefine.h"
#import "HBTools.h"

@implementation HBBufferDefine

+ (NSString*)getBufferPath
{
    NSString* bufferPath = [[HBTools getMyDocumentPath] stringByAppendingPathComponent:@"Buffer"];
    NSFileManager *fileManager	= [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:bufferPath]) {
        NSError* error = nil;
        if (![fileManager createDirectoryAtPath:bufferPath withIntermediateDirectories:YES attributes:nil error:&error])
        {
            NSLog(@"Error creating directory: %@", [error description]);
            return [HBTools getMyDocumentPath];
        }
    }
    return bufferPath;
}

@end

//
//  HBFileLog.h
//  InterfaceMonitorTool
//
//  Created by pengchao.yan on 13-4-11.
//  Copyright (c) 2013年 pengchao.yan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBFileLog : NSObject
{
    //
}

+ (HBFileLog*)getInstance;
+ (NSArray*)listAllLogFiles;
+ (NSArray*)readLogFromFile:(NSString*)fileName;
+ (void)deleteLogFile:(NSString*)fileName;

- (void)startLog;
- (void)writeLog:(NSString*)logString;
- (void)endLog;

@end

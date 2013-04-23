//
//  HBFileLog.m
//  InterfaceMonitorTool
//
//  Created by pengchao.yan on 13-4-11.
//  Copyright (c) 2013年 pengchao.yan. All rights reserved.
//

#import "HBFileLog.h"
#import "HBTools.h"
#import "HBAppConfig.h"

static HBFileLog* sFileLog = nil;

#define LOG_DATE_KEY    @"date"         // 日期
#define LOG_AUTHOR_KEY  @"author"       // 作者
#define LOG_ARRAY_KEY   @"logArray"     // 日志内容数组

@interface HBFileLog ()
{
    NSInteger _currentLogTag;           // 当前tag
    NSMutableArray* _logBufferArray;    // 日志缓存，当凑够一定数量时，才保存到文件
}

@property (nonatomic)NSInteger currentLogTag;
@property (nonatomic, strong)NSMutableArray* logBufferArray;
@end

@implementation HBFileLog
@synthesize currentLogTag = _currentLogTag;
@synthesize logBufferArray = _logBufferArray;

+ (HBFileLog*)getInstance
{
    if (sFileLog == nil) {
        @synchronized(self)
        {
            if (sFileLog == nil) {
                sFileLog = [[self alloc] init];
            }
        }
    }
    
    return sFileLog;
}

+ (NSArray*)listAllLogFiles
{
    return [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[HBFileLog getLogPath] error:nil];
}

+ (NSArray*)readLogFromFile:(NSString*)fileName
{
    if ([HBFileLog isFileExist:fileName]) {
        NSString *filePathName = [[HBFileLog getLogPath] stringByAppendingPathComponent:fileName];
        NSDictionary* dic = [NSDictionary dictionaryWithContentsOfFile:filePathName];
        return [dic objectForKey:LOG_ARRAY_KEY];
    }

    return nil;
}

- (void)startLog
{
    self.logBufferArray = [NSMutableArray array];
}

- (void)writeLog:(NSString*)logString
{
    if (self.logBufferArray == nil) {
        self.logBufferArray = [NSMutableArray array];
    }
    [self.logBufferArray addObject:logString];
}

- (void)endLog
{
    self.currentLogTag = -1;
    // TODO:写文件
    NSMutableDictionary* mDic = [NSMutableDictionary dictionaryWithDictionary:[HBFileLog basicDictionaryForLogFile]];
    if (self.logBufferArray == nil) {
        NSMutableArray* array = [NSMutableArray array];
        [array addObject:@"未写入任何日志"];
        self.logBufferArray = array;
    }
    [mDic setObject:self.logBufferArray forKey:LOG_ARRAY_KEY];
    
    NSString* fileName = [HBFileLog getFileNameForThisTime];
    NSString* changeFileName = [NSString stringWithString:fileName];
    int count = 1;
    while ([[NSFileManager defaultManager] fileExistsAtPath:changeFileName]) {
        changeFileName = [NSString stringWithFormat:@"%@%d", fileName, count];
    }
    NSString *documentFilePathName = [[HBFileLog getLogPath] stringByAppendingPathComponent:changeFileName];    
    if (![mDic writeToFile:documentFilePathName atomically:YES])
    {
        HBErrorLog(@"%@ write file failed", documentFilePathName);
    }
    
    self.logBufferArray = nil;
}

#pragma mark - local functions

//#define LOG_DATE_KEY    @"date"         // 日期
//#define LOG_AUTHOR_KEY  @"author"       // 作者
//#define LOG_ARRAY_KEY   @"logArray"     // 日志内容数组

+ (NSDictionary*)basicDictionaryForLogFile
{
    NSMutableDictionary* mDic = [NSMutableDictionary dictionary];
    
    [mDic setObject:[NSDate date] forKey:LOG_DATE_KEY];
    [mDic setObject:[HBAppConfig getInstance].userName forKey:LOG_AUTHOR_KEY];
    [mDic setObject:[NSArray array] forKey:LOG_ARRAY_KEY];
    
    return mDic;
}

+ (NSString*)getFileNameForThisTime
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:[NSDate date]];
    
    NSInteger year = [components year];
    NSInteger month = [components month];
    NSInteger day = [components day];
    NSInteger hour = [components hour];
    NSInteger minute = [components minute];
    NSInteger second = [components second];
    
    return [NSString stringWithFormat:@"%4d年%02d月%02d日%02d时%02d分%02d秒", year, month, day, hour, minute, second];
}

+ (NSString*)getLogPath
{
    NSString* bufferPath = [[HBTools getMyDocumentPath] stringByAppendingPathComponent:@"Logs"];
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

+ (BOOL)isFileExist:(NSString*)fileName
{
    if (fileName == nil) {
        return NO;
    }
    
    NSString* filePath = [[HBFileLog getLogPath] stringByAppendingPathComponent:fileName];
	return [[NSFileManager defaultManager] fileExistsAtPath:filePath];
}

+ (void)deleteLogFile:(NSString*)fileName
{
    NSString* filePath = [[HBFileLog getLogPath] stringByAppendingPathComponent:fileName];
    NSError *error = nil;
    [[NSFileManager defaultManager] removeItemAtPath:filePath error:&error];
}

+ (NSDictionary*)getLogInfo:(NSString*)fileName
{
    NSString* filePath = [[HBFileLog getLogPath] stringByAppendingPathComponent:fileName];
    return [NSDictionary dictionaryWithContentsOfFile:filePath];
}

@end

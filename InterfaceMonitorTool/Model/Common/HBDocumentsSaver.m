//
//  HBDocumentsSaver.m
//  HowbuyFund
//
//  Created by pengchao.yan on 12-9-12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HBDocumentsSaver.h"
#import "HBTools.h"

@interface HBDocumentsSaver ()

// 导入旧字典里的配置，返回TRUE时，表示确实导入了旧的配置
- (BOOL)importConfig;

// fixed values
- (void)fixedValues;
@end

@implementation HBDocumentsSaver
@synthesize version = _version;
@synthesize configInfoDic = _configInfoDic;
@synthesize dataSource = _dataSource;

- (void)dealloc
{
    self.configInfoDic = nil;
    [super dealloc];
}

// 读取原配置文件里的所有配置
- (NSDictionary*)readOldConfig
{
    NSFileManager *fileManager	= [NSFileManager defaultManager];
    NSString *documentFilePathName = [[HBTools getMyDocumentPath] stringByAppendingPathComponent:[self.dataSource configFileName]];
    
	BOOL exist = [fileManager fileExistsAtPath:documentFilePathName];
    if (exist) {
        return [NSDictionary dictionaryWithContentsOfFile:documentFilePathName];
    }
    
    return nil;
}

// 读取新配置文件里的所有配置
- (NSDictionary*)readNewConfig
{
    NSFileManager *fileManager	= [NSFileManager defaultManager];
    NSString* mainBundlePath = [[NSBundle mainBundle] resourcePath];
    NSString *bundleFilePathName = [mainBundlePath stringByAppendingPathComponent:[self.dataSource configFileName]];
    
	BOOL exist = [fileManager fileExistsAtPath:bundleFilePathName];
    if (exist) {
        return [NSDictionary dictionaryWithContentsOfFile:bundleFilePathName];
    }
    
    return nil;
}

// 导入旧字典里的配置，返回TRUE时，表示确实导入了旧的配置
- (BOOL)importConfig
{   
    // 加载新配置文件
    if (self.configInfoDic == nil) {
        self.configInfoDic = [NSMutableDictionary dictionaryWithDictionary:[self readNewConfig]];
    }
    
    // 新配置文件不存在，直接返回
    if (self.configInfoDic == nil) {
        return NO;
    }
    
    // 老配置文件不存在，则全部配置都依从新文件的配置，此时全部配置都需要保存到新位置
    NSDictionary* oldConfig = [self readOldConfig];
    if (oldConfig == nil) {
        return YES;
    }
    
    NSNumber* oldVersion = [oldConfig objectForKey:CONFIG_VERSION_KEY];
    NSNumber* newVersion = [self.configInfoDic objectForKey:CONFIG_VERSION_KEY];
    
    if ([newVersion intValue] > [oldVersion intValue]) {    // 有新版本，才需要导入
        NSMutableDictionary* importeConfigDic = [[NSMutableDictionary alloc] initWithDictionary:self.configInfoDic];
        
        for (NSString* key in [oldConfig allKeys]) {
            // 老版本中的配置项，如果在新版本中还在，则替换新的，如果不在了，则舍弃
            if ([importeConfigDic objectForKey:key] != nil && ![key isEqualToString:CONFIG_VERSION_KEY]) {
                [importeConfigDic setObject:[oldConfig objectForKey:key] forKey:key];
            }
        }
        
        self.configInfoDic = importeConfigDic;
        [importeConfigDic release];
        
        return YES;
    }
    else {
        self.configInfoDic = [NSMutableDictionary dictionaryWithDictionary:oldConfig];
        return NO;
    }
}

// 加载配置项
- (void)loadConfig
{
    // 没加载，加载一次
    if (self.configInfoDic == nil) {
        // 如果是更新，那么及时更新下配置文件
        if ([self importConfig]) {
            [self saveConfig];
        }
    }
}

// 保存配置到文件
- (void)saveConfig
{
    if (self.configInfoDic != nil) {
        NSFileManager *fileManager	= [NSFileManager defaultManager];
        NSString *documentFilePathName = [[HBTools getMyDocumentPath] stringByAppendingPathComponent:[self.dataSource configFileName]];
        if ([fileManager fileExistsAtPath:documentFilePathName]) {
            [fileManager removeItemAtPath:documentFilePathName error:nil];
        }
        
        [self fixedValues];
        
        if (![self.configInfoDic writeToFile:documentFilePathName atomically:YES])
        {
            HBErrorLog(@"%@ write file failed", [self.dataSource configFileName]);
        }
    }
}

- (void)fixedValues
{
    //
}

- (void)saveOnExit
{
    [self saveConfig];
}

- (void)memoryWarning
{
    [self saveConfig];
//    self.configInfoDic = nil;
}

@end

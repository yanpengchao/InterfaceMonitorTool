//
//  HBDocumentsSaver.h
//  HowbuyFund
//
//  Created by pengchao.yan on 12-9-12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HBAutoSaver.h"

@protocol HBDocumentsSaverDataSource <NSObject>

// 配置文件必须加 CONFIG_VERSION_KEY 字段，用于版本比较
#define CONFIG_VERSION_KEY @"version"

// 配置文件名称
@required
- (NSString*)configFileName;

@end

@interface HBDocumentsSaver : NSObject <HBAutoSaverDelegate>
{
    NSNumber* _version;
    NSMutableDictionary* _configInfoDic;
    id<HBDocumentsSaverDataSource> _dataSource;
}

@property (nonatomic, retain)NSNumber* version;
@property (nonatomic, retain)NSMutableDictionary* configInfoDic;
@property (nonatomic, assign)id<HBDocumentsSaverDataSource> dataSource;

// 加载配置项
- (void)loadConfig;

// 保存配置到文件
- (void)saveConfig;

// 读取原配置文件里的所有配置
- (NSDictionary*)readOldConfig;

// 读取新配置文件里的所有配置
- (NSDictionary*)readNewConfig;

@end

//
//  HBAppConfig.m
//  HowbuyFund
//
//  Created by pengchao.yan on 12-9-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HBAppConfig.h"
#import "HBAutoSaver.h"

@interface HBDocumentsSaver ()
{
    //
}

- (BOOL)importConfig;

@end

static HBAppConfig* sAppConfig = nil;

@implementation HBAppConfig
@synthesize name = _name;//, version = _version,
@synthesize channel = _channel, md5 = _md5;
@synthesize infomation = _infomation, research = _research;
@synthesize manager = _manager, company = _company;
@synthesize starturl = _starturl, netvalue = _netvalue, basicinfo = _basicinfo;
@synthesize dbversion = _dbversion, appid = _appid, productid = _productid;
@synthesize baseurl = _baseurl, cacheexpiredtime = _cacheexpiredtime;
@synthesize token = _token, networkVersion = _networkVersion;

@synthesize openFundsVersion = _openFundsVersion;
@synthesize closeFundsVersion = _closeFundsVersion;
@synthesize privateFundsVersion = _privateFundsVersion;
@synthesize moneyFundsVersion = _moneyFundsVersion;

@synthesize openFundsVersionS = _openFundsVersionS;
@synthesize closeFundsVersionS = _closeFundsVersionS;
@synthesize privateFundsVersionS = _privateFundsVersionS;
@synthesize moneyFundsVersionS = _moneyFundsVersionS;

@synthesize customFundsVersionS = _customFundsVersionS;

@synthesize fixedLastGetTime = _fixedLastGetTime;

@synthesize channelId = _channelId;
@synthesize umengAppKey = _umengAppKey;

@synthesize imsi = _imsi;
@synthesize phoneNumber = _phoneNumber;
@synthesize userName = _userName;

@synthesize closeFundsNeedUpdate = _closeFundsNeedUpdate;
@synthesize moneyFundsNeedUpdate = _moneyFundsNeedUpdate;
@synthesize privateFundsNeedUpdate = _privateFundsNeedUpdate;
@synthesize userActionStatisticsNeedUpload = _userActionStatisticsNeedUpload;

@synthesize sortedNetValuesByDate = _sortedNetValuesByDate;

@synthesize fixedOrderPreference = _fixedOrderPreference;
@synthesize fixedOrderTypePreference = _fixedOrderTypePreference;

@synthesize sortedNetValueOrderPreference = _sortedNetValueOrderPreference;
@synthesize sortedNetValueOrderTypePreference = _sortedNetValueOrderTypePreference;
@synthesize sortedNetValueOrderPreferenceClose = _sortedNetValueOrderPreferenceClose;
@synthesize sortedNetValueOrderTypePreferenceClose = _sortedNetValueOrderTypePreferenceClose;
@synthesize sortedNetValueOrderPreferenceMoney = _sortedNetValueOrderPreferenceMoney;
@synthesize sortedNetValueOrderTypePreferenceMoney = _sortedNetValueOrderTypePreferenceMoney;
@synthesize sortedNetValueOrderPreferencePrivate = _sortedNetValueOrderPreferencePrivate;
@synthesize sortedNetValueOrderTypePreferencePrivate = _sortedNetValueOrderTypePreferencePrivate;

@synthesize dbNeedUpdate = _dbNeedUpdate;
@synthesize needNotifyUpdate = _needNotifyUpdate;

@synthesize tradeEntryUrl = _tradeEntryUrl;
@synthesize coopId = _coopId;

@synthesize notifyToken = _notifyToken;

@synthesize upAndDownInfoArray = _upAndDownInfoArray;

@synthesize appLaunchTimes = _appLaunchTimes;
@synthesize appLastShowTipsLaunchTimes = _appLastShowTipsLaunchTimes;
@synthesize appHasBeencommentated = _appHasBeencommentated;

+ (HBAppConfig*) getInstance {
    if (sAppConfig == nil) {
        @synchronized(self)
        {
            if (sAppConfig == nil) {
                sAppConfig = [[self alloc] init];
                [[HBAutoSaver getInstance] INeedAutoSave:sAppConfig];
            }
        }
    }
    
    return sAppConfig;
}

- (id)init {
    self = [super init];
    if (self) {
        [self setDataSource:self];
        [self loadConfig];
        self.timerConfigChanged = YES;
    }
    
    return self;
}

- (BOOL)importConfig_
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
            if ([importeConfigDic objectForKey:key] != nil) {
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

- (BOOL)importConfig
{
    BOOL importRst = [self importConfig_];
    
    for (id key in self.configInfoDic) {
        @try {
            [self setValue:[self.configInfoDic objectForKey:key] forKeyPath:key];
        }
        @catch (NSException *exception) {
            HBErrorLog(@"key %@ is not in HBAppConfig KeyPath", key);
        }
    }
    
    // 启动软件时，上传行为信息，上传成功后，下次启动软件再上传
    _userActionStatisticsNeedUpload = YES;
    
    return importRst;
}

- (void)saveConfig {
    NSArray *keys = [@"name,version,channel,md5,infomation,research,manager,company,starturl,"
                     "basicinfo,netvalue,dbversion,appid,productid,baseurl,cacheexpiredtime,token,networkVersion,openFundsVersion,closeFundsVersion,privateFundsVersion,moneyFundsVersion,openFundsVersionS,closeFundsVersionS,privateFundsVersionS,moneyFundsVersionS,customFundsVersionS,fixedOrderPreference,fixedOrderTypePreference,fixedLastGetTime,channelId,umengAppKey,imsi,phoneNumber,userName,sortedNetValuesByDate,sortedNetValueOrderPreference,sortedNetValueOrderTypePreference,dbNeedUpdate,needNotifyUpdate,tradeEntryUrl,coopId,notifyToken,upAndDownInfoArray,appLaunchTimes,appLastShowTipsLaunchTimes,appHasBeencommentated,webViewFontSize,appLastShowShare2FriendsTipsLunchTimes,appShow2FriendsTipsHasBeenShowed,showNewFunctions,isSendSmsOn,monitorUserArray,monitorTimerArray,customIDsArray" componentsSeparatedByString:@","];
    self.configInfoDic = [NSMutableDictionary dictionaryWithDictionary:[self dictionaryWithValuesForKeys:keys]];
    
    [super saveConfig];
}

- (NSString *)description {
    NSArray *keys = [@"name,version,channel,md5,infomation,research,manager,company,starturl,basicinfo,netvalue,dbversion,appid,productid,baseurl,cacheexpiredtime,token,networkVersion,openFundsVersion,closeFundsVersion,privateFundsVersion,moneyFundsVersion,openFundsVersionS,closeFundsVersionS,privateFundsVersionS,moneyFundsVersionS,customFundsVersionS,fixedOrderPreference,fixedOrderTypePreference,fixedLastGetTime,channelId,umengAppKey,imsi,phoneNumber,userName,sortedNetValuesByDate,sortedNetValueOrderPreference,sortedNetValueOrderTypePreference,dbNeedUpdate,needNotifyUpdate,tradeEntryUrl,coopId,notifyToken,upAndDownInfoArray,appLaunchTimes,appLastShowTipsLaunchTimes,appHasBeencommentated,webViewFontSize,appLastShowShare2FriendsTipsLunchTimes,appShow2FriendsTipsHasBeenShowed,showNewFunctions,isSendSmsOn,monitorUserArray,monitorTimerArray,customIDsArray" componentsSeparatedByString:@","];
    NSDictionary *dic = [self dictionaryWithValuesForKeys:keys];
    return [dic description];
}

- (BOOL)addUpAndDownInfo:(NSString*)fundID
{
    NSDate* now = [NSDate date];
    
    // 先清理掉超时的
    NSMutableArray* mArray = [NSMutableArray arrayWithArray:self.upAndDownInfoArray];
    for (NSDictionary* dic in mArray) {
        NSDate* date = [dic objectForKey:@"date"];
        // 超过24小时，可以再发
        if ([now timeIntervalSinceDate:date] >= 24*60*60) {
            [mArray removeObject:dic];
        }
        else {
            break;
        }
    }
    
    // 再找有没有针对一支基金的
    for (NSDictionary* dic in mArray) {
        NSString* fid = [dic objectForKey:@"fundID"];
        if ([fid isEqualToString:fundID]) {
            return NO;
        }
    }
    
    // 没有的话，就可以执行踩和顶操作
    NSDictionary* dic = [NSDictionary dictionaryWithObjectsAndKeys:now, @"date", fundID, @"fundID", nil];
    [mArray addObject:dic];
    self.upAndDownInfoArray = mArray;
    
    return YES;
}

#pragma mark - HBDocumentsSaverDataSource functions 
- (NSString*)configFileName
{
    return @"AppConfig.plist";
}

@end

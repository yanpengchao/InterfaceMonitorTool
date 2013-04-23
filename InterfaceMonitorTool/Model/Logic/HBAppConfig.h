//
//  HBAppConfig.h
//  HowbuyFund
//
//  Created by pengchao.yan on 12-9-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HBDocumentsSaver.h"

#define MONITOR_USER_NAME_KEY       @"name"
#define MONITOR_USER_UID_KEY        @"uid"
#define MONITOR_USER_SENDFLAG_KEY   @"sendFlag"

#define MONITOR_TIMER_ON_KEY            @"on"
#define MONITOR_TIMER_WEEKEND_FLAG_KEY  @"weekendFlag"
#define MONITOR_TIMER_DISPLAY_NAME_KEY  @"displayName"
#define MONITOR_TIMER_RUN_TIME_KEY      @"runTime"

@interface HBAppConfig : HBDocumentsSaver <HBDocumentsSaverDataSource>
{
    NSString    *_name;
//    NSNumber    *_version;
    NSString    *_md5;
    NSString    *_channel;
    NSNumber    *_research;
    NSNumber    *_infomation;
    NSString    *_manager;
    NSString    *_company;
    NSString    *_starturl;
    NSString    *_netvalue;
    NSString    *_basicinfo;
    NSString    *_dbversion;
    NSString    *_appid;
    NSString    *_productid;
    NSString    *_baseurl;
    NSNumber    *_cacheexpiredtime;
    NSString    *_token;
    NSString    *_networkVersion;
    
    NSString    *_openFundsVersion;         // 开放式净值版本
    NSString    *_closeFundsVersion;        // 封闭式净值版本
    NSString    *_privateFundsVersion;      // 私募净值版本
    NSString    *_moneyFundsVersion;        // 货币型净值版本
    
    NSString    *_openFundsVersionS;        // 开放式服务器净值版本
    NSString    *_closeFundsVersionS;       // 封闭式服务器净值版本
    NSString    *_privateFundsVersionS;     // 私募服务器净值版本
    NSString    *_moneyFundsVersionS;       // 货币型服务器净值版本
    
    NSString    *_customFundsVersionS;      // 自选基金单多条更新接口
    
    NSNumber    *_fixedOrderPreference;     // 定投排行排序方式偏好
    NSNumber    *_fixedOrderTypePreference; // 定投排行排序类型偏好
    
    NSString    *_fixedLastGetTime;         // 定投排行最后一次获取数据的时间，用于显示在下拉条上
    
    NSString    *_channelId;                // 渠道ID：app store、91、howbuy_ipa
    NSString    *_umengAppKey;              // 友盟 appkey：4e0d38a9431fe34bc7000160
    
    NSString    *_imsi;                     // IMSI--貌似只能通过私有接口才能获取到
    NSString    *_phoneNumber;              // 用户电话号码
    NSString    *_userName;                 // 用户名称
    
    BOOL        _closeFundsNeedUpdate;      // 封闭式净值是否需要更新
    BOOL        _privateFundsNeedUpdate;    // 私募净值是否需要更新
    BOOL        _moneyFundsNeedUpdate;      // 货币型净值是否需要更新
    BOOL        _userActionStatisticsNeedUpload;    // 行为统计信息是否需要上传
    
    BOOL        _sortedNetValuesByDate;     // 将净值按时间分类
    NSNumber    *_sortedNetValueOrderPreference;        // 老的 净值排行排序方式偏好-放开放式
    NSNumber    *_sortedNetValueOrderTypePreference;    // 老的 净值排行排序类型偏好-放开放式
    
    NSNumber    *_sortedNetValueOrderPreferenceClose;       // 净值排行排序方式偏好-封闭式
    NSNumber    *_sortedNetValueOrderTypePreferenceClose;   // 净值排行排序类型偏好-封闭式
    NSNumber    *_sortedNetValueOrderPreferenceMoney;       // 净值排行排序方式偏好-货币型
    NSNumber    *_sortedNetValueOrderTypePreferenceMoney;   // 净值排行排序类型偏好-货币型
    NSNumber    *_sortedNetValueOrderPreferencePrivate;     // 净值排行排序方式偏好-私募
    NSNumber    *_sortedNetValueOrderTypePreferencePrivate; // 净值排行排序类型偏好-私募
    
    BOOL        _dbNeedUpdate;
    BOOL        _needNotifyUpdate;
    
    NSString*   _tradeEntryUrl;
    NSString*   _coopId;
    
    NSString*   _notifyToken;
    
    NSArray*    _upAndDownInfoArray;
    
    NSNumber* _appLaunchTimes;
    NSNumber* _appLastShowTipsLaunchTimes;
    BOOL _appHasBeencommentated;
}

@property (nonatomic, copy) NSString *name, *channel, *md5;
//@property (nonatomic, copy) NSNumber *version;
@property (nonatomic, copy) NSNumber *infomation;
@property (nonatomic, copy) NSNumber *research;
@property (nonatomic, copy) NSString *manager;
@property (nonatomic, copy) NSString *company;
@property (nonatomic, copy) NSString *starturl;
@property (nonatomic, copy) NSString *baseurl;
@property (nonatomic, copy) NSString *basicinfo;
@property (nonatomic, copy) NSString *netvalue;
@property (nonatomic, copy) NSString *dbversion;
@property (nonatomic, copy) NSString *appid;//itunes id, dont use currently...
@property (nonatomic, copy) NSString *productid;
@property (nonatomic, copy) NSNumber *cacheexpiredtime;
@property (nonatomic, copy) NSString *token;
@property (nonatomic, copy) NSString *networkVersion;

@property (nonatomic, copy) NSString *openFundsVersion;
@property (nonatomic, copy) NSString *closeFundsVersion;
@property (nonatomic, copy) NSString *privateFundsVersion;
@property (nonatomic, copy) NSString *moneyFundsVersion;

@property (nonatomic, copy) NSString *openFundsVersionS;
@property (nonatomic, copy) NSString *closeFundsVersionS;
@property (nonatomic, copy) NSString *privateFundsVersionS;
@property (nonatomic, copy) NSString *moneyFundsVersionS;
@property (nonatomic, copy) NSString *customFundsVersionS;

@property (nonatomic, copy) NSString *fixedLastGetTime;

@property (nonatomic, copy) NSString *channelId;
@property (nonatomic, copy) NSString *umengAppKey;

@property (nonatomic, copy) NSString *imsi;
@property (nonatomic, copy) NSString *phoneNumber;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic) BOOL sortedNetValuesByDate;

@property (nonatomic, copy)NSNumber* fixedOrderPreference;
@property (nonatomic, copy)NSNumber* fixedOrderTypePreference;

@property (nonatomic, copy)NSNumber* sortedNetValueOrderPreference;
@property (nonatomic, copy)NSNumber* sortedNetValueOrderTypePreference;
@property (nonatomic, copy)NSNumber* sortedNetValueOrderPreferenceClose;
@property (nonatomic, copy)NSNumber* sortedNetValueOrderTypePreferenceClose;
@property (nonatomic, copy)NSNumber* sortedNetValueOrderPreferenceMoney;
@property (nonatomic, copy)NSNumber* sortedNetValueOrderTypePreferenceMoney;
@property (nonatomic, copy)NSNumber* sortedNetValueOrderPreferencePrivate;
@property (nonatomic, copy)NSNumber* sortedNetValueOrderTypePreferencePrivate;

@property (nonatomic) BOOL dbNeedUpdate;
@property (nonatomic) BOOL needNotifyUpdate;

@property (nonatomic, copy)NSString* tradeEntryUrl;
@property (nonatomic, copy)NSString* coopId;

@property (nonatomic, copy)NSString* notifyToken;

@property (nonatomic, copy)NSArray* upAndDownInfoArray;

@property (nonatomic, copy)NSNumber* appLaunchTimes;
@property (nonatomic, copy)NSNumber* appLastShowTipsLaunchTimes;
@property (nonatomic)BOOL appHasBeencommentated;

@property (nonatomic, copy) NSNumber* webViewFontSize;      // 新闻资讯网页字体
@property (nonatomic, copy) NSNumber* appLastShowShare2FriendsTipsLunchTimes;   // 显示分享好友提醒的次数
@property (nonatomic) BOOL appShow2FriendsTipsHasBeenShowed;  // 是否已经分享过给好友？
@property (nonatomic) BOOL showNewFunctions;    // 显示新功能

@property (nonatomic) BOOL isSendSmsOn;   // 是否发送短信
@property (nonatomic, copy) NSArray* monitorUserArray;
@property (nonatomic, copy) NSArray* monitorTimerArray;
@property (nonatomic, copy) NSArray* customIDsArray;

// 以下配置不入库，当全局变量用
@property (nonatomic) BOOL closeFundsNeedUpdate;
@property (nonatomic) BOOL privateFundsNeedUpdate;
@property (nonatomic) BOOL moneyFundsNeedUpdate;
@property (nonatomic) BOOL userActionStatisticsNeedUpload;
@property (nonatomic) BOOL timerConfigChanged;

+ (HBAppConfig*) getInstance;

// 添加成功，则可以执行踩和顶操作
- (BOOL)addUpAndDownInfo:(NSString*)fundID;

@end

//
//  HBPrepareRequest.m
//  HowbuyFund
//
//  Created by pengchao.yan on 12-9-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HBPrepareRequest.h"
#import "ASIFormDataRequest.h"
#import "HBAppConfig.h"
#import "UIDevice+Platform.h"
#import "SBJsonWriter.h"
#import "SBJson.h"
#import "HBDataManager.h"
#import "HBSimpleFunctionsDef.h"

typedef struct _MessageInfo_T{
    EMessageID  eMessageID;
    NSString*   url;
}MessageInfo_T;

static MessageInfo_T sAllMessages[] = {
    {eMessageIDStart,                       @"start/datasynchronize.protobuf"},
    {eMessageIDCheckAppUpdate,              @"start/checkupdate.protobuf"},
    
    {eMessageIDCustomFundSynchronize,       @"favfund/datasynchronize.protobuf"},
    {eMessageIDLogin,                       @"login/login.protobuf"},
    {eMessageIDRegisterCode,                @"register/register.protobuf"},
    {eMessageIDRegister,                    @"register/register.protobuf"},
    
    {eMessageIDGetNewsByType,               @"news/listbytype.protobuf"},
    {eMessageIDGetNewsByKey,                @"news/listbytag.protobuf"},
    {eMessageIDGetResearchByType,           @"opinion/listbytype.protobuf"},
    {eMessageIDGetResearchByKey,            @"opinion/listbytag.protobuf"},
    {eMessageIDGetNewsAndResearchByKey,     @"query/newsandopinion.protobuf"},
    
    {eMessageIDGetFundContentLineChart,     @"nav/duration.protobuf"},
    {eMessageIDGetFundContentF10,           @""},   // F10 的URL有很多个，放在配置文件里
    {eMessageIDGetFundPerformance,          @"ften/yjbx/yjbx.protobuf"},    // 业绩表现
    
    {eMessageIDShare2Friends,               @"mgm/addmgm.protobuf"},
    {eMessageIDFeedBack,                    @"feedback/addfeedback.protobuf"},
    {eMessageIDSendUserActions,             @"behavior/addbehavior.protobuf"},
    {eMessageIDSendNotifyToken,             @"device/addDevice.protobuf"},
    {eMessageIDUploadContact,               @"common/uploadContactInfo.htm"},
    
    {eMessageIDUpdateManagerInfo,           @"manager/infoupdate.protobuf"},
    {eMessageIDUpdateCompanyInfo,           @"company/infoupdate.protobuf"},
    {eMessageIDUpdateFundsBasicInfo,        @"fund/infoupdate.protobuf"},
    
    {eMessageIDGetOpenFundNetValue,         @"start/updatebytype.protobuf"},
    {eMessageIDGetCloseFundNetValue,        @"start/updatebytype.protobuf"},
    {eMessageIDGetMoneyFundNetValue,        @"start/updatebytype.protobuf"},
    {eMessageIDGetPrivateFundNetValue,      @"start/updatebytype.protobuf"},
    {eMessageIDGetFundNetValueByIDs,        @"start/navinfoquery.protobuf"},
    {eMessageIDGetFixedInvestOderByPage,    @"fund/fundfixed.protobuf"},
    
    {eMessageIDUpOrDown,                    @"updown/addupdown.protobuf"},
    {eMessageIDGetUpOrDownCount,            @"updown/queryupdown.protobuf"},
    {eMessageIDSendComment,                 @"comments/commentadd.protobuf"},
    {eMessageIDGetCommentByPage,            @"comments/fundcommentlist.protobuf"},
    {eMessageIDGetCommentByTimestamp,       @"comments/fundcommentlist.protobuf"},
    
    {eMessageIDGetTrustList,                @"trust/list.protobuf"},
    {eMessageIDGetTrustContent,             @"trust/detail.protobuf"},
    {eMessageIDAppointTrust,                @"trust/preContract.protobuf"},
    {eMessageIDGetTrustByPage,              @"trust/listPage.protobuf"},
    {eMessageIDDingYue,                     @"common/addbook.htm"}
};

@interface HBPrepareRequest ()

+ (NSString*) getSubUrlByMessageID:(EMessageID)messageID;
+ (void) addProductInfoForRequest:(ASIFormDataRequest*)request withInfo:(NSDictionary*)userInfo;
+ (void) prepareMainRequest:(ASIFormDataRequest*)request withInfo:(NSDictionary*)userInfo;

@end

@implementation HBPrepareRequest

+ (NSString*) getSubUrlByMessageID:(EMessageID)messageID
{
    if (messageID > eMessageIDUnknown && messageID < eMessageIDMax) {
        int count = sizeof(sAllMessages)/sizeof(sAllMessages[0]);
        for (int i = 0 ; i < count ; i ++) {
            if (sAllMessages[i].eMessageID == messageID) {
                return sAllMessages[i].url;
            }
        }
    }
    
    return nil;
}

+ (ASIHTTPRequest*)prepareWithParameter:(NSDictionary*)parameterInfoDic forMessage:(EMessageID)messageID
{
    NSString* subUrl = [HBPrepareRequest getSubUrlByMessageID:messageID];
    if (messageID == eMessageIDGetFundContentF10) {
        NSString *fundF10URLPath = [parameterInfoDic objectForKey:@"urlPath"];
        subUrl = fundF10URLPath;
    }
    
    NSString* url = nil;
    if (messageID == eMessageIDMax) {
        url = [NSString stringWithFormat:@"%@%@", @"http://192.168.106.201:8082/hws/", subUrl];
    }
//    else if (messageID == eMessageIDDingYue || messageID == eMessageIDGetFundPerformance)
//    {
//        url = [NSString stringWithFormat:@"%@%@", @"http://192.168.106.201:8082/hws_newest/", subUrl];
//    }
//    else if (messageID == eMessageIDCheckAppUpdate || messageID == eMessageIDUpdateFundsBasicInfo || messageID == eMessageIDGetFundContentLineChart || messageID == eMessageIDGetNewsByType || messageID == eMessageIDGetResearchByType || messageID == eMessageIDGetFundNetValueByIDs)
//    else
//    {   // http://192.168.106.201:8082/hws_newest/
//        url = [NSString stringWithFormat:@"%@%@", @"http://192.168.106.184:8080/hws/", subUrl];
//    }
    else
    {
        url = [NSString stringWithFormat:@"%@%@", [[HBAppConfig getInstance] baseurl], subUrl];
    }
    ASIFormDataRequest* request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:url]];
    switch (messageID) {
        case eMessageIDStart:
        {
            [self prepareMainRequest:request withInfo:parameterInfoDic];
        }
            break;
        case eMessageIDCustomFundSynchronize:
        {
            [self prepareSyncCustomPageRequest:request withInfo:parameterInfoDic];
        }
            break;
        case eMessageIDLogin:
        {
            [self prepareLoginRequest:request withInfo:parameterInfoDic];
        }
            break;
        case eMessageIDGetFundContentF10:
        {
            [self prepareF10ContentRequest:request withInfo:parameterInfoDic];
        }
            break;
        case eMessageIDSendUserActions:
        {
            [self prepareSendUserActionsRequest:request withInfo:parameterInfoDic];
        }
            break;
        case eMessageIDUpdateManagerInfo:
        {
            [self prepareUpdateManagerRequest:request withInfo:parameterInfoDic];
        }
            break;
        case eMessageIDUpdateCompanyInfo:
        {
            [self prepareUpdateCompanyRequest:request withInfo:parameterInfoDic];
        }
            break;
        case eMessageIDUpdateFundsBasicInfo:
        {
            [self prepareUpdateFundsInfoRequest:request withInfo:parameterInfoDic];
        }
            break;
        case eMessageIDGetFundNetValueByIDs:
        {
            [self prepareGetFundNetValueByIDsRequest:request withInfo:parameterInfoDic];
        }
            break;
        case eMessageIDUploadContact:
        {
            [self prepareUploadContactsRequest:request withInfo:parameterInfoDic];
        }
            break;
        case eMessageIDCheckAppUpdate:
        case eMessageIDRegisterCode:
        case eMessageIDRegister:
        case eMessageIDGetNewsByType:
        case eMessageIDGetNewsByKey:
        case eMessageIDGetResearchByType:
        case eMessageIDGetResearchByKey:
        case eMessageIDGetNewsAndResearchByKey:
        case eMessageIDGetFundContentLineChart:
        case eMessageIDGetFundPerformance:
        case eMessageIDShare2Friends:
        case eMessageIDFeedBack:
        case eMessageIDSendNotifyToken:
        case eMessageIDGetOpenFundNetValue:
        case eMessageIDGetCloseFundNetValue:
        case eMessageIDGetMoneyFundNetValue:
        case eMessageIDGetPrivateFundNetValue:
        case eMessageIDGetFixedInvestOderByPage:
        case eMessageIDUpOrDown:
        case eMessageIDGetUpOrDownCount:
        case eMessageIDSendComment:
        case eMessageIDGetCommentByPage:
        case eMessageIDGetCommentByTimestamp:
//        case eMessageIDGetTrustList:
        case eMessageIDGetTrustContent:
        case eMessageIDAppointTrust:
        case eMessageIDGetTrustByPage:
        case eMessageIDDingYue:
        {
            [self addProductInfoForRequest:request withInfo:parameterInfoDic];
        }
            break;
        default:
            break;
    }
    return request;
}

+ (void) addProductInfoForRequest:(ASIFormDataRequest*)request withInfo:(NSDictionary*)userInfo
{
    UIDevice *device    = [UIDevice currentDevice];
    NSString *platform  = device.platform;
    
    HBAppConfig *cfg    = [HBAppConfig getInstance];
    NSString *appver    = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleVersionKey];
    NSString *channel   = cfg.channel;
    NSString *product   = cfg.productid;
    NSString *networkVersion = cfg.networkVersion;
    NSString *token = cfg.token;
    if (fHBIfStringInvalid(token))
    {
        CFUUIDRef uuidRef = CFUUIDCreate(NULL);
        CFStringRef uuidStringRef = CFUUIDCreateString(NULL, uuidRef);
        CFRelease(uuidRef);
        NSString *uuid = [NSString stringWithString:(NSString *)uuidStringRef];
        CFRelease(uuidStringRef);
        cfg.token = uuid;
//        CFUUIDRef theUUID = CFUUIDCreate(NULL);
//        CFStringRef string = CFUUIDCreateString(NULL, theUUID);
//        CFRelease(theUUID);
//        token = (NSString *)string;
//        cfg.token = token;
    }
    
    [request setPostValue:appver    forKey:@"version"];
    [request setPostValue:channel   forKey:@"channelId"];
    [request setPostValue:product   forKey:@"productId"];
    [request setPostValue:@"iPhone" forKey:@"parPhoneModel"];
    [request setPostValue:platform  forKey:@"subPhoneModel"];
    [request setPostValue:networkVersion forKey:@"iVer"];
    [request setPostValue:cfg.token forKey:@"token"];
    
    for (NSString *key in userInfo) {
        [request setPostValue:[userInfo objectForKey:key] forKey:key];
    }
}

+ (void) prepareMainRequest:(ASIFormDataRequest*)request withInfo:(NSDictionary*)userInfo
{
    HBAppConfig *appCfg = [HBAppConfig getInstance];
    
    [request setPostValue:appCfg.basicinfo  forKey:@"basicInfoVer"];
    [request setPostValue:appCfg.openFundsVersion forKey:@"kfsVer"];
    [request setPostValue:appCfg.closeFundsVersion forKey:@"fbsVer"];
    [request setPostValue:appCfg.moneyFundsVersion forKey:@"hbsVer"];
    [request setPostValue:appCfg.privateFundsVersion forKey:@"smVer"];
    [request setPostValue:appCfg.manager    forKey:@"managerVer"];
    [request setPostValue:appCfg.company    forKey:@"companyVer"];
    [request setPostValue:appCfg.infomation forKey:@"newsTypeVer"];
    [request setPostValue:appCfg.research   forKey:@"opinionTypeVer"];
    
    [self addProductInfoForRequest:request withInfo:userInfo];
}

+ (void) prepareSyncCustomPageRequest:(ASIFormDataRequest*)request withInfo:(NSDictionary*)userInfo
{
    SBJsonWriter *writer = [[SBJsonWriter alloc] init];
    NSString *jsonObject = [writer stringWithObject:userInfo];
    
    NSMutableData *data = [NSMutableData dataWithData:[jsonObject dataUsingEncoding:NSUTF8StringEncoding]];
    [request setPostBody:data];
    
    [writer release];
}

+ (void) prepareLoginRequest:(ASIFormDataRequest*)request withInfo:(NSDictionary*)userInfo
{
    HBAppConfig *appCfg = [HBAppConfig getInstance];
    [request setPostValue:appCfg.channel forKey:@"channeIdId"];
    [request setPostValue:@"0.1" forKey:@"version"];
    
    [self addProductInfoForRequest:request withInfo:userInfo];
}

+ (void) prepareF10ContentRequest:(ASIFormDataRequest*)request withInfo:(NSDictionary*)userInfo
{
    for (NSString *key in userInfo) {
        if ([key isEqualToString:@"urlPath"]) {
            continue;
        }
        [request setPostValue:[userInfo objectForKey:key] forKey:key];
    }
}

+ (void) prepareUpdateManagerRequest:(ASIFormDataRequest*)request withInfo:(NSDictionary*)userInfo
{
    HBAppConfig *appCfg = [HBAppConfig getInstance];
    [request setPostValue:appCfg.manager forKey:@"managerInfoVer"];
}

+ (void) prepareUpdateCompanyRequest:(ASIFormDataRequest*)request withInfo:(NSDictionary*)userInfo
{
    HBAppConfig *appCfg = [HBAppConfig getInstance];
    [request setPostValue:appCfg.company forKey:@"companyInfoVer"];
}

+ (void) prepareUpdateFundsInfoRequest:(ASIFormDataRequest*)request withInfo:(NSDictionary*)userInfo
{
    HBAppConfig *appCfg = [HBAppConfig getInstance];
    [request setPostValue:appCfg.basicinfo   forKey:@"fundInfoVer"];
}

+ (void) prepareSendUserActionsRequest:(ASIFormDataRequest*)request withInfo:(NSDictionary*)userInfo
{
//    SBJsonWriter *writer = [[SBJsonWriter alloc] init];
//    
//    NSArray *array = [userInfo objectForKey:@"actions"];
//    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObject:array forKey:@"infoList"];
//    NSString *jsonObject = [writer stringWithObject:dic];
//    
//    NSMutableData *data = [NSMutableData dataWithData:[jsonObject dataUsingEncoding:NSUTF8StringEncoding]];
//    [request setPostBody:data];
//    [writer release];
    SBJsonWriter *writer = [[SBJsonWriter alloc] init];
    
    NSArray *array = [userInfo objectForKey:@"actions"];
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObject:array forKey:@"infoList"];
    
    HBAppConfig *cfg    = [HBAppConfig getInstance];
    UIDevice *device    = [UIDevice currentDevice];
    [dic setObject:cfg.version      forKey:@"version"];
    [dic setObject:cfg.channel      forKey:@"channelId"];
    [dic setObject:cfg.productid    forKey:@"productId"];
    [dic setObject:@"iPhone"        forKey:@"parPhoneModel"];
    [dic setObject:device.platform  forKey:@"subPhoneModel"];
    
    NSString *jsonObject = [writer stringWithObject:dic];
    
    NSMutableData *data = [NSMutableData dataWithData:[jsonObject dataUsingEncoding:NSUTF8StringEncoding]];
    [request setPostBody:data];
    
    [writer release];
    
    [self addProductInfoForRequest:request withInfo:nil];
}

+ (void) prepareGetFundNetValueByIDsRequest:(ASIFormDataRequest*)request withInfo:(NSDictionary*)userInfo
{
    NSArray* ids = [userInfo objectForKey:@"fundCodes"];
    NSMutableString* idsString = [[NSMutableString alloc] init];
    for (NSString *key in ids) {
        if (![idsString isEqualToString:@""]) {
            [idsString appendString:@"-"];
        }
        [idsString appendString:key];
    }
    
    [request addPostValue:idsString forKey:@"fundCode"];
    [idsString release];
    
    [self addProductInfoForRequest:request withInfo:nil];
}

+ (void) prepareUploadContactsRequest:(ASIFormDataRequest*)request withInfo:(NSDictionary*)userInfo
{
    NSData* data = [userInfo objectForKey:@"data"];
    [request setPostBody:[NSMutableData dataWithData:data]];
//    [self addProductInfoForRequest:request withInfo:nil];
}

@end

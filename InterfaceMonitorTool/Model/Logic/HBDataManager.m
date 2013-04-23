//
//  HBDataManager.m
//  HowbuyFund
//
//  Created by pengchao.yan on 12-9-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HBDataManager.h"
#import "HBPrepareRequest.h"
#import "ASINetworkQueue.h"
#import "ASIHTTPRequest.h"
#import "HBParseNetworkData.h"
#import "HBDefine.h"
#import "HBAppConfig.h"
#import "HBTools.h"
#import "HBBufferKey.h"
#import "HBBufferManager.h"
#import "HBFeiXin.h"
#import "HBFileLog.h"

#define REQUEST_TAG_KEY @"requestTag"
#define DELEGATE_KEY    @"delegate"

static HBDataManager* sDataManager = nil;

@interface HBDataManager ()
{
    //
}
- (void)requestStarted:(ASIHTTPRequest *)request;
- (void)requestFinished:(ASIHTTPRequest *)request;
- (void)requestFailed:(ASIHTTPRequest *)request;

- (NSDictionary*)dealWithNetData:(ASIHTTPRequest *)request;
- (void)dealWithStartData:(NSDictionary*)dic;
- (void)dealWithNetValueData:(NSDictionary*)dic;
- (void)dealWithFundsInfoData:(NSDictionary*)dic;
- (void)dealWithManagerInfoData:(NSDictionary*)dic;
- (void)dealWithCompanyInfoData:(NSDictionary*)dic;
- (void)dealWIthCustomFundsCodeData:(NSDictionary*)dic;
- (void)dealWIthNewsAndResearchInfoData:(NSDictionary*)dic;
- (NSDictionary*)dealWithFundContentLineChartData:(NSDictionary*)dic;

@end

@implementation HBDataManager
@synthesize delegateArray = _delegateArray;
@synthesize netWorkQueue = _netWorkQueue;
@synthesize taskQueue = _taskQueue;

+ (HBDataManager*) getInstance
{
    if (sDataManager == nil) {
        @synchronized(self)
        {
            if (sDataManager == nil) {
                sDataManager = [[self alloc] init];
                NSMutableArray* tda = [[NSMutableArray alloc] init];
                sDataManager.delegateArray = tda;
                [tda release];
                sDataManager.netWorkQueue = [ASINetworkQueue queue];
                sDataManager.taskQueue = dispatch_queue_create("taskQueue", NULL);
            }
        }
    }
    
    return sDataManager;
}

- (void)addDelegate:(id<HBDataManagerDelegate>)delegate forRequestTag:(NSInteger)requestTag
{
    @synchronized(_delegateArray)
    {
        // 先看看是否已经添加该请求了，有了的话，不重复添加
        for (NSDictionary* item in _delegateArray) {
            if ([[item objectForKey:REQUEST_TAG_KEY] intValue] == requestTag && [item objectForKey:DELEGATE_KEY] == delegate) {
                return;
            }
        }
        
        NSDictionary* dic = [NSDictionary dictionaryWithObjectsAndKeys:delegate, DELEGATE_KEY, [NSNumber numberWithInteger:requestTag], REQUEST_TAG_KEY, nil];
        [_delegateArray addObject:dic];
    }
}

- (void)delDelegateByRequestTag:(NSInteger)requestTag
{
    @synchronized(_delegateArray)
    {
        for (int i = 0 ; i < [_delegateArray count] ; ) {
            NSDictionary* dic = [_delegateArray objectAtIndex:i];
            if ([[dic objectForKey:REQUEST_TAG_KEY] intValue] == requestTag) {
                [_delegateArray removeObject:dic];
            }
            else {
                i ++;
            }
        }
    }
}

- (void)delDelegate:(id<HBDataManagerDelegate>)delegate  withTag:(NSInteger)requestTag
{
    int64_t delayInSeconds = 0.2;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        @synchronized(_delegateArray)
        {
            for (int i = 0 ; i < [_delegateArray count] ; ) {
                NSDictionary* dic = [_delegateArray objectAtIndex:i];
                if ([dic objectForKey:DELEGATE_KEY] == delegate && requestTag == [[dic objectForKey:REQUEST_TAG_KEY] intValue]) {
                    [_delegateArray removeObject:dic];
                }
                else {
                    i ++;
                }
            }
        }
    });
}

- (ASIHTTPRequest*)requestNetWork:(EMessageID)type withParams:(NSDictionary*)paramsDic
{
    @autoreleasepool {
        if (![HBTools isNetWorkEnable]) {
            [self tryToLoadBufferDataForType:type withParams:paramsDic];
            return nil;
        }
        
        [HBTools printTimeNow:[NSString stringWithFormat:@"requestNetWork : %d", type]];
        
        // 如果该请求已经发出了，则不再次重发
        for (ASIHTTPRequest* request in [_netWorkQueue operations]) {
            if ([[[request userInfo] objectForKey:REQUEST_TAG_KEY] intValue] == type) {
                return request;
            }
        }
        
        ASIHTTPRequest* request = [HBPrepareRequest prepareWithParameter:paramsDic forMessage:type];
        
        request.responseEncoding = NSUTF8StringEncoding;
        request.numberOfTimesToRetryOnTimeout = KHBNetworkRetryCount;
        request.timeOutSeconds = KHBNetworkTimeOut;
        request.delegate = self;
        request.didStartSelector = @selector(requestStarted:);
        request.didFailSelector = @selector(requestFailed:);
        request.didFinishSelector = @selector(requestFinished:);
        
        NSMutableDictionary* dic = [NSMutableDictionary dictionaryWithDictionary:paramsDic];
        [dic setValue:[NSNumber numberWithInt:type] forKey:REQUEST_TAG_KEY];
        [request setUserInfo:dic];
        
        [_netWorkQueue addOperation:request];
        [_netWorkQueue go];
        
        return request;
    }
}

- (ASIHTTPRequest*)requestNetWork:(EMessageID)type withParams:(NSDictionary*)paramsDic withCheckReSend:(BOOL)check
{
    @autoreleasepool {
        if (![HBTools isNetWorkEnable]) {
            [self tryToLoadBufferDataForType:type withParams:paramsDic];
            return nil;
        }
        
        [HBTools printTimeNow:[NSString stringWithFormat:@"requestNetWork : %d", type]];
        
        // 如果该请求已经发出了，则不再次重发
        if (check) {
            for (ASIHTTPRequest* request in [_netWorkQueue operations]) {
                if ([[[request userInfo] objectForKey:REQUEST_TAG_KEY] intValue] == type) {
                    return request;
                }
            }
        }
        
        ASIHTTPRequest* request = [HBPrepareRequest prepareWithParameter:paramsDic forMessage:type];
        
        request.responseEncoding = NSUTF8StringEncoding;
        request.numberOfTimesToRetryOnTimeout = KHBNetworkRetryCount;
        request.timeOutSeconds = KHBNetworkTimeOut;
        request.delegate = self;
        request.didStartSelector = @selector(requestStarted:);
        request.didFailSelector = @selector(requestFailed:);
        request.didFinishSelector = @selector(requestFinished:);
        
        NSMutableDictionary* dic = [NSMutableDictionary dictionaryWithDictionary:paramsDic];
        [dic setValue:[NSNumber numberWithInt:type] forKey:REQUEST_TAG_KEY];
        [request setUserInfo:dic];
        
        [_netWorkQueue addOperation:request];
        [_netWorkQueue go];
        
        return request;
    }
}

- (ASIHTTPRequest*)requestNetWork:(EMessageID)type withParams:(NSDictionary*)paramsDic delegate:(id)delegate finishSelector:(SEL)finish failSelector:(SEL)fail
{
    @autoreleasepool {
        if (![HBTools isNetWorkEnable]) {
            return nil;
        }
        
        [HBTools printTimeNow:[NSString stringWithFormat:@"requestNetWork : %d", type]];
        
        // 如果该请求已经发出了，则不再次重发
        for (ASIHTTPRequest* request in [_netWorkQueue operations]) {
            if ([[[request userInfo] objectForKey:REQUEST_TAG_KEY] intValue] == type) {
                return request;
            }
        }
        
        ASIHTTPRequest* request = [HBPrepareRequest prepareWithParameter:paramsDic forMessage:type];
        
        request.responseEncoding = NSUTF8StringEncoding;
        request.numberOfTimesToRetryOnTimeout = KHBNetworkRetryCount;
        request.timeOutSeconds = KHBNetworkTimeOut;
        request.delegate = delegate;
        request.didFailSelector = finish;
        request.didFinishSelector = fail;
        
        NSMutableDictionary* dic = [NSMutableDictionary dictionaryWithDictionary:paramsDic];
        [dic setValue:[NSNumber numberWithInt:type] forKey:REQUEST_TAG_KEY];
        [request setUserInfo:dic];
        
        [_netWorkQueue addOperation:request];
        [_netWorkQueue go];
        
        return request;
    }
}

- (ASIHTTPRequest*)request:(ASIHTTPRequest*)request withParams:(NSDictionary*)paramsDic delegate:(id)delegate finishSelector:(SEL)finish failSelector:(SEL)fail
{
    @autoreleasepool {
        if (![HBTools isNetWorkEnable]) {
//            [BWStatusBarOverlay showSuccessWithMessage:@"当前网络不可用" duration:3.0 animated:YES];
            
            return nil;
        }
        
        request.responseEncoding = NSUTF8StringEncoding;
        request.numberOfTimesToRetryOnTimeout = KHBNetworkRetryCount;
        request.timeOutSeconds = KHBNetworkTimeOut;
        request.delegate = delegate;
        request.didFailSelector = fail;
        request.didFinishSelector = finish;
        
        NSMutableDictionary* dic = [NSMutableDictionary dictionaryWithDictionary:request.userInfo];
        if (paramsDic != nil) {
            [dic addEntriesFromDictionary:paramsDic];
        }
        [request setUserInfo:dic];
        
        [_netWorkQueue addOperation:request];
        [_netWorkQueue go];
        
        return request;
    }
}

- (BOOL)cancelRequestByType:(EMessageID)type
{
    for (ASIHTTPRequest* request in [_netWorkQueue operations]) {
        if ([[[request userInfo] objectForKey:REQUEST_TAG_KEY] intValue] == type) {
            [request cancel];
            return YES;
        }
    }
    
    return NO;
}

- (BOOL)cancelRequest:(ASIHTTPRequest*)request
{
    if ([[_netWorkQueue operations] containsObject:request]) {
        [request cancel];
        return YES;
    }
    
    return NO;
}

- (void)notifyStarted:(ASIHTTPRequest *)request
{
    @synchronized(_delegateArray)
    {
        int requestTag = [[[request userInfo] objectForKey:REQUEST_TAG_KEY] intValue];
        for (id dic in _delegateArray) {
            if ([[dic objectForKey:REQUEST_TAG_KEY] intValue] == requestTag) {
                id delegate = [dic objectForKey:DELEGATE_KEY];
                if (delegate != nil && [delegate respondsToSelector:@selector(requestStarted:withTag:)])
                {
                    [delegate requestStarted:request withTag:requestTag];
                }
            }
        }
    }
}

- (void)requestStarted:(ASIHTTPRequest *)request
{
    @autoreleasepool {
        int requestTag = [[[request userInfo] objectForKey:REQUEST_TAG_KEY] intValue];
        [HBTools printTimeNow:[NSString stringWithFormat:@"requestStarted : %d", requestTag]];
        
        [self performSelectorOnMainThread:@selector(notifyStarted:) withObject:request waitUntilDone:NO];
    }
}

- (void)notifyFinished:(NSDictionary *)requestDic
{
    @autoreleasepool {
        NSDictionary* parsedDic  = [requestDic objectForKey:@"parsedDic"];
        ASIHTTPRequest* request = [requestDic objectForKey:@"request"];
        @synchronized(_delegateArray)
        {
            int requestTag = [[parsedDic objectForKey:REQUEST_TAG_KEY] intValue];
            for (id dic in _delegateArray) {
                if ([[dic objectForKey:REQUEST_TAG_KEY] intValue] == requestTag) {
                    id delegate = [dic objectForKey:DELEGATE_KEY];
                    if (delegate != nil && [delegate respondsToSelector:@selector(requestFinished:withData:andTag:)])
                    {
                        [delegate requestFinished:request withData:parsedDic andTag:requestTag];
                    }
                }
            }
        }
    }
}

- (void)_requestFinished:(ASIHTTPRequest *)request
{
    @autoreleasepool {
        NSDictionary* parsedDic = [self dealWithNetData:request];
        NSMutableDictionary* tempDic = [NSMutableDictionary dictionaryWithDictionary:parsedDic];
        if (request != nil) {
            [tempDic addEntriesFromDictionary:[request userInfo]];
        }
        NSDictionary* dic = [NSDictionary dictionaryWithObjectsAndKeys:tempDic, @"parsedDic", request, @"request", nil];
        
        [self performSelectorOnMainThread:@selector(notifyFinished:) withObject:dic waitUntilDone:NO];
    }
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    @autoreleasepool {
        int requestTag = [[[request userInfo] objectForKey:REQUEST_TAG_KEY] intValue];
        [HBTools printTimeNow:[NSString stringWithFormat:@"requestFinished : %d", requestTag]];
        
        [NSThread detachNewThreadSelector:@selector(_requestFinished:) toTarget:self withObject:request];
    }
}

- (void)nofityFailed:(ASIHTTPRequest *)request
{
    @autoreleasepool {
        @synchronized(_delegateArray)
        {
            int requestTag = [[[request userInfo] objectForKey:REQUEST_TAG_KEY] intValue];
            for (id dic in _delegateArray) {
                if ([[dic objectForKey:REQUEST_TAG_KEY] intValue] == requestTag) {
                    id delegate = [dic objectForKey:DELEGATE_KEY];
                    if (delegate != nil && [delegate respondsToSelector:@selector(requestFailed:withTag:)])
                    {
                        [delegate requestFailed:request withTag:requestTag];
                    }
                }
            }
        }
    }
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    @autoreleasepool {
        int requestTag = [[[request userInfo] objectForKey:REQUEST_TAG_KEY] intValue];
        [HBTools printTimeNow:[NSString stringWithFormat:@"requestFailed : %d", requestTag]];
        
        [self performSelectorOnMainThread:@selector(nofityFailed:) withObject:request waitUntilDone:NO];
    }
}

- (NSDictionary*)dealWithNetData:(ASIHTTPRequest *)request
{
    if (request != nil && [request responseStatusCode] == 200) {
        int requestTag = [[[request userInfo] objectForKey:REQUEST_TAG_KEY] intValue];
        NSData* responseData = [request responseData];
        NSDictionary* parsedDic = [HBParseNetworkData parseRequest:request withData:responseData forMessageType:requestTag];
        
        switch (requestTag) {
            case eMessageIDStart:
            {
                [self dealWithStartData:parsedDic];
            }
                break;
            case eMessageIDGetOpenFundNetValue:
            case eMessageIDGetCloseFundNetValue:
            case eMessageIDGetPrivateFundNetValue:
            case eMessageIDGetMoneyFundNetValue:
            case eMessageIDGetFundNetValueByIDs:
            {
                [self dealWithNetValueData:parsedDic];
            }
                break;
            case eMessageIDUpdateFundsBasicInfo:
            {
                [self dealWithFundsInfoData:parsedDic];
            }
                break;
            case eMessageIDUpdateManagerInfo:
            {
                [self dealWithManagerInfoData:parsedDic];
            }
                break;
            case eMessageIDUpdateCompanyInfo:
            {
                [self dealWithCompanyInfoData:parsedDic];
            }
                break;
            case eMessageIDCustomFundSynchronize:
            {
                [self dealWIthCustomFundsCodeData:parsedDic];
            }
                break;
            case eMessageIDGetNewsByType:
            case eMessageIDGetResearchByType:
            {
                [self dealWIthNewsAndResearchInfoData:parsedDic];
            }
                break;
            case eMessageIDGetFundContentLineChart:
            {
                parsedDic = [self dealWithFundContentLineChartData:parsedDic];
            }
                break;
            case eMessageIDGetTrustByPage:
            {
                NSNumber* currentPage = [parsedDic objectForKey:@"currentPage"];
                if ([currentPage intValue] == 1) {
                    HBBufferKey* bufferKey = [[HBBufferKey alloc] initWithMessageID:eMessageIDGetTrustByPage andParameters:parsedDic];
                    [HBBufferManager saveBuffer:responseData withKey:bufferKey];
                    [bufferKey release];
                }
            }
                break;
            case eMessageIDGetFixedInvestOderByPage:
            {
                NSNumber* pageNum = [parsedDic objectForKey:@"pageNum"];
                if ([pageNum intValue] == 1) {
                    HBBufferKey* bufferKey = [[HBBufferKey alloc] initWithMessageID:eMessageIDGetFixedInvestOderByPage andParameters:parsedDic];
                    [HBBufferManager saveBuffer:responseData withKey:bufferKey];
                    [bufferKey release];
                }
            }
                break;
            case eMessageIDGetFundPerformance:
            {
                //
            }
                break;
            default:
                break;
        }
        
        return parsedDic;
    }
    else
    {   
        NSDictionary* parsedDic = [NSDictionary dictionaryWithObjectsAndKeys:@"服务器未正确返回数据", KNWK_ResponseContent, [NSNumber numberWithInt:0], KNWK_ResponseCode, [[request userInfo] objectForKey:REQUEST_TAG_KEY], REQUEST_TAG_KEY, nil];
        
        return parsedDic;
    }
}

- (void)dealWithStartData:(NSDictionary*)dic
{
    @autoreleasepool {
        if (dic == nil) {
            return;
        }
        
        // 软件是否需要更新
        int needUpdate = [[dic objectForKey:KNWK_VersionNeedUpdate] intValue];
        BOOL showNewestTips = [[dic objectForKey:@"showNewestTips"] boolValue];
        if (needUpdate == 0 || needUpdate == 1) {
            NSDictionary *updateInfoDic = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:needUpdate], KNWK_VersionNeedUpdate, [dic objectForKey:KNWK_UpdateDescription], KNWK_UpdateDescription, [dic objectForKey:KNWK_UpdateUrl], KNWK_UpdateUrl, [dic objectForKey:@"showNewestTips"], @"showNewestTips", nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:KAppNeedUpdateNotifyKey object:nil userInfo:updateInfoDic];
            
            return;
        }
        else if (showNewestTips && needUpdate == 2)
        {
            NSDictionary *updateInfoDic = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:needUpdate], KNWK_VersionNeedUpdate, [dic objectForKey:@"showNewestTips"], @"showNewestTips", nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:KAppNeedUpdateNotifyKey object:nil userInfo:updateInfoDic];
        }
        
        // 开放式是否需要更新
        int openNetValueNeedUpdate = [[dic objectForKey:KNWK_KFSNeedUpdate] intValue];
        if (openNetValueNeedUpdate) {
            NSMutableDictionary* userInfo = [[NSMutableDictionary alloc] init];
            [userInfo setObject:@"1" forKey:@"type"];
            [userInfo setObject:[[HBAppConfig getInstance] openFundsVersion] forKey:@"typeVer"];
            [[HBDataManager getInstance] requestNetWork:eMessageIDGetOpenFundNetValue withParams:userInfo];
            [userInfo release];
            
//            userInfo = [[NSMutableDictionary alloc] init];
//            [userInfo setObject:@"5" forKey:@"type"];
//            [userInfo setObject:[[HBAppConfig getInstance] openFundsVersion] forKey:@"typeVer"];
//            [[HBDataManager getInstance] requestNetWork:eMessageIDGetMoneyFundNetValue withParams:userInfo withCheckReSend:NO];
//            [userInfo release];
        }
        
        // 封闭式是否需要更新
        int closeNetValueNeedUpdate = [[dic objectForKey:KNWK_FBSNeedUpdate] intValue];
        if (closeNetValueNeedUpdate) {
            [[HBAppConfig getInstance] setCloseFundsNeedUpdate:YES];
        }
        else {
            [[HBAppConfig getInstance] setCloseFundsNeedUpdate:NO];
        }
        
        // 货币式是否需要更新
        int moneyNetValueNeedUpdate = [[dic objectForKey:KNWK_HBSNeedUpdate] intValue];
        if (moneyNetValueNeedUpdate) {
            [[HBAppConfig getInstance] setMoneyFundsNeedUpdate:YES];
        }
        else {
            [[HBAppConfig getInstance] setMoneyFundsNeedUpdate:NO];
        }
        
        // 私募是否需要更新
        int privateNetValueNeedUpdate = [[dic objectForKey:KNWK_SMNeedUpdate] intValue];
        if (privateNetValueNeedUpdate) {
            [[HBAppConfig getInstance] setPrivateFundsNeedUpdate:YES];
        }
        else {
            [[HBAppConfig getInstance] setPrivateFundsNeedUpdate:NO];
        }
        
        // 新闻研报
        id serverTime               = [dic objectForKey:KNWK_ServerTime];
        
        int newsTypeNeedUpdate      = [[dic objectForKey:KNWK_NewsTypeNeedUpdate] intValue];
        NSArray *newsList = nil;
        if (newsTypeNeedUpdate) {
            newsList       = [dic objectForKey:KNWK_PhoneNewsTypeList];
            [[HBAppConfig getInstance] setInfomation:serverTime];
        }
        
        int opinionTypeNeedUpdate   = [[dic objectForKey:KNWK_OpinionTypeNeedUpdate] intValue];
        NSArray *opinionList = nil;
        if (opinionTypeNeedUpdate || newsTypeNeedUpdate) {
            opinionList    = [dic objectForKey:KNWK_PhoneOpinionTypeList];
            [[HBAppConfig getInstance] setResearch:serverTime];
        }
        if (newsList != nil && opinionList != nil) {
//            [self updateNewsType:newsList andOpinionType:opinionList];
        }
        
        int basicInfoNeedUpdate     = [[dic objectForKey:KNWK_BasicInfoNeedUpdate] intValue];
        if (basicInfoNeedUpdate) {
            [[HBDataManager getInstance] requestNetWork:eMessageIDUpdateFundsBasicInfo withParams:nil];
        }
        
        int managerNeedUpdate       = [[dic objectForKey:KNWK_ManagerNeedUpdate] intValue];
        if (managerNeedUpdate) {
            [[HBDataManager getInstance] requestNetWork:eMessageIDUpdateManagerInfo withParams:nil];
        }
        
        int companyNeedUpdate       = [[dic objectForKey:KNWK_CompanyNeedUpdate] intValue];
        if (companyNeedUpdate) {
            [[HBDataManager getInstance] requestNetWork:eMessageIDUpdateCompanyInfo withParams:nil];
        }
    }
}

- (void)dealWithNetValueData:(NSDictionary*)pdic
{
    __block NSDictionary* dic = [pdic retain];
    dispatch_async(self.taskQueue, ^(void){
        @autoreleasepool {
            if (dic == nil) {
                return;
            }
            
            NSMutableArray *array = [[NSMutableArray alloc] init];
            
            NSString * keys[] = {@"openList", @"closeList", @"moneyList", @"simusList", @"closesNewList"};
            for (int i = 0; i < dimof(keys); i++) {
                NSArray *list = [dic objectForKey:keys[i]];
                for (NSDictionary *dic in list) {
                    [array addObject:dic];
                }
            }
            
            BOOL gotData = NO;
            if ([array count] > 0) {
                gotData = YES;
            }
            
            id serverTime = [dic objectForKey:KNWK_ServerTime];
            id serverVersion = [dic objectForKey:KNWK_DataVersion];
            int requestID = [[dic objectForKey:REQUEST_TAG_KEY] intValue];
            if (serverTime != nil && serverVersion != nil) {
                switch (requestID) {
                    case eMessageIDGetOpenFundNetValue:
                    {
                        [[HBAppConfig getInstance] setOpenFundsVersionS:[serverTime stringValue]];
                        if (gotData) {
                            [[HBAppConfig getInstance] setOpenFundsVersion:[serverVersion stringValue]];
                        }
                    }
                        break;
                    case eMessageIDGetCloseFundNetValue:
                    {
                        [[HBAppConfig getInstance] setCloseFundsVersionS:[serverTime stringValue]];
                        if (gotData) {
                            [[HBAppConfig getInstance] setCloseFundsVersion:[serverVersion stringValue]];
                        }
                        [[HBAppConfig getInstance] setCloseFundsNeedUpdate:NO];
                    }
                        break;
                    case eMessageIDGetMoneyFundNetValue:
                    {
                        [[HBAppConfig getInstance] setMoneyFundsVersionS:[serverTime stringValue]];
                        if (gotData) {
                            [[HBAppConfig getInstance] setMoneyFundsVersion:[serverVersion stringValue]];
                        }
                        [[HBAppConfig getInstance] setMoneyFundsNeedUpdate:NO];
                    }
                        break;
                    case eMessageIDGetPrivateFundNetValue:
                    {
                        [[HBAppConfig getInstance] setPrivateFundsVersionS:[serverTime stringValue]];
                        if (gotData) {
                            [[HBAppConfig getInstance] setPrivateFundsVersion:[serverVersion stringValue]];
                        }
                        [[HBAppConfig getInstance] setPrivateFundsNeedUpdate:NO];
                    }
                        break;
                    default:
                        break;
                }
                
                [[HBAppConfig getInstance] saveConfig];
            }
            else if (requestID == eMessageIDGetFundNetValueByIDs) {
                NSDate* now = [NSDate date];
                NSTimeInterval timeInerval = [now timeIntervalSince1970];
                NSNumber* timeNumber = [NSNumber numberWithDouble:timeInerval*1000];
                double dTimeNumber = floor([timeNumber doubleValue]);
                [[HBAppConfig getInstance] setCustomFundsVersionS:[NSString stringWithFormat:@"%f", dTimeNumber]];
                [[HBAppConfig getInstance] saveConfig];
            }
        }
        
        [dic release];
    });
}

- (void)dealWithFundsInfoData:(NSDictionary*)pdic
{
    __block NSDictionary* dic = [pdic retain];
    dispatch_async(self.taskQueue, ^(void){
        @autoreleasepool {
            if (dic == nil) {
                return;
            }
            
            NSString* version = [dic objectForKey:KNWK_NewestFundInfoVer];
            [[HBAppConfig getInstance] setBasicinfo:version];
            
            NSMutableArray *insertArray = [NSMutableArray array];
            NSArray *infoList = [dic objectForKey:KNWK_FundBasicList];
            NSMutableString* codes = [NSMutableString string];
            for (NSDictionary* infoDic in infoList) {
                NSString *code = [infoDic objectForKey:KFundInfoCodeKey];
                NSString *type = [infoDic objectForKey:KFundInfoTypeKey];
                if (code != nil && type != nil) {
                    NSMutableDictionary* dbDic = [NSMutableDictionary dictionaryWithDictionary:infoDic];
                    int dbType = 0;
                    if ([[code class] isSubclassOfClass:[NSString class]] && [code length] > 0 && [[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:[code characterAtIndex:0]]) {
                        dbType = eFundTypePrivate;
                    }
                    else {
                        if ([type isEqual:[NSNull null]]) {
                            HBErrorLog(@"Unkown fund with code : %@", code);
                            dbType = EFundTypeUnknown;
                            
                            [codes appendFormat:@"%@、", code];
                        }
                        else if ([[type class] isSubclassOfClass:[NSString class]] && [type length] > 0)
                        {
                            unichar c = [type characterAtIndex:0];
                            if (c == '1') {
                                dbType = eFundTypeOpenStock;
                            } else if (c == '3') {
                                dbType = eFundTypeOpenMixture;
                            } else if (c == '5') {
                                dbType = eFundTypeOpenBonds;
                            } else if (c == '7') {
                                dbType = eFundTypeMoney;
                            } else if (c == '8') {
                                dbType = eFundTypeOpenExponent;
                            } else if (c == '9') {
                                dbType = eFundTypeOpenQdii;
                            } else if (c == 'a') {
                                dbType = eFundTypeClose;
                            } else if (c == 't') {
                                dbType = eFundTypeOpenStruct;
                            } else {
                                dbType = EFundTypeUnknown;
                            }
                        }
                        else
                        {
                            HBErrorLog(@"Unkown fund with code : %@ and type : %@", code, type);
                            [codes appendFormat:@"%@、", code];
                        }
                    }
                    
                    [dbDic setObject:[NSNumber numberWithInt:dbType] forKey:KFundInfoTypeKey];
                    [insertArray addObject:dbDic];
                }
            }
            
            if ([codes length] > 0) {
                [[HBFileLog getInstance] writeLog:[NSString stringWithFormat:@"基金基本信息接口检测到未知类型的基金：%@", codes]];
                [[HBFeiXin getInstance] sendSms:[NSString stringWithFormat:@"基金基本信息接口检测到未知类型的基金：%@", codes]];
            }
            
            // 数据存入数据库
            if ([insertArray count] > 0) {
                //
            }
        }
        
        [dic release];
    });
}

- (void)dealWithManagerInfoData:(NSDictionary*)pdic
{
    __block NSDictionary* dic = [pdic retain];
    dispatch_async(self.taskQueue, ^(void){
        @autoreleasepool {
            if (dic == nil) {
                return;
            }
            
            NSString *version = [dic objectForKey:KNWK_NewestManagerInfoVer];
            [[HBAppConfig getInstance] setManager:version];
            
            NSArray *infoList = [dic objectForKey:KNWK_FundManagerInfoList];
            if ([infoList count] > 0) {
                //
            }
        }
        
        [dic release];
    });
}

- (void)dealWithCompanyInfoData:(NSDictionary*)pdic
{
    __block NSDictionary* dic = [pdic retain];
    dispatch_async(self.taskQueue, ^(void){
        @autoreleasepool {
            if (dic == nil) {
                return;
            }
            
            NSString *version = [dic objectForKey:KNWK_NewestCompanyInfoVer];
            [[HBAppConfig getInstance] setCompany:version];
            
            NSArray *infoList = [dic objectForKey:KNWK_FundCompanyInfoList];
            if ([infoList count] > 0) {
                //
            }
        }
        
        [dic release];
    });
}

- (void)dealWIthCustomFundsCodeData:(NSDictionary*)pdic
{
    __block NSDictionary* dic = [pdic retain];
    dispatch_async(self.taskQueue, ^(void){
        @autoreleasepool {
            if (dic == nil) {
                return;
            }
            
            NSDate* now = [NSDate date];
            NSTimeInterval timeInerval = [now timeIntervalSince1970];
            NSNumber* timeNumber = [NSNumber numberWithDouble:timeInerval*1000];
            timeNumber = timeNumber;
            
            id value = [dic objectForKey:KNWK_UserFavoritesListKey];
            if ([value isKindOfClass:[NSArray class]] && [value count] > 0) {
                NSMutableArray *funds = [NSMutableArray arrayWithCapacity:[value count]];
                for (NSDictionary* obj in value) {
                    if ([obj isEqual:[NSNull null]]) {
                        continue;
                    }
                    [funds addObject:[obj objectForKey:@"favoriteObject"]];
                }
                
                [[NSNotificationCenter defaultCenter] postNotificationName:KCustomFundsCodeUpdatedNotifyKey object:nil];
            }
        }
        
        [dic release];
    });
}

- (void)dealWIthNewsAndResearchInfoData:(NSDictionary*)pdic
{
    __block NSDictionary* dic = [pdic retain];
    dispatch_async(self.taskQueue, ^(void){
        @autoreleasepool {
            if (dic == nil) {
                return;
            }
            
            NSNumber* currentPage = [dic objectForKey:KNWK_CurrentPage];
            if ([currentPage intValue] == 1) {  // 最前一页保存入库
                NSArray* list = nil;
                if ((list = [dic objectForKey:KNWK_NewsList]) != nil) {
                    //
                }
                else if ((list = [dic objectForKey:KNWK_OpinionList]) != nil)
                {
                    //
                }
            }
        }
        
        [dic release];
    });
}

- (NSDictionary*)dealWithFundContentLineChartData:(NSDictionary*)dic
{
    NSInteger responseCode = [[dic objectForKey:KNWK_ResponseCode] intValue];
    if (responseCode < 1) {
        HBDebugLog(@"%@", [dic objectForKey:KNWK_ResponseContent]);
        return dic;
    }
    
    NSMutableDictionary *fundData = [NSMutableDictionary dictionary];
    
    for (NSString *code in [dic allKeys]) {
        if ([code isEqualToString:KNWK_ResponseCode] ||
            [code isEqualToString:KNWK_ResponseContent]) {
            [fundData setObject:[dic objectForKey:code] forKey:code];
            continue;
        } else if ([code isEqualToString:REQUEST_TAG_KEY]) {
            continue;
        }
        NSArray *navs = [dic objectForKey:code];
        for (NSDictionary* nav in navs) {
            NSString* fundCode = [nav objectForKey:@"jjdm"];
            NSString* jyzt = [nav objectForKey:@"jyzt"];
            
            NSArray* values = [nav objectForKey:@"fundDruationInfoList"];
            if (fundCode != nil && values != nil) {
                [fundData setObject:values forKey:fundCode];
            }
            if (jyzt != nil) {
                [fundData setObject:jyzt forKey:@"jyzt"];
            }
        }
    }
    
    return fundData;
}

- (void)tryToLoadBufferDataForType:(EMessageID)type withParams:(NSDictionary*)paramsDic
{
    HBBufferKey* bufferKey = [[HBBufferKey alloc] initWithMessageID:type andParameters:paramsDic];
    if ([HBBufferManager hasBuffer:bufferKey]) {
        NSData* bufferData = [HBBufferManager getBuffer:bufferKey];
        NSDictionary* parsedDic = [HBParseNetworkData parseData:bufferData forMessageType:type withParameters:paramsDic];
        NSDictionary* dic = [NSDictionary dictionaryWithObjectsAndKeys:parsedDic, @"parsedDic", nil];
        [self performSelector:@selector(delayNotifyFinished:) withObject:dic afterDelay:.2f];
    }
    else
    {
        NSMutableDictionary* parsedDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"当前无网络", KNWK_ResponseContent, [NSNumber numberWithInt:0], KNWK_ResponseCode, nil];
        [parsedDic addEntriesFromDictionary:paramsDic];
        
        NSDictionary* dic = [NSDictionary dictionaryWithObjectsAndKeys:parsedDic, @"parsedDic", nil];
        [self performSelector:@selector(delayNotifyFinished:) withObject:dic afterDelay:.2f];
    }
    
    [bufferKey release];
}

- (void)delayNotifyFinished:(NSDictionary*)dic
{
    [self performSelectorOnMainThread:@selector(notifyFinished:) withObject:dic waitUntilDone:NO];
}
@end

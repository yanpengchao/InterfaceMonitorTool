//
//  HBParseNetworkData.m
//  HowbuyFund
//
//  Created by pengchao.yan on 12-9-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HBParseNetworkData.h"
#import "NSData+Compress.h"
#import "ASIHTTPRequest.h"

#import "FundInfoOpens.pb.h"
#import "FundInfoCloses.pb.h"
#import "FundInfoMoneys.pb.h"
#import "FundInfoSimus.pb.h"
#import "HostDistribution.pb.h"
#import "IcsynFavFund.pb.h"
#import "UserFavorite.pb.h"
#import "Register.pb.h"
#import "FundDuration.pb.h"
#import "Fundfixed.pb.h"
#import "NewsInfo.pb.h"
#import "OpinionInfo.pb.h"
#import "CompanyInfo.pb.h"
#import "ManagerInfoList.pb.h"
#import "ManagerDetailInfoList.pb.h"
#import "FundAnnoList.pb.h"
#import "Fundzccg.pb.h"
#import "Fundyxzcg.pb.h"
#import "FundBasicInfoList.pb.h"
#import "FundManagerInfoList.pb.h"
#import "FundCompanyInfoList.pb.h"
#import "CompanyInfo.pb.h"
#import "NewsAndOpinionInfo.pb.h"
#import "Login.pb.h"
#import "Register.pb.h"
#import "FundInfoClosesNew.pb.h"
#import "FundInfosList.pb.h"
#import "HBDefine.h"
#import "UpDown.pb.h"
#import "CommentInfoList.pb.h"
#import "TrustInfoList.pb.h"
#import "TrustDetailInfo.pb.h"
#import "TrustInfoPageList.pb.h"
#import "PerformanceInfo.pb.h"
#import "HBTools.h"

#define REQUEST_TAG_KEY @"requestTag"

@interface NSObject ()

- (NSDictionary*)dictionary:(NSMutableDictionary*)dic;

@end

@implementation HBParseNetworkData

+ (NSDictionary*)parseRequest:(ASIHTTPRequest*)request withData:(NSData*)data forMessageType:(EMessageID)messageID
{
    if (request != nil && data != nil) {
        int requestTag = [[[request userInfo] objectForKey:REQUEST_TAG_KEY] intValue];
        [HBTools printTimeNow:[NSString stringWithFormat:@"parseRequest begin : %d", requestTag]];
        
        NSData* uncompressedData = nil;
        id parsedInfo = nil;
        NSDictionary* netValueDic = nil;
        
        if (data != nil && [data length] > 0) {
            uncompressedData = [data uncompressZippedData];
            if (uncompressedData == nil) {
                uncompressedData = data;
            }
            
            NSDictionary* userInfo = [request userInfo];
            
            switch (messageID) {
                case eMessageIDStart:
                case eMessageIDCheckAppUpdate:
                {
                    @try {
                        parsedInfo = [HostDistribution parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong HostDistribution Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]initWithDictionary:userInfo]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"HostDistribution Data : %@", netValueDic);
                }
                    break;
                case eMessageIDCustomFundSynchronize:
                {
                    @try {
                        parsedInfo = [ICSynFavFund parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong ICSynFavFund Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"ICSynFavFund Data : %@", netValueDic);
                }
                    break;
                case eMessageIDRegisterCode:
                {
                    @try {
                        parsedInfo = [Register parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong Register Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"Register Data : %@", netValueDic);
                }
                    break;
                case eMessageIDRegister:
                {
                    @try {
                        parsedInfo = [Register parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong Register Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"Register Data : %@", netValueDic);
                }
                    break;
                case eMessageIDLogin:
                {
                    @try {
                        parsedInfo = [Login parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong Login Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"Login Data : %@", netValueDic);
                }
                    break;
                case eMessageIDGetFundContentLineChart:
                {
                    @try {
                        parsedInfo = [FundDruationProto parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong FundDruationProto Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"FundDruationProto Data : %@", netValueDic);
                }
                    break;
                case eMessageIDGetFundPerformance:
                {
                    @try {
                        parsedInfo = [PerformanceInfo parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong PerformanceInfo Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"PerformanceInfo Data : %@", netValueDic);
                }
                    break;
                case eMessageIDGetResearchByType:
                case eMessageIDGetResearchByKey:
                {
                    @try {
                        parsedInfo = [OpinionInfo parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong OpinionInfo Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    id currentPage = [userInfo objectForKey:@"currentPage"];
                    if (currentPage != nil) {
                        [dic setObject:currentPage forKey:@"currentPage"];
                    }
                    id opinionType = [userInfo objectForKey:@"opinionType"];
                    if (opinionType != nil) {
                        [dic setObject:opinionType forKey:@"opinionType"];
                    }
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"OpinionInfo Data : %@", netValueDic);
                }
                    break;
                case eMessageIDGetNewsByType:
                case eMessageIDGetNewsByKey:
                {
                    @try {
                        parsedInfo = [NewsInfo parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong NewsInfo Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    id currentPage = [userInfo objectForKey:@"currentPage"];
                    if (currentPage != nil) {
                        [dic setObject:currentPage forKey:@"currentPage"];
                    }
                    id newsType = [userInfo objectForKey:@"newsType"];
                    if (newsType != nil) {
                        [dic setObject:newsType forKey:@"newsType"];
                    }
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"NewsInfo Data : %@", netValueDic);
                }
                    break;
                case eMessageIDGetNewsAndResearchByKey:
                {
                    @try {
                        parsedInfo = [NewsAndOpinionInfo parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong NewsAndOpinionInfo Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    id currentPage = [userInfo objectForKey:@"currentPage"];
                    if (currentPage != nil) {
                        [dic setObject:currentPage forKey:@"currentPage"];
                    }
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"NewsAndOpinionInfo Data : %@", netValueDic);
                }
                    break;
                case eMessageIDGetFundContentF10:
                {
                    NSURL* url = [request originalURL];
                    NSString* path = [url path];
                    if ([path rangeOfString:@"company/detail/"].location != NSNotFound) {
                        @try {
                            parsedInfo = [CompanyInfo parseFromData:uncompressedData];
                        }
                        @catch (NSException *exception) {
                            HBErrorLog(@"Wrong CompanyInfo Data<%@: %@>", [exception name], [exception reason]);
                            break;
                        }
                        @finally {
                            //
                        }
                    }
                    else
                        if ([path rangeOfString:@"ften/company/"].location != NSNotFound)
                        {
                            @try {
                                parsedInfo = [CompanyInfo parseFromData:uncompressedData];
                            }
                            @catch (NSException *exception) {
                                HBErrorLog(@"Wrong CompanyInfo Data<%@: %@>", [exception name], [exception reason]);
                                break;
                            }
                            @finally {
                                //
                            }
                        }
                        else if ([path rangeOfString:@"ften/manager/detail/"].location != NSNotFound) {
                            @try {
                                parsedInfo = [ManagerDetailInfoList parseFromData:uncompressedData];
                            }
                            @catch (NSException *exception) {
                                HBErrorLog(@"Wrong ManagerDetailInfoList Data<%@: %@>", [exception name], [exception reason]);
                                break;
                            }
                            @finally {
                                //
                            }
                        }
                        else if ([path rangeOfString:@"ften/manager/"].location != NSNotFound) {
                            @try {
                                parsedInfo = [ManagerInfoList parseFromData:uncompressedData];
                            }
                            @catch (NSException *exception) {
                                HBErrorLog(@"Wrong ManagerInfoList Data<%@: %@>", [exception name], [exception reason]);
                                break;
                            }
                            @finally {
                                //
                            }
                        }
                        else if ([path rangeOfString:@"ften/jjgg/"].location != NSNotFound ||
                                 [path rangeOfString:@"ften/jdbg/"].location != NSNotFound ||
                                 [path rangeOfString:@"ften/ndbg/"].location != NSNotFound ||
                                 [path rangeOfString:@"ften/zmsms/"].location != NSNotFound) {
                            @try {
                                parsedInfo = [FundAnnoList parseFromData:uncompressedData];
                            }
                            @catch (NSException *exception) {
                                HBErrorLog(@"Wrong FundAnnoList Data<%@: %@>", [exception name], [exception reason]);
                                break;
                            }
                            @finally {
                                //
                            }
                        }
                        else if ([path rangeOfString:@"ften/zccg/"].location != NSNotFound) {
                            @try {
                                parsedInfo = [FundZccgMain parseFromData:uncompressedData];
                            }
                            @catch (NSException *exception) {
                                HBErrorLog(@"Wrong FundZccgMain Data<%@: %@>", [exception name], [exception reason]);
                                break;
                            }
                            @finally {
                                //
                            }
                        }
                        else if ([path rangeOfString:@"ften/yxzcg/"].location != NSNotFound ||
                                 [path rangeOfString:@"ften/czmx/"].location != NSNotFound ||
                                 [path rangeOfString:@"ften/qzzh/"].location != NSNotFound ||
                                 [path rangeOfString:@"ften/hytz/"].location != NSNotFound ||
                                 [path rangeOfString:@"ften/zcpz/"].location != NSNotFound ||
                                 [path rangeOfString:@"ften/cwzb/"].location != NSNotFound ||
                                 [path rangeOfString:@"ften/zcfz/"].location != NSNotFound ||
                                 [path rangeOfString:@"ften/lrfp/"].location != NSNotFound) {
                            @try {
                                parsedInfo = [FundYxzcgMain parseFromData:uncompressedData];
                            }
                            @catch (NSException *exception) {
                                HBErrorLog(@"Wrong FundYxzcgMain Data<%@: %@>", [exception name], [exception reason]);
                                break;
                            }
                            @finally {
                                //
                            }
                        }
                        else
                        {
                            HBErrorLog(@"I don't know type of the data");
                            break;
                        }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    CompanyInfo* info = parsedInfo;
                    netValueDic = [info dictionary:dic];
                    HBInfoLog(@"F10 Data : %@", netValueDic);
                }
                    break;
                case eMessageIDShare2Friends:
                case eMessageIDFeedBack:
                case eMessageIDSendUserActions:
                {
                    @try {
                        parsedInfo = [Common parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong Common Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"Common Data : %@", netValueDic);
                }
                    break;
                case eMessageIDUpdateFundsBasicInfo:
                {
                    @try {
                        parsedInfo = [FundBasicInfoList parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong FundBasicInfoList Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"FundBasicInfoList Data : %@", netValueDic);
                }
                    break;
                case eMessageIDUpdateCompanyInfo:
                {
                    @try {
                        parsedInfo = [FundCompanyInfoList parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong FundCompanyInfoList Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"FundCompanyInfoList Data : %@", netValueDic);
                }
                    break;
                case eMessageIDUpdateManagerInfo:
                {
                    @try {
                        parsedInfo = [FundManagerInfoList parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong FundManagerInfoList Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"FundManagerInfoList Data : %@", netValueDic);
                }
                    break;
                    
                case eMessageIDGetOpenFundNetValue:
                {
                    @try {
                        parsedInfo = [FundInfoOpens parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong FundInfoOpens Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"FundInfoOpens Data : %@", netValueDic);
                }
                    break;
                case eMessageIDGetCloseFundNetValue:
                {
                    @try {
                        //                            parsedInfo = [FundInfoCloses parseFromData:uncompressedData];
                        parsedInfo = [FundInfoClosesNew parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong FundInfoClosesNew Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"FundInfoClosesNew Data : %@", netValueDic);
                }
                    break;
                case eMessageIDGetPrivateFundNetValue:
                {
                    @try {
                        parsedInfo = [FundInfoSimus parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong FundInfoSimus Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"FundInfoSimus Data : %@", netValueDic);
                }
                    break;
                case eMessageIDGetMoneyFundNetValue:
                {
                    @try {
                        parsedInfo = [FundInfoMoneys parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong FundInfoMoneys Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"FundInfoMoneys Data : %@", netValueDic);
                }
                    break;
                case eMessageIDGetFundNetValueByIDs:
                {
                    @try {
                        parsedInfo = [FundInfosList parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong FundInfosList Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"FundInfosList Data : %@", netValueDic);
                }
                    break;
                case eMessageIDUpOrDown:
                case eMessageIDGetUpOrDownCount:
                {
                    @try {
                        parsedInfo = [UpDown parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong UpDown Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"UpDown Data : %@", netValueDic);
                }
                    break;
                case eMessageIDSendComment:
                {
                    @try {
                        parsedInfo = [Common parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong SendComment Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"SendComment Data : %@", netValueDic);
                }
                    break;
                case eMessageIDGetCommentByPage:
                case eMessageIDGetCommentByTimestamp:
                {
                    @try {
                        parsedInfo = [CommentInfoList parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong Comment Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    if (messageID == eMessageIDGetCommentByPage) {
                        id currentPage = [userInfo objectForKey:@"currentPage"];
                        if (currentPage != nil) {
                            [dic setObject:currentPage forKey:@"currentPage"];
                        }
                    }
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"Comment Data : %@", netValueDic);
                }
                    break;
                case eMessageIDGetTrustList:
                {
                    @try {
                        parsedInfo = [TrustInfoList parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong TrustInfoList Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"TrustInfoList Data : %@", netValueDic);
                }
                    break;
                case eMessageIDGetTrustByPage:
                {
                    @try {
                        parsedInfo = [TrustInfoPageList parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong TrustInfoPageList Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    if (messageID == eMessageIDGetTrustByPage) {
                        id currentPage = [userInfo objectForKey:@"currentPage"];
                        if (currentPage != nil) {
                            [dic setObject:currentPage forKey:@"currentPage"];
                        }
                    }
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"TrustInfoPageList Data : %@", netValueDic);
                }
                    break;
                case eMessageIDGetTrustContent:
                {
                    @try {
                        parsedInfo = [TrustDetailInfo parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong TrustDetailInfo Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"TrustDetailInfo Data : %@", netValueDic);
                }
                    break;
                case eMessageIDAppointTrust:
                {
                    @try {
                        parsedInfo = [Common parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong FixedIncomeAppointment Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"FixedIncomeAppointment Data : %@", netValueDic);
                }
                    break;
                case eMessageIDSendNotifyToken:
                {
                    @try {
                        parsedInfo = [Common parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong SendNotifyToken Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"SendNotifyToken Data : %@", netValueDic);
                }
                    break;
                case eMessageIDUploadContact:
                {
                    @try {
                        parsedInfo = [Common parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong uploadContact Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"uploadContact Data : %@", netValueDic);
                }
                    break;
                case eMessageIDGetFixedInvestOderByPage:
                {
                    @try {
                        parsedInfo = [FundFixedUpdate parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong FundFixedUpdate Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    if (userInfo != nil)
                    {
                        NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                        [dic setObject:[userInfo objectForKey:@"kind"] forKey:@"kind"];
                        [dic setObject:[userInfo objectForKey:@"pageNum"] forKey:@"pageNum"];
                        [dic setObject:[userInfo objectForKey:@"type"] forKey:@"type"];
                        [dic setObject:[userInfo objectForKey:@"order"] forKey:@"order"];
                        netValueDic = [parsedInfo dictionary:dic];
                        HBInfoLog(@"FundFixedUpdate Data : %@", netValueDic);
                    }
                }
                    break;
                case eMessageIDDingYue:
                {
                    @try {
                        parsedInfo = [Common parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong DingYue Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"DingYue Data : %@", netValueDic);
                }
                    break;
                default:
                    break;
            }
        }
        
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObject:[NSNumber numberWithInt:messageID] forKey:REQUEST_TAG_KEY];
        
        if (netValueDic == nil)
        {
            [dic setObject:@"0" forKey:KNWK_ResponseCode];
            [dic setObject:@"服务器数据格式错误" forKey:KNWK_ResponseContent];
        }
        else
        {
            [dic addEntriesFromDictionary:netValueDic];
        }
        
        [HBTools printTimeNow:[NSString stringWithFormat:@"parseRequest end : %d", requestTag]];
        
        return dic;
    }
    
    return nil;
}

+ (NSDictionary*)parseData:(NSData*)data forMessageType:(EMessageID)messageID withParameters:(NSDictionary*)parameters
{
    if (data != nil) {
        [HBTools printTimeNow:[NSString stringWithFormat:@"parseRequest begin : %d", messageID]];
        
        NSData* uncompressedData = nil;
        id parsedInfo = nil;
        NSDictionary* netValueDic = nil;
        
        if (data != nil && [data length] > 0) {
            uncompressedData = [data uncompressZippedData];
            if (uncompressedData == nil) {
                uncompressedData = data;
            }
            
            NSDictionary* userInfo = parameters;
            
            switch (messageID) {
                case eMessageIDStart:
                case eMessageIDCheckAppUpdate:
                {
                    @try {
                        parsedInfo = [HostDistribution parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong HostDistribution Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]initWithDictionary:userInfo]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"HostDistribution Data : %@", netValueDic);
                }
                    break;
                case eMessageIDCustomFundSynchronize:
                {
                    @try {
                        parsedInfo = [ICSynFavFund parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong ICSynFavFund Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"ICSynFavFund Data : %@", netValueDic);
                }
                    break;
                case eMessageIDRegisterCode:
                {
                    @try {
                        parsedInfo = [Register parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong Register Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"Register Data : %@", netValueDic);
                }
                    break;
                case eMessageIDRegister:
                {
                    @try {
                        parsedInfo = [Register parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong Register Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"Register Data : %@", netValueDic);
                }
                    break;
                case eMessageIDLogin:
                {
                    @try {
                        parsedInfo = [Login parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong Login Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"Login Data : %@", netValueDic);
                }
                    break;
                case eMessageIDGetFundContentLineChart:
                {
                    @try {
                        parsedInfo = [FundDruationProto parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong FundDruationProto Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"FundDruationProto Data : %@", netValueDic);
                }
                    break;
                case eMessageIDGetFundPerformance:
                {
                    @try {
                        parsedInfo = [PerformanceInfo parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong PerformanceInfo Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"PerformanceInfo Data : %@", netValueDic);
                }
                    break;
                case eMessageIDGetResearchByType:
                case eMessageIDGetResearchByKey:
                {
                    @try {
                        parsedInfo = [OpinionInfo parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong OpinionInfo Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    id currentPage = [userInfo objectForKey:@"currentPage"];
                    if (currentPage != nil) {
                        [dic setObject:currentPage forKey:@"currentPage"];
                    }
                    id opinionType = [userInfo objectForKey:@"opinionType"];
                    if (opinionType != nil) {
                        [dic setObject:opinionType forKey:@"opinionType"];
                    }
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"OpinionInfo Data : %@", netValueDic);
                }
                    break;
                case eMessageIDGetNewsByType:
                case eMessageIDGetNewsByKey:
                {
                    @try {
                        parsedInfo = [NewsInfo parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong NewsInfo Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    id currentPage = [userInfo objectForKey:@"currentPage"];
                    if (currentPage != nil) {
                        [dic setObject:currentPage forKey:@"currentPage"];
                    }
                    id newsType = [userInfo objectForKey:@"newsType"];
                    if (newsType != nil) {
                        [dic setObject:newsType forKey:@"newsType"];
                    }
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"NewsInfo Data : %@", netValueDic);
                }
                    break;
                case eMessageIDGetNewsAndResearchByKey:
                {
                    @try {
                        parsedInfo = [NewsAndOpinionInfo parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong NewsAndOpinionInfo Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    id currentPage = [userInfo objectForKey:@"currentPage"];
                    if (currentPage != nil) {
                        [dic setObject:currentPage forKey:@"currentPage"];
                    }
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"NewsAndOpinionInfo Data : %@", netValueDic);
                }
                    break;
                case eMessageIDGetFundContentF10:
                {
                    return nil;
                }
                    break;
                case eMessageIDShare2Friends:
                case eMessageIDFeedBack:
                case eMessageIDSendUserActions:
                {
                    @try {
                        parsedInfo = [Common parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong Common Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"Common Data : %@", netValueDic);
                }
                    break;
                case eMessageIDUpdateFundsBasicInfo:
                {
                    @try {
                        parsedInfo = [FundBasicInfoList parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong FundBasicInfoList Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"FundBasicInfoList Data : %@", netValueDic);
                }
                    break;
                case eMessageIDUpdateCompanyInfo:
                {
                    @try {
                        parsedInfo = [FundCompanyInfoList parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong FundCompanyInfoList Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"FundCompanyInfoList Data : %@", netValueDic);
                }
                    break;
                case eMessageIDUpdateManagerInfo:
                {
                    @try {
                        parsedInfo = [FundManagerInfoList parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong FundManagerInfoList Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"FundManagerInfoList Data : %@", netValueDic);
                }
                    break;
                    
                case eMessageIDGetOpenFundNetValue:
                {
                    @try {
                        parsedInfo = [FundInfoOpens parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong FundInfoOpens Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"FundInfoOpens Data : %@", netValueDic);
                }
                    break;
                case eMessageIDGetCloseFundNetValue:
                {
                    @try {
                        //                            parsedInfo = [FundInfoCloses parseFromData:uncompressedData];
                        parsedInfo = [FundInfoClosesNew parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong FundInfoClosesNew Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"FundInfoClosesNew Data : %@", netValueDic);
                }
                    break;
                case eMessageIDGetPrivateFundNetValue:
                {
                    @try {
                        parsedInfo = [FundInfoSimus parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong FundInfoSimus Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"FundInfoSimus Data : %@", netValueDic);
                }
                    break;
                case eMessageIDGetMoneyFundNetValue:
                {
                    @try {
                        parsedInfo = [FundInfoMoneys parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong FundInfoMoneys Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"FundInfoMoneys Data : %@", netValueDic);
                }
                    break;
                case eMessageIDGetFundNetValueByIDs:
                {
                    @try {
                        parsedInfo = [FundInfosList parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong FundInfosList Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"FundInfosList Data : %@", netValueDic);
                }
                    break;
                case eMessageIDUpOrDown:
                case eMessageIDGetUpOrDownCount:
                {
                    @try {
                        parsedInfo = [UpDown parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong UpDown Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"UpDown Data : %@", netValueDic);
                }
                    break;
                case eMessageIDSendComment:
                {
                    @try {
                        parsedInfo = [Common parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong SendComment Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"SendComment Data : %@", netValueDic);
                }
                    break;
                case eMessageIDGetCommentByPage:
                case eMessageIDGetCommentByTimestamp:
                {
                    @try {
                        parsedInfo = [CommentInfoList parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong Comment Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    if (messageID == eMessageIDGetCommentByPage) {
                        id currentPage = [userInfo objectForKey:@"currentPage"];
                        if (currentPage != nil) {
                            [dic setObject:currentPage forKey:@"currentPage"];
                        }
                    }
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"Comment Data : %@", netValueDic);
                }
                    break;
                case eMessageIDGetTrustList:
                {
                    @try {
                        parsedInfo = [TrustInfoList parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong TrustInfoList Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"TrustInfoList Data : %@", netValueDic);
                }
                    break;
                case eMessageIDGetTrustByPage:
                {
                    @try {
                        parsedInfo = [TrustInfoPageList parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong TrustInfoPageList Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    if (messageID == eMessageIDGetTrustByPage) {
                        id currentPage = [userInfo objectForKey:@"currentPage"];
                        if (currentPage != nil) {
                            [dic setObject:currentPage forKey:@"currentPage"];
                        }
                    }
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"TrustInfoPageList Data : %@", netValueDic);
                }
                    break;
                case eMessageIDGetTrustContent:
                {
                    @try {
                        parsedInfo = [TrustDetailInfo parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong TrustDetailInfo Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"TrustDetailInfo Data : %@", netValueDic);
                }
                    break;
                case eMessageIDAppointTrust:
                {
                    @try {
                        parsedInfo = [Common parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong FixedIncomeAppointment Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"FixedIncomeAppointment Data : %@", netValueDic);
                }
                    break;
                case eMessageIDSendNotifyToken:
                {
                    @try {
                        parsedInfo = [Common parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong SendNotifyToken Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"SendNotifyToken Data : %@", netValueDic);
                }
                    break;
                case eMessageIDUploadContact:
                {
                    @try {
                        parsedInfo = [Common parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong uploadContact Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"uploadContact Data : %@", netValueDic);
                }
                    break;
                case eMessageIDGetFixedInvestOderByPage:
                {
                    @try {
                        parsedInfo = [FundFixedUpdate parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong FundFixedUpdate Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    if (userInfo != nil)
                    {
                        NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                        [dic setObject:[userInfo objectForKey:@"kind"] forKey:@"kind"];
                        [dic setObject:[userInfo objectForKey:@"pageNum"] forKey:@"pageNum"];
                        [dic setObject:[userInfo objectForKey:@"type"] forKey:@"type"];
                        [dic setObject:[userInfo objectForKey:@"order"] forKey:@"order"];
                        netValueDic = [parsedInfo dictionary:dic];
                        HBInfoLog(@"FundFixedUpdate Data : %@", netValueDic);
                    }
                }
                    break;
                case eMessageIDDingYue:
                {
                    @try {
                        parsedInfo = [Common parseFromData:uncompressedData];
                    }
                    @catch (NSException *exception) {
                        HBErrorLog(@"Wrong DingYue Data<%@: %@>", [exception name], [exception reason]);
                        break;
                    }
                    @finally {
                        //
                    }
                    
                    NSMutableDictionary* dic = [[[NSMutableDictionary alloc]init]autorelease];
                    netValueDic = [parsedInfo dictionary:dic];
                    HBInfoLog(@"DingYue Data : %@", netValueDic);
                }
                    break;
                default:
                    break;
            }
        }
        
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObject:[NSNumber numberWithInt:messageID] forKey:REQUEST_TAG_KEY];
        
        if (netValueDic == nil)
        {
            [dic setObject:@"0" forKey:KNWK_ResponseCode];
            [dic setObject:@"服务器数据格式错误" forKey:KNWK_ResponseContent];
        }
        else
        {
            [dic addEntriesFromDictionary:netValueDic];
        }
        
        [HBTools printTimeNow:[NSString stringWithFormat:@"parseRequest end : %d", messageID]];
        
        return dic;
    }
    
    return nil;
}
@end

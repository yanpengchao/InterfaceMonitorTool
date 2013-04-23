//
//  HBDataManager.h
//  HowbuyFund
//
//  Created by pengchao.yan on 12-9-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBMessageDefine.h"

@class ASIHTTPRequest;
@class ASINetworkQueue;
@protocol HBDataManagerDelegate <NSObject>

- (void)requestStarted:(ASIHTTPRequest *)request withTag:(EMessageID)tag;
- (void)requestFinished:(ASIHTTPRequest *)request withData:(NSDictionary*)data andTag:(EMessageID)tag;
- (void)requestFailed:(ASIHTTPRequest *)request withTag:(EMessageID)tag;

@end

@interface HBDataManager : NSObject
{
    NSMutableArray* _delegateArray;
    ASINetworkQueue* _netWorkQueue;
    
    dispatch_queue_t    _taskQueue;
}

@property (nonatomic, retain)NSMutableArray* delegateArray;
@property (nonatomic, retain)ASINetworkQueue* netWorkQueue;
@property (nonatomic, assign)dispatch_queue_t taskQueue;

+ (HBDataManager*)getInstance;
- (void)addDelegate:(id<HBDataManagerDelegate>)delegate forRequestTag:(NSInteger)requestTag;
- (void)delDelegateByRequestTag:(NSInteger)requestTag;
- (void)delDelegate:(id<HBDataManagerDelegate>)delegate  withTag:(NSInteger)requestTag;
- (ASIHTTPRequest*)requestNetWork:(EMessageID)type withParams:(NSDictionary*)paramsDic;
- (ASIHTTPRequest*)request:(ASIHTTPRequest*)request withParams:(NSDictionary*)paramsDic delegate:(id)delegate finishSelector:(SEL)finish failSelector:(SEL)fail;
- (ASIHTTPRequest*)requestNetWork:(EMessageID)type withParams:(NSDictionary*)paramsDic delegate:(id)delegate finishSelector:(SEL)finish failSelector:(SEL)fail;
- (BOOL)cancelRequestByType:(EMessageID)type;
- (BOOL)cancelRequest:(ASIHTTPRequest*)request;

@end

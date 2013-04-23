//
//  HBFeiXin.h
//  InterfaceMonitorTool
//
//  Created by pengchao.yan on 13-4-9.
//  Copyright (c) 2013年 pengchao.yan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum _ESendMessageStatus_
{
    eSendMessageStatusUnknown,      // 未知
    eSendMessageStatusDidNotLogin,  // 未登陆
    eSendMessageStatusCheckLogin,   // 检查登陆
    eSendMessageStatusSendMsg,      // 发送消息
    eSendMessageStatusLogout        // 登出
}ESendMessageStatus;

@interface HBFeiXin : NSObject <UIWebViewDelegate>

@property (nonatomic, strong)UIWebView* webView;
@property (nonatomic)ESendMessageStatus eSendStatus;
@property (nonatomic, strong)NSArray* smsTextArray;

- (id)init;
- (void)sendSms:(NSString*)smsText;
+ (HBFeiXin*)getInstance;

@end

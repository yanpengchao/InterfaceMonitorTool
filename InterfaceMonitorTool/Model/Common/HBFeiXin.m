//
//  HBFeiXin.m
//  InterfaceMonitorTool
//
//  Created by pengchao.yan on 13-4-9.
//  Copyright (c) 2013年 pengchao.yan. All rights reserved.
//

#import "HBFeiXin.h"
#import "HBAppConfig.h"

static HBFeiXin* sFeiXin = nil;
#define LOGIN_URL   @"http://f.10086.cn/im5/login/loginHtml5.action"
#define CHECK_URL   @"http://f.10086.cn/im/login/cklogin.action"
#define SEND_URL    @"http://f.10086.cn/im/user/sendMsgToMyselfs.action"
#define LOGOUT_URL  @"http://f.10086.cn/im/index/logoutsubmit.action"
#define SEND_URL_FMT   @"http://f.10086.cn/im5/chat/sendNewGroupShortMsg.action?t=%f"

@interface HBFeiXin ()
@property (nonatomic, strong)NSString* smsText;
@end

@implementation HBFeiXin

- (id)init
{
    self = [super init];
    
    if (self) {
        self.eSendStatus = eSendMessageStatusUnknown;
    }
    
    return self;
}

- (void)sendSms:(NSString*)smsText
{
    @synchronized (self.smsTextArray)
    {
        if ([self.smsTextArray count] <= 0) {
            self.smsTextArray = [NSArray arrayWithObject:smsText];
            [self startSendSms];
        }
        else
        {
            NSMutableArray* mArray = [NSMutableArray arrayWithArray:self.smsTextArray];
            [mArray addObject:smsText];
            self.smsTextArray = mArray;
        }
    }
}

- (void)startSendSms
{
    if ([HBAppConfig getInstance].isSendSmsOn) {
        
        @synchronized (self.smsTextArray)
        {
            if ([self.smsTextArray count] > 0) {
                self.smsText = [self.smsTextArray objectAtIndex:0];
                
                NSMutableArray* mArray = [NSMutableArray arrayWithArray:self.smsTextArray];
                [mArray removeObjectAtIndex:0];
                self.smsTextArray = mArray;
                
                if (self.webView == nil) {
                    self.webView = [[UIWebView alloc] init];
                    [self.webView setDelegate:self];
                }
                
                [self login];
            }
        }
    }
}

+ (HBFeiXin*)getInstance
{
    if (sFeiXin == nil) {
        @synchronized(self)
        {
            if (sFeiXin == nil) {
                sFeiXin = [[self alloc] init];
            }
        }
    }
    
    return sFeiXin;
}

#pragma mark - local functions
- (void)login
{
    self.eSendStatus = eSendMessageStatusUnknown;
    
    NSString* phoneNumber = @"15821748883";
    NSString* password = @"pcyan3166";
    NSString* checkCode = @"NjU1MQ%3D%3D&checkCode=6551";
    NSString* url = [NSString stringWithFormat:@"%@?m=%@&pass=%@&codekey=%@", LOGIN_URL, phoneNumber, password, checkCode];
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"POST"];
    [self.webView loadRequest:request];
}

- (void)checkLogin
{
    self.eSendStatus = eSendMessageStatusUnknown;
    
    NSString* url = CHECK_URL;
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    [self.webView loadRequest:request];
}

- (void)sendSms
{
    self.eSendStatus = eSendMessageStatusUnknown;
    
    NSString* sms = @"hello";
    NSString* url = [NSString stringWithFormat:@"%@?msg=%@", SEND_URL, sms];
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"POST"];
    [self.webView loadRequest:request];
}

- (void)sendSms2
{
    NSMutableString* userString = [NSMutableString string];
    for (NSDictionary* dic in [HBAppConfig getInstance].monitorUserArray) {
        if ([[dic objectForKey:MONITOR_USER_SENDFLAG_KEY] boolValue]) {
            [userString appendFormat:@",%@", [dic objectForKey:MONITOR_USER_UID_KEY]];
        }
    }
    
    if ([userString length] <= 0) {
        return;
    }
    
    self.eSendStatus = eSendMessageStatusUnknown;
    
    NSDate* now = [NSDate date];
    NSTimeInterval times = now.timeIntervalSince1970;
    NSString* url = [NSString stringWithFormat:SEND_URL_FMT, times*1000];
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"POST"];
    
    NSString* parameterString = [NSString stringWithFormat:@"msg=%@&touserid=%@", self.smsText, userString];
//    NSString* parameterString = [NSString stringWithFormat:@"msg=%@&touserid=,393036566,230047837", self.smsText];
    NSMutableData *data = [NSMutableData dataWithData:[parameterString dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody:data];
    
    [self.webView loadRequest:request];
    
    // 发送下条短信
    NSTimer* timer = [NSTimer timerWithTimeInterval:1*60 target:self selector:@selector(startSendSms) userInfo:nil repeats:NO];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}

- (void)logout
{
    self.eSendStatus = eSendMessageStatusUnknown;
    
    NSString* url = LOGOUT_URL;
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    [self.webView loadRequest:request];
}

#pragma mark - UIWebViewDelegate functions

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString* urlString = request.URL.absoluteString;
    NSLog(@"shouldStartLoadWithRequest request url : %@", urlString);
    
    if ([urlString hasPrefix:LOGIN_URL]) {
        self.eSendStatus = eSendMessageStatusDidNotLogin;
    }
    else if ([urlString hasPrefix:CHECK_URL])
    {
        self.eSendStatus = eSendMessageStatusCheckLogin;
    }
    else if ([urlString hasPrefix:SEND_URL])
    {
        self.eSendStatus = eSendMessageStatusSendMsg;
    }
    else if ([urlString hasPrefix:LOGOUT_URL])
    {
        self.eSendStatus = eSendMessageStatusLogout;
    }
    
    //    if ([urlString hasPrefix:LOGIN_URL] ||
    //        [urlString hasPrefix:SEND_URL] ||
    //        [urlString hasPrefix:CHECK_URL] ||
    //        [urlString hasPrefix:LOGOUT_URL]) {
    return YES;
    //    }
    //    return NO;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSString* urlString = self.webView.request.URL.absoluteString;
    NSLog(@"webViewDidStartLoad request url : %@", urlString);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSString* urlString = self.webView.request.URL.absoluteString;
    NSLog(@"webViewDidFinishLoad request url : %@", urlString);
    
    if ([urlString hasPrefix:LOGIN_URL] && self.eSendStatus == eSendMessageStatusDidNotLogin) {
        [self performSelectorOnMainThread:@selector(sendSms2) withObject:nil waitUntilDone:NO];
    }
    else if ([urlString hasPrefix:CHECK_URL] && self.eSendStatus == eSendMessageStatusCheckLogin)
    {
        [self performSelectorOnMainThread:@selector(sendSms) withObject:nil waitUntilDone:NO];
    }
    else if ([urlString hasPrefix:SEND_URL] && self.eSendStatus == eSendMessageStatusSendMsg)
    {
        [self performSelectorOnMainThread:@selector(logout) withObject:nil waitUntilDone:NO];
    }
    else if ([urlString hasPrefix:LOGOUT_URL])
    {
//        UIAlertView* alertVew = [[UIAlertView alloc] initWithTitle:@"发送短信" message:@"短信已发送" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//        [alertVew show];
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSString* urlString = self.webView.request.URL.absoluteString;
    NSLog(@"didFailLoadWithError request url : %@", urlString);
    
//    UIAlertView* alertVew = [[UIAlertView alloc] initWithTitle:@"发送短信" message:[error description] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//    [alertVew show];
}

@end

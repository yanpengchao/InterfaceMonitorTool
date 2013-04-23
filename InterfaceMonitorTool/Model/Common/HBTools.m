//
//  HBTools.m
//  HowbuyFund
//
//  Created by pengchao.yan on 12-9-12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HBTools.h"
#import <objc/runtime.h>
#import "Reachability.h"

@implementation HBTools

+ (BOOL)isOSMultiTaskEnable 
{
    UIDevice *device = [UIDevice currentDevice];
    return [device.systemVersion floatValue] >= 4.0;
}

+ (NSString*)getMyDocumentPath {
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
}

+ (NSString*)getClassName:(Class)clazz
{
    const char * className = class_getName(clazz);
    return [NSString  stringWithCString:className encoding:NSUTF8StringEncoding];
}

+ (void)printTimeNow:(NSString*)preLogInfo
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    HBInfoLog(@"printTimeNow %@:%@", preLogInfo, [dateFormatter stringFromDate:[NSDate date]]);
    [dateFormatter release];
}

+ (BOOL)isNetWorkEnable
{
    struct sockaddr_in initAddress;         //sockaddr_in是与sockaddr等价的数据结构
    bzero(&initAddress, sizeof(initAddress));
    initAddress.sin_len = sizeof(initAddress);
    initAddress.sin_family = AF_INET;       //sin_family是地址家族，一般都是“AF_xxx”的形式。通常大多用的是都是AF_INET,代表TCP/IP协议族
    
    SCNetworkReachabilityRef readRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&initAddress); //创建测试连接的引用：
    SCNetworkReachabilityFlags flags;
    
    BOOL getRetrieveFlags = SCNetworkReachabilityGetFlags(readRouteReachability, &flags);
    CFRelease(readRouteReachability);
    
    if (!getRetrieveFlags) {
        return NO;
    }
    
    BOOL flagsReachable = ((flags & kSCNetworkFlagsReachable) != 0);
    BOOL connectionRequired = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
    return (flagsReachable && !connectionRequired) ? YES : NO;
//    return [[Reachability reachabilityWithHostName:@"http://www.apple.com.cn"] isReachable];
}

+ (void)MessageBoxWithMessage:(NSString*)message title:(NSString*)title
{
    if (title == nil) {
        title = @"掌上基金";
    }
    
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
    [alertView release];
}
@end

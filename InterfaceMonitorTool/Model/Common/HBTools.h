//
//  HBTools.h
//  HowbuyFund
//
//  Created by pengchao.yan on 12-9-12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBTools : NSObject

+ (BOOL)isOSMultiTaskEnable;
+ (NSString*)getMyDocumentPath;
+ (NSString*)getClassName:(Class)clazz;
+ (void)printTimeNow:(NSString*)preLogInfo;
+ (BOOL)isNetWorkEnable;
+ (void)MessageBoxWithMessage:(NSString*)message title:(NSString*)title;

@end

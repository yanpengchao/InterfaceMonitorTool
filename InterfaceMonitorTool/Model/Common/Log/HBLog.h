//
//  HBLog.h
//  HowbuyFund
//
//  Created by yan pengchao on 12-3-16.
//  Copyright (c) 2012年 Howbuy. All rights reserved.
//

/*
 Off: 表示最高的等级，如果一个logger的等级标记为Off， 将不会记录任何信息；
 Fatal: 表示非常严重的错误等级，记录极有可能导致应用程序终止运行的致命错误信息；
 Error: 表示较严重的错误等级，但是程序可以继续运行的信息；
 Warn: 表示可能对系统有损害的情况；
 Info: 默认的等级，当日志等级配置为Info时，真正的等级不一定是Info，而是LoggerRepository.LevelMap["INFO"]，虽然这个默认值是Info，但是可以通过重新配置日志等级映射来改变；
 Debug: 这个等级表示用于调试程序的正常的事件信息；
 All: 表示最低的日志等级。
 */

#ifndef HowbuyFund_HBLog_h
#define HowbuyFund_HBLog_h

#if !defined(HBLogLevelAll) && !defined(HBLogLevelDebug) && !defined(HBLogLevelInfo) && !defined(HBLogLevelWarn) && !defined(HBLogLevelError) && !defined(HBLogLevelFatal) && !defined(HBLogLevelOff)
//#error you have to define the log level
#warning you did not define the log level, we all use the default one : HBLogLevelInfo

//#define HBLogLevelAll
//#define HBLogLevelDebug
//#define HBLogLevelInfo
//#define HBLogLevelWarn
//#define HBLogLevelError
//#define HBLogLevelFatal
//#define HBLogLevelOff

//#define HBLogPrintDetails

#endif

#ifdef HBLogLevelAll
#define HBLogLevelDebug
    #ifdef HBLogPrintDetails
    #define HBLog(format, ...) NSLog(format", File:%s & Function:%s & Line:%d", ## __VA_ARGS__, __FILE__, __FUNCTION__, __LINE__)
    #else
    #define HBLog(format, ...) NSLog(format, ## __VA_ARGS__)
    #endif
#else
#define HBLog(format, ...)
#endif

#ifdef HBLogLevelDebug
#define HBLogLevelInfo
    #ifdef HBLogPrintDetails
    #define HBDebugLog(format, ...) NSLog(format", File:%s & Function:%s & Line:%d", ## __VA_ARGS__, __FILE__, __FUNCTION__, __LINE__)
    #else
    #define HBDebugLog(format, ...) NSLog(format, ## __VA_ARGS__)
    #endif
#else
#define HBDebugLog(format, ...)
#endif

#ifdef HBLogLevelInfo
#define HBLogLevelWarn
    #ifdef HBLogPrintDetails
    #define HBInfoLog(format, ...) NSLog(format", File:%s & Function:%s & Line:%d", ## __VA_ARGS__, __FILE__, __FUNCTION__, __LINE__)
    #else
    #define HBInfoLog(format, ...) NSLog(format, ## __VA_ARGS__)
    #endif
#else
#define HBInfoLog(format, ...)
#endif

#ifdef HBLogLevelWarn
#define HBLogLevelError
    #ifdef HBLogPrintDetails
    #define HBWarnLog(format, ...) NSLog(format", File:%s & Function:%s & Line:%d", ## __VA_ARGS__, __FILE__, __FUNCTION__, __LINE__)
    #else
    #define HBWarnLog(format, ...) NSLog(format, ## __VA_ARGS__)
    #endif
#else
#define HBWarnLog(format, ...)
#endif

#ifdef HBLogLevelError
#define HBLogLevelFatal
    #ifdef HBLogPrintDetails
    #define HBErrorLog(format, ...) NSLog(format", File:%s & Function:%s & Line:%d", ## __VA_ARGS__, __FILE__, __FUNCTION__, __LINE__)
    #else
    #define HBErrorLog(format, ...) NSLog(format, ## __VA_ARGS__)
    #endif
#else
#define HBErrorLog(format, ...)
#endif

#ifdef HBLogLevelFatal
#define HBLogLevelOff
    #ifdef HBLogPrintDetails
    #define HBFatalLog(format, ...) NSLog(format", File:%s & Function:%s & Line:%d", ## __VA_ARGS__, __FILE__, __FUNCTION__, __LINE__)
    #else
    #define HBFatalLog(format, ...) NSLog(format, ## __VA_ARGS__)
    #endif
#else
#define HBFatalLog(format, ...)
#endif

#ifdef HBLogLevelOff
#define HBOffLog(format, ...)
#else
#define HBOffLog(format, ...)
#endif

#endif

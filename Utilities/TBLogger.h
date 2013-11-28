//
//  TBLogger.h
//
//  Created by ISHII 2bit
//  Copyright (c) 2013 buffer Renaiss co., ltd. All rights reserved.
//
//  require (if use with Xcode) : https://github.com/robbiehanson/XcodeColors/downloads
//

#ifndef __TBLogger_h__
#define __TBLogger_h__

#ifdef __OBJC__

//#define SET_LOG_LEVEL_TRACE

#pragma GCC diagnostic ignored "-Wunused-variable"
#pragma GCC diagnostic ignored "-Wunused-function"

#if __clang__
#   pragma clang diagnostic push
#   pragma clang diagnostic ignored "-Wunused-variable"
#   pragma clang diagnostic ignored "-Wunused-function"
#endif

#define TB_LOG_TRACE   16
#define TB_LOG_INFO     8
#define TB_LOG_DEBUG    4
#define TB_LOG_WARNING  2
#define TB_LOG_ERROR    1

#ifdef SET_LOG_LEVEL_TRACE
#   define TB_LOG_LEVEL 31
#endif

#ifdef SET_LOG_LEVEL_INFO
#   define TB_LOG_LEVEL 15
#endif

#ifdef SET_LOG_LEVEL_DEBUG
#   define TB_LOG_LEVEL 7
#endif

#ifdef SET_LOG_LEVEL_WARNING
#   define TB_LOG_LEVEL 3
#endif

#ifdef SET_LOG_LEVEL_ERROR
#   define TB_LOG_LEVEL 1
#endif

#define IS_ENABLE_LEVEL(log_level) (TB_LOG_LEVEL & log_level)

static void __TBSetColorMod__(unsigned char *c, unsigned char r, unsigned char g, unsigned char b) {*c=r;c[1]=g;c[2]=b;}

#define __TB_DEF_CONBINE3__(x, y, z) x##y##z
#define __LOG_COLOR__(log_level) __TB_DEF_CONBINE3__(__TB_LOG_, log_level, _COLOR__)
#define TBLogModule(format, log_level, ...) \
NSLog(@"\033[fg%d,%d,%d;\n    %s at %s:%d %@\033[;", __LOG_COLOR__(log_level)[0], __LOG_COLOR__(log_level)[1], __LOG_COLOR__(log_level)[2], #log_level, __PRETTY_FUNCTION__, __LINE__, [NSString stringWithFormat:format, ## __VA_ARGS__])
#define TBIfModule(condition, format, log_level, ...) \
if(condition) NSLog(@"\033[fg%d,%d,%d;\n    %s at %s:%d [\"%s\" is true]\n    %@\033[;", __LOG_COLOR__(log_level)[0], __LOG_COLOR__(log_level)[1], __LOG_COLOR__(log_level)[2], #log_level, __PRETTY_FUNCTION__, __LINE__, #condition, [NSString stringWithFormat:format, ## __VA_ARGS__])
#define __TB_DEFINE_COLOR__(log_level, r, g, b) static unsigned char __LOG_COLOR__(log_level)[3] = {r, g, b};

/* TRACE */
#if IS_ENABLE_LEVEL(TB_LOG_TRACE)
__TB_DEFINE_COLOR__(TRACE, 128, 128, 128)
#   define SET_TRACE_COLOR(r, g, b) __TBSetColorMod__(__LOG_COLOR__(TRACE), r, g, b);
#   define LogTrace(format, ...) TBLogModule(format, TRACE, ## __VA_ARGS__)

#   define IfTrace(condition, format, ...) TBIfModule(condition, format, "TRACE", __TB_LOG_TRACE_COLOR__, ## __VA_ARGS__)
#else
#   define LogTrace(...) ;
#   define IfTrace(...) ;
#   undef __LEVEL__
#endif  // end of ifdef LOG_TRACE

#if IS_ENABLE_LEVEL(TB_LOG_INFO)
__TB_DEFINE_COLOR__(INFO, 0, 255, 0)
#   define SET_INFO_COLOR(r, g, b) __TBSetColorMod__(__LOG_COLOR__(INFO), r, g, b);
#   define LogInfo(format, ...) TBLogModule(format, INFO, ## __VA_ARGS__)
#   define IfInfo(condition, format, ...) TBIfModule(condition, format, INFO, ## __VA_ARGS__)
#else
#   define LogInfo(...) ;
#   define IfInfo(...) ;
#endif  // end of ifdef LOG_INFO

#if IS_ENABLE_LEVEL(TB_LOG_DEBUG)
__TB_DEFINE_COLOR__(DEBUG, 0, 255, 255)
#   define SET_DEBUG_COLOR(r, g, b) __TBSetColorMod__(__LOG_COLOR__(DEBUG), r, g, b);
#   define LogDebug(format, ...) TBLogModule(format, DEBUG, ## __VA_ARGS__)
#   define IfDebug(condition, format, ...) TBIfModule(condition, format, DEBUG, ## __VA_ARGS__)
#else
#   define LogDebug(...) ;
#   define IfDebug(...) ;
#endif  // end of ifdef LOG_DEBUG

#if IS_ENABLE_LEVEL(TB_LOG_WARNING)
__TB_DEFINE_COLOR__(WARNING, 255, 255, 0)
#   define SET_WARNING_COLOR(r, g, b) __TBSetColorMod__(__LOG_COLOR__(WARNING), r, g, b);
#   define LogWarning(format, ...) TBLogModule(format, WARNING, ## __VA_ARGS__)
#   define IfWarning(condition, format, ...) TBIfModule(condition, format, WARNING, ## __VA_ARGS__)
#else
#   define LogWarning(...) ;
#   define IfWarning(...) ;
#endif  // end of ifdef LOG_WARNING

#if IS_ENABLE_LEVEL(TB_LOG_ERROR)
__TB_DEFINE_COLOR__(ERROR, 255, 0, 0)
#   define SET_ERROR_COLOR(r, g, b) __TBSetColorMod__(__LOG_COLOR__(ERROR), r, g, b);
#   define LogError(format, ...) TBLogModule(format, ERROR, ## __VA_ARGS__)
#   define IfError(condition, format, ...) TBIfModule(condition, format, ERROR, ## __VA_ARGS__)
#else
#   define LogError(...) ;
#   define IfError(...) ;
#endif // end of ifdef LOG_ERROR

static void TBUncaughtExceptionHandler(NSException *exception) {
    LogError(@"Exception: %@", exception);
    LogError(@"Call stack symbols:\n%@", [exception callStackSymbols]);
}

#define TBLoggerEnablePrintCallStackSymbols() NSSetUncaughtExceptionHandler(&TBUncaughtExceptionHandler);

#if __clang__
#   pragma clang diagnostic pop
#endif

#pragma GCC diagnostic warning "-Wunused-function"
#pragma GCC diagnostic warning "-Wunused-variable"

#endif // end of ifdef __OBJC__
#endif // end of ifndef __TBLogger_h_
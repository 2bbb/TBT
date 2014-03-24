/* **** **** **** **** **** **** **** **** **** **** **** **** *
 *.............................................................*
 *...........▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄..............*
 *..........▐░░░░░░░░░░░▌▐░░░░░░░░░░▌▐░░░░░░░░░░░▌.............*
 *...........▀▀▀▀█░█▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌▀▀▀▀█░█▀▀▀▀..............*
 *...............▐░▌.....▐░▌.......▐░▌....▐░▌..................*
 *...............▐░▌.....▐░█▄▄▄▄▄▄▄█░▌....▐░▌..................*
 *...............▐░▌.....▐░░░░░░░░░░▌.....▐░▌..................*
 *...............▐░▌.....▐░█▀▀▀▀▀▀▀█░▌....▐░▌..................*
 *...............▐░▌.....▐░▌.......▐░▌....▐░▌..................*
 *...............▐░▌.....▐░█▄▄▄▄▄▄▄█░▌....▐░▌..................*
 *...............▐░▌.....▐░░░░░░░░░░▌.....▐░▌..................*
 *................▀.......▀▀▀▀▀▀▀▀▀▀.......▀...................*
 *.............................................................*
 * **** **** **** **** **** **** **** **** **** **** **** **** */

//
//  TBTLogger.h
//
//  Created by ISHII 2bit
//  Copyright (c) 2013 buffer Renaiss co., ltd. All rights reserved.
//
//  require (if use with Xcode) : https://github.com/robbiehanson/XcodeColors/downloads
//

#ifndef __TBTLogger_h__
#define __TBTLogger_h__

#ifdef __OBJC__

//#define SET_LOG_LEVEL_TRACE

#pragma GCC diagnostic ignored "-Wunused-variable"
#pragma GCC diagnostic ignored "-Wunused-function"

#if __clang__
#   pragma clang diagnostic push
#   pragma clang diagnostic ignored "-Wunused-variable"
#   pragma clang diagnostic ignored "-Wunused-function"
#endif

#define TBT_LOG_TRACE   16
#define TBT_LOG_INFO     8
#define TBT_LOG_DEBUG    4
#define TBT_LOG_WARNING  2
#define TBT_LOG_ERROR    1

#ifdef SET_LOG_LEVEL_TRACE
#   define TBT_LOG_LEVEL 31
#endif

#ifdef SET_LOG_LEVEL_INFO
#   define TBT_LOG_LEVEL 15
#endif

#ifdef SET_LOG_LEVEL_DEBUG
#   define TBT_LOG_LEVEL 7
#endif

#ifdef SET_LOG_LEVEL_WARNING
#   define TBT_LOG_LEVEL 3
#endif

#ifdef SET_LOG_LEVEL_ERROR
#   define TBT_LOG_LEVEL 1
#endif

#define IS_ENABLE_LEVEL(log_level) (TBT_LOG_LEVEL & log_level)

static void __TBTSetColorMod__(unsigned char *c, unsigned char r, unsigned char g, unsigned char b) {*c=r;c[1]=g;c[2]=b;}

#define __TBT_DEF_CONBINE3__(x, y, z) x##y##z
#define __LOG_COLOR__(log_level) __TBT_DEF_CONBINE3__(__TBT_LOG_, log_level, _COLOR__)
#define TBTLogModule(format, log_level, ...) \
NSLog(@"\033[fg%d,%d,%d;\n    %s at %s:%d %@\033[;", __LOG_COLOR__(log_level)[0], __LOG_COLOR__(log_level)[1], __LOG_COLOR__(log_level)[2], #log_level, __PRETTY_FUNCTION__, __LINE__, [NSString stringWithFormat:format, ## __VA_ARGS__])
#define TBTIfModule(condition, format, log_level, ...) \
if(condition) NSLog(@"\033[fg%d,%d,%d;\n    %s at %s:%d [\"%s\" is true]\n    %@\033[;", __LOG_COLOR__(log_level)[0], __LOG_COLOR__(log_level)[1], __LOG_COLOR__(log_level)[2], #log_level, __PRETTY_FUNCTION__, __LINE__, #condition, [NSString stringWithFormat:format, ## __VA_ARGS__])
#define __TBT_DEFINE_COLOR__(log_level, r, g, b) static unsigned char __LOG_COLOR__(log_level)[3] = {r, g, b};

/* TRACE */
#if IS_ENABLE_LEVEL(TBT_LOG_TRACE)
__TBT_DEFINE_COLOR__(TRACE, 128, 128, 128)
#   define SET_TRACE_COLOR(r, g, b) __TBSetColorMod__(__LOG_COLOR__(TRACE), r, g, b);
#   define LogTrace(format, ...) TBTLogModule(format, TRACE, ## __VA_ARGS__)

#   define IfTrace(condition, format, ...) TBTIfModule(condition, format, "TRACE", __TBT_LOG_TRACE_COLOR__, ## __VA_ARGS__)
#else
#   define LogTrace(...) ;
#   define IfTrace(...) ;
#   undef __LEVEL__
#endif  // end of ifdef LOG_TRACE

#if IS_ENABLE_LEVEL(TBT_LOG_INFO)
__TBT_DEFINE_COLOR__(INFO, 0, 255, 0)
#   define SET_INFO_COLOR(r, g, b) __TBSetColorMod__(__LOG_COLOR__(INFO), r, g, b);
#   define LogInfo(format, ...) TBTLogModule(format, INFO, ## __VA_ARGS__)
#   define IfInfo(condition, format, ...) TBTIfModule(condition, format, INFO, ## __VA_ARGS__)
#else
#   define LogInfo(...) ;
#   define IfInfo(...) ;
#endif  // end of ifdef LOG_INFO

#if IS_ENABLE_LEVEL(TBT_LOG_DEBUG)
__TBT_DEFINE_COLOR__(DEBUG, 0, 255, 255)
#   define SET_DEBUG_COLOR(r, g, b) __TBSetColorMod__(__LOG_COLOR__(DEBUG), r, g, b);
#   define LogDebug(format, ...) TBTLogModule(format, DEBUG, ## __VA_ARGS__)
#   define IfDebug(condition, format, ...) TBTIfModule(condition, format, DEBUG, ## __VA_ARGS__)
#else
#   define LogDebug(...) ;
#   define IfDebug(...) ;
#endif  // end of ifdef LOG_DEBUG

#if IS_ENABLE_LEVEL(TBT_LOG_WARNING)
__TBT_DEFINE_COLOR__(WARNING, 255, 255, 0)
#   define SET_WARNING_COLOR(r, g, b) __TBSetColorMod__(__LOG_COLOR__(WARNING), r, g, b);
#   define LogWarning(format, ...) TBTLogModule(format, WARNING, ## __VA_ARGS__)
#   define IfWarning(condition, format, ...) TBTIfModule(condition, format, WARNING, ## __VA_ARGS__)
#else
#   define LogWarning(...) ;
#   define IfWarning(...) ;
#endif  // end of ifdef LOG_WARNING

#if IS_ENABLE_LEVEL(TBT_LOG_ERROR)
__TBT_DEFINE_COLOR__(ERROR, 255, 0, 0)
#   define SET_ERROR_COLOR(r, g, b) __TBSetColorMod__(__LOG_COLOR__(ERROR), r, g, b);
#   define LogError(format, ...) TBTLogModule(format, ERROR, ## __VA_ARGS__)
#   define IfError(condition, format, ...) TBTIfModule(condition, format, ERROR, ## __VA_ARGS__)
#else
#   define LogError(...) ;
#   define IfError(...) ;
#endif // end of ifdef LOG_ERROR

static void TBTUncaughtExceptionHandler(NSException *exception) {
    LogError(@"Exception: %@", exception);
    LogError(@"Call stack symbols:\n%@", [exception callStackSymbols]);
}

#define TBTLoggerEnablePrintCallStackSymbols() NSSetUncaughtExceptionHandler(&TBTUncaughtExceptionHandler);

#if __clang__
#   pragma clang diagnostic pop
#endif

#pragma GCC diagnostic warning "-Wunused-function"
#pragma GCC diagnostic warning "-Wunused-variable"

#endif // end of ifdef __OBJC__
#endif // end of ifndef __TBLogger_h_
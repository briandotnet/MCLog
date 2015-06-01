//
//  MCSettings.m
//  MCLog
//
//  Created by Brian Ge on 6/1/15.
//  Copyright (c) 2015 Brian Ge. All rights reserved.
//

#import "MCSettings.h"

@implementation MCSettings

NSString *const kMCLogLevelVerbosePrefix = @"com.bge.MCLog.LogLevelSettings.Verbose.Prefix";
NSString *const kMCLogLevelVerboseColor = @"com.bge.MCLog.LogLevelSettings.Verbose.Color";
NSString *const kMCLogLevelDebugPrefix = @"com.bge.MCLog.LogLevelSettings.Debug.Prefix";
NSString *const kMCLogLevelDebugColor = @"com.bge.MCLog.LogLevelSettings.Debug.Color";
NSString *const kMCLogLevelInfoPrefix = @"com.bge.MCLog.LogLevelSettings.Info.Prefix";
NSString *const kMCLogLevelInfoColor = @"com.bge.MCLog.LogLevelSettings.Info.Color";
NSString *const kMCLogLevelWarningPrefix = @"com.bge.MCLog.LogLevelSettings.Warning.Prefix";
NSString *const kMCLogLevelWarningColor = @"com.bge.MCLog.LogLevelSettings.Warning.Color";
NSString *const kMCLogLevelErrorPrefix = @"com.bge.MCLog.LogLevelSettings.Error.Prefix";
NSString *const kMCLogLevelErrorColor = @"com.bge.MCLog.LogLevelSettings.Error.Color";

+ (instancetype)defaultSetting
{
    static dispatch_once_t once;
    static MCSettings *defaultSetting;
    dispatch_once(&once, ^ {
        defaultSetting = [[MCSettings alloc] init];
        NSDictionary *defaults = @{kMCLogLevelVerbosePrefix:@"VERBOSE",
                                   kMCLogLevelVerboseColor:@0x808080,
                                   kMCLogLevelDebugPrefix:@"DEBUG",
                                   kMCLogLevelDebugColor:@0x005FFF,
                                   kMCLogLevelInfoPrefix:@"INFO",
                                   kMCLogLevelInfoColor:@0x00AA00,
                                   kMCLogLevelWarningPrefix:@"WARN",
                                   kMCLogLevelWarningColor:@0xFF9900,
                                   kMCLogLevelErrorPrefix:@"ERROR",
                                   kMCLogLevelErrorColor:@0xD70000,
                                   };
        [[NSUserDefaults standardUserDefaults] registerDefaults:defaults];
    });
    return defaultSetting;
}

#pragma mark - getters

- (NSString*)verbosePrefix {
    return [[NSUserDefaults standardUserDefaults] stringForKey:kMCLogLevelVerbosePrefix];
}
- (NSNumber*)verboseColorCode {
    return (NSNumber*)[[NSUserDefaults standardUserDefaults] objectForKey:kMCLogLevelVerboseColor];
}
- (NSString*)debugPrefix {
    return [[NSUserDefaults standardUserDefaults] stringForKey:kMCLogLevelDebugPrefix];
}
- (NSNumber*)debugColorCode {
    return (NSNumber*)[[NSUserDefaults standardUserDefaults] objectForKey:kMCLogLevelDebugColor];
}
- (NSString*)infoPrefix {
    return [[NSUserDefaults standardUserDefaults] stringForKey:kMCLogLevelInfoPrefix];
}
- (NSNumber*)infoColorCode {
    return (NSNumber*)[[NSUserDefaults standardUserDefaults] objectForKey:kMCLogLevelInfoColor];
}
- (NSString*)warningPrefix {
    return [[NSUserDefaults standardUserDefaults] stringForKey:kMCLogLevelWarningPrefix];
}
- (NSNumber*)warningColorCode {
    return (NSNumber*)[[NSUserDefaults standardUserDefaults] objectForKey:kMCLogLevelWarningColor];
}
- (NSString*)errorPrefix {
    return [[NSUserDefaults standardUserDefaults] stringForKey:kMCLogLevelErrorPrefix];
}
- (NSNumber*)erroeColorCode {
    return (NSNumber*)[[NSUserDefaults standardUserDefaults] objectForKey:kMCLogLevelErrorColor];
}

#pragma mark - setters

- (void)setVerbosePrefix:(NSString *)verbosePrefix {
    [[NSUserDefaults standardUserDefaults] setObject:verbosePrefix forKey:kMCLogLevelVerbosePrefix];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setVerboseColorCode:(NSNumber *)verboseColorCode {
    [[NSUserDefaults standardUserDefaults] setObject:verboseColorCode forKey:kMCLogLevelVerboseColor];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setDebugPrefix:(NSString *)debugPrefix {
    [[NSUserDefaults standardUserDefaults] setObject:debugPrefix forKey:kMCLogLevelDebugPrefix];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setDebugColorCode:(NSNumber *)debugColorCode {
    [[NSUserDefaults standardUserDefaults] setObject:debugColorCode forKey:kMCLogLevelDebugColor];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setInfoPrefix:(NSString *)infoPrefix {
    [[NSUserDefaults standardUserDefaults] setObject:infoPrefix forKey:kMCLogLevelInfoPrefix];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setInfoColorCode:(NSNumber *)infoColorCode {
    [[NSUserDefaults standardUserDefaults] setObject:infoColorCode forKey:kMCLogLevelInfoColor];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setWarningPrefix:(NSString *)warningPrefix {
    [[NSUserDefaults standardUserDefaults] setObject:warningPrefix forKey:kMCLogLevelWarningPrefix];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setWarningColorCode:(NSNumber *)warningColorCode {
    [[NSUserDefaults standardUserDefaults] setObject:warningColorCode forKey:kMCLogLevelWarningColor];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setErrorPrefix:(NSString *)errorPrefix {
    [[NSUserDefaults standardUserDefaults] setObject:errorPrefix forKey:kMCLogLevelErrorPrefix];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setErrorColorCode:(NSNumber *)errorColorCode {
    [[NSUserDefaults standardUserDefaults] setObject:errorColorCode forKey:kMCLogLevelErrorColor];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - public methods
- (void)resetDefaults {
    self.verbosePrefix = @"VERBOSE";
    self.verboseColorCode = @0x808080;
    self.debugPrefix = @"DEBUG";
    self.debugColorCode = @0x005FFF;
    self.infoPrefix = @"INFO";
    self.infoColorCode = @0x00AA00;
    self.warningPrefix = @"WARN";
    self.warningColorCode = @0xFF9900;
    self.errorPrefix = @"ERROR",
    self.errorColorCode = @0xD70000;
}

@end

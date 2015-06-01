//
//  MCSettings.h
//  MCLog
//
//  Created by Brian Ge on 6/1/15.
//  Copyright (c) 2015 Brian Ge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCSettings : NSObject

+ (instancetype)defaultSetting;

@property (nonatomic, strong) NSString *verbosePrefix;
@property (nonatomic, strong) NSString *debugPrefix;
@property (nonatomic, strong) NSString *infoPrefix;
@property (nonatomic, strong) NSString *warningPrefix;
@property (nonatomic, strong) NSString *errorPrefix;

@property (nonatomic, strong) NSNumber *verboseColorCode;
@property (nonatomic, strong) NSNumber *debugColorCode;
@property (nonatomic, strong) NSNumber *infoColorCode;
@property (nonatomic, strong) NSNumber *warningColorCode;
@property (nonatomic, strong) NSNumber *errorColorCode;

- (void)resetDefaults;

@end

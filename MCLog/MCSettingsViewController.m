//
//  MCSettingsViewController.m
//  MCLog
//
//  Created by Brian Ge on 5/31/15.
//  Copyright (c) 2015 Brian Ge. All rights reserved.
//

#import "MCSettingsViewController.h"
#import "MCSettings.h"
@interface MCSettingsViewController ()

@property (weak) IBOutlet NSTextField *verbosePrefixText;
@property (weak) IBOutlet NSTextField *debugPrefixText;
@property (weak) IBOutlet NSTextField *infoPrefixText;
@property (weak) IBOutlet NSTextField *warningPrefixText;
@property (weak) IBOutlet NSTextField *errorPrefixText;

@property (weak) IBOutlet NSColorWell *verboseColorWell;
@property (weak) IBOutlet NSColorWell *debugColorWell;
@property (weak) IBOutlet NSColorWell *infoColorWell;
@property (weak) IBOutlet NSColorWell *warningColorWell;
@property (weak) IBOutlet NSColorWell *errorColorWell;

@end

@implementation MCSettingsViewController

#define NSColorWithHexRGB(rgb) [NSColor colorWithCalibratedRed:((rgb) >> 16 & 0xFF) / 255.f green:((rgb) >> 8 & 0xFF) / 255.f  blue:((rgb) & 0xFF) / 255.f  alpha:1.f]

- (void)windowDidLoad {
    [super windowDidLoad];
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    self.verbosePrefixText.delegate = self;
    self.debugPrefixText.delegate = self;
    self.infoPrefixText.delegate = self;
    self.warningPrefixText.delegate = self;
    self.errorPrefixText.delegate = self;
    
    [self setupUI];
}

- (void)setupUI {
    // prefixes
    self.verbosePrefixText.stringValue = [MCSettings defaultSetting].verbosePrefix;
    self.debugPrefixText.stringValue = [MCSettings defaultSetting].debugPrefix;
    self.infoPrefixText.stringValue = [MCSettings defaultSetting].infoPrefix;
    self.warningPrefixText.stringValue = [MCSettings defaultSetting].warningPrefix;
    self.errorPrefixText.stringValue = [MCSettings defaultSetting].errorPrefix;

    // colors
    NSColor* color = NSColorWithHexRGB(((NSNumber*)[MCSettings defaultSetting].verboseColorCode).integerValue);
    self.verboseColorWell.color = color;
    color = NSColorWithHexRGB(((NSNumber*)[MCSettings defaultSetting].debugColorCode).integerValue);
    self.debugColorWell.color = color;
    color = NSColorWithHexRGB(((NSNumber*)[MCSettings defaultSetting].infoColorCode).integerValue);
    self.infoColorWell.color = color;
    color = NSColorWithHexRGB(((NSNumber*)[MCSettings defaultSetting].warningColorCode).integerValue);
    self.warningColorWell.color = color;
    color = NSColorWithHexRGB(((NSNumber*)[MCSettings defaultSetting].errorColorCode).integerValue);
    self.errorColorWell.color = color;
}

- (void)prefixChanged:(id)sender {
    if (sender == self.verbosePrefixText) {
        [[MCSettings defaultSetting] setVerbosePrefix:[self.verbosePrefixText stringValue]];
    } else if (sender == self.debugPrefixText) {
        [[MCSettings defaultSetting] setDebugPrefix:[self.debugPrefixText stringValue]];
    } else if (sender == self.infoPrefixText) {
        [[MCSettings defaultSetting] setInfoPrefix:[self.infoPrefixText stringValue]];
    } else if (sender == self.warningPrefixText) {
        [[MCSettings defaultSetting] setWarningPrefix:[self.warningPrefixText stringValue]];
    } else if (sender == self.errorPrefixText) {
        [[MCSettings defaultSetting] setErrorPrefix:[self.errorPrefixText stringValue]];
    }
}

- (IBAction)colorChanged:(id)sender {
    if ([sender isKindOfClass:[NSColorWell class]]) {
        NSColor* selectedColor = ((NSColorWell*)sender).color;
        CGFloat red, green, blue;
        [selectedColor getRed:&red green:&green blue:&blue alpha:nil];
        int intRed, intGreen, intBlue;
        intRed = (int)(red * 255) << 16;
        intGreen = (int)(green * 255) << 8;
        intBlue = (int)(blue * 255);
        NSNumber* colorCode = [NSNumber numberWithInteger:intRed + intGreen + intBlue];
        if (sender == self.verboseColorWell) {
            [[MCSettings defaultSetting] setVerboseColorCode:colorCode];
        } else if (sender == self.debugColorWell) {
            [[MCSettings defaultSetting] setDebugColorCode:colorCode];
        } else if (sender == self.infoColorWell) {
            [[MCSettings defaultSetting] setInfoColorCode:colorCode];
        } else if (sender == self.warningColorWell) {
            [[MCSettings defaultSetting] setWarningColorCode:colorCode];
        } else if (sender == self.errorColorWell) {
            [[MCSettings defaultSetting] setErrorColorCode:colorCode];
        }
    }
}
- (IBAction)resetToDefault:(id)sender {
    [[MCSettings defaultSetting] resetDefaults];
    [self setupUI];
}

# pragma mark - NSTextFieldDelegate methods
- (void)controlTextDidChange:(NSNotification *)notification{
    if ([[notification object] isKindOfClass:[NSTextField class]]) {
        [self prefixChanged:[notification object]];
    }
}

@end

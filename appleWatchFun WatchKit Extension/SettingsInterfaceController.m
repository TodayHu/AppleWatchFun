//
//  SettingsInterfaceController.m
//  appleWatchFun
//
//  Created by Jorge Valbuena on 2015-04-07.
//  Copyright (c) 2015 Jorge Valbuena. All rights reserved.
//

#import "SettingsInterfaceController.h"
#import "SettingsTableController.h"

#define SETTINGS_TABLE_ROW 4

@interface SettingsInterfaceController ()

@property (weak, nonatomic) IBOutlet WKInterfaceTable *settingsTable;

@property (strong, nonatomic) SettingsTableController *settingRows;

@end

@implementation SettingsInterfaceController

- (void)awakeWithContext:(id)context
{
    [super awakeWithContext:context];
    
//    NSArray *labels = @[@"Settings", @"Push", @"Pop", @"help"];
//
//    [self.settingsTable setNumberOfRows:SETTINGS_TABLE_ROW withRowType:@"SettingsTableController"];
//    
//    for(int x = 0; x < SETTINGS_TABLE_ROW; x++)
//    {
//        self.settingRows = [self.settingsTable rowControllerAtIndex:x];
//        [self.settingRows.settingLabel setText:labels[x]];
//    }
}

- (void)willActivate
{
    [super willActivate];
}

- (void)didDeactivate
{
    [super didDeactivate];
}

- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex
{
    
}
@end

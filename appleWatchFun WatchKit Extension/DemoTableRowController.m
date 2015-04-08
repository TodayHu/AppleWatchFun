//
//  DemoTableRowController.m
//  appleWatchFun
//
//  Created by Jorge Valbuena on 2015-04-07.
//  Copyright (c) 2015 Jorge Valbuena. All rights reserved.
//

#import "DemoTableRowController.h"

@interface DemoTableRowController()


@end

@implementation DemoTableRowController

#pragma mark - custom getters & setters

- (void)setTableRowImage:(WKInterfaceImage *)tableRowImage
{
    _tableRowImage = tableRowImage;
}

- (void)setTableRowLabel:(WKInterfaceLabel *)tableRowLabel
{
    _tableRowLabel = tableRowLabel;
}

@end
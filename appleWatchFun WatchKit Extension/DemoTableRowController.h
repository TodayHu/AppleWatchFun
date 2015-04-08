//
//  DemoTableRowController.h
//  appleWatchFun
//
//  Created by Jorge Valbuena on 2015-04-07.
//  Copyright (c) 2015 Jorge Valbuena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>

@interface DemoTableRowController : NSObject

@property (weak, nonatomic) IBOutlet WKInterfaceImage *tableRowImage;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *tableRowLabel;

@end
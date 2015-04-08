//
//  InterfaceController.m
//  appleWatchFun WatchKit Extension
//
//  Created by Jorge Valbuena on 2015-03-09.
//  Copyright (c) 2015 Jorge Valbuena. All rights reserved.
//

#import "InterfaceController.h"
#import "DemoTableRowController.h"

#define TABLE_ROWS 4

@interface InterfaceController()

@property (weak, nonatomic) IBOutlet WKInterfaceButton *addBtn;
@property (weak, nonatomic) IBOutlet WKInterfaceButton *deleteBtn;
@property (weak, nonatomic) IBOutlet WKInterfaceTable *demoTable;

@property (nonatomic) NSInteger counter;
@property (nonatomic, strong) DemoTableRowController *row;
@property (nonatomic, strong) NSArray *tableImages;
@property (nonatomic, strong) NSArray *tableLabels;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context
{
    [super awakeWithContext:context];
 
//    NSArray *colors = @[[self colorWithHexString:@"1AD6FD"],
//                        [self colorWithHexString:@"1D62F0"]];
    
//    UIImage *bgGradientImage = [self tintedWithLinearGradientColors:colors];
    
//    [self.group setBackgroundImage:bgGradientImage];

    CGSize imageSize = CGSizeMake(20, 20);
    
    UIImage *aboutImage = [self changeImageColor:[self imageWithImage:[UIImage imageNamed:@"about"] scaledToSize:imageSize] withColor:[UIColor whiteColor]];
    UIImage *settingsImage = [self changeImageColor:[self imageWithImage:[UIImage imageNamed:@"settings"] scaledToSize:imageSize] withColor:[UIColor whiteColor]];
    UIImage *helpImage = [self changeImageColor:[self imageWithImage:[UIImage imageNamed:@"help"] scaledToSize:imageSize] withColor:[UIColor whiteColor]];
    UIImage *contactImage = [self changeImageColor:[self imageWithImage:[UIImage imageNamed:@"business"] scaledToSize:imageSize] withColor:[UIColor whiteColor]];
    
    self.tableImages = [NSArray arrayWithObjects:aboutImage,
                                                 settingsImage,
                                                 helpImage,
                                                 contactImage,
                                                 nil];
    
    self.tableLabels = [NSArray arrayWithObjects:@"About us",
                                                 @"Settings",
                                                 @"Help?",
                                                 @"Contact us",
                                                 nil];
 
    [self loadTable];
    
}

- (void)willActivate
{
    [super willActivate];
}

- (void)didDeactivate
{
    [super didDeactivate];
}

#pragma mark - Table setup

- (void)loadTable
{
    [self.demoTable setNumberOfRows:1 withRowType:@"DemoTableRowController"];

    self.row = [self.demoTable rowControllerAtIndex:0];
    [self.row.tableRowImage setImage:self.tableImages[0]];
    [self.row.tableRowLabel setText:self.tableLabels[0]];
    
    self.counter = 1;
}

#pragma mark - Table delegate

- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex
{
    if(rowIndex == 0)
    {
        [self pushControllerWithName:@"AboutUsScreen" context:nil];
    }
    else if (rowIndex == 1)
    {
        [self pushControllerWithName:@"SettingsScreen" context:nil];
    }
    else if (rowIndex == 2)
    {
        [self pushControllerWithName:@"HelpScreen" context:nil];
    }
    else if (rowIndex == 3)
    {
        [self pushControllerWithName:@"ContactUsScreen" context:nil];
    }
    
    NSLog(@"row selected %ld", rowIndex);
}

#pragma mark - Add & Delete rows function

- (IBAction)addRow
{
    if(self.counter < TABLE_ROWS)
    {
        self.counter++;

        NSIndexSet *indextSet = [NSIndexSet indexSetWithIndex:self.counter-1];
        [self.demoTable insertRowsAtIndexes:indextSet withRowType:@"DemoTableRowController"];
        
        for (int x = 0; x < self.counter; x++)
        {
            self.row = [self.demoTable rowControllerAtIndex:x];
            [self.row.tableRowImage setImage:self.tableImages[x]];
            [self.row.tableRowLabel setText:self.tableLabels[x]];
        }
    }
}

- (IBAction)deleteRow
{
    if(self.counter > 1)
    {
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:self.counter-1];
        [self.demoTable removeRowsAtIndexes:indexSet];
        self.counter--;
    }
}

#pragma mark - Table Row helper functions

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize
{
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage *)changeImageColor:(UIImage *)img withColor:(UIColor *)color
{
    if (color)
    {
        UIGraphicsBeginImageContextWithOptions(img.size, NO, img.scale);
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGContextTranslateCTM(context, 0, img.size.height);
        CGContextScaleCTM(context, 1.0, -1.0);
        CGContextSetBlendMode(context, kCGBlendModeNormal);
        
        CGRect rect = CGRectMake(0, 0, img.size.width, img.size.height);
        
        CGContextClipToMask(context, rect, img.CGImage);
        
        [color setFill];
        
        CGContextFillRect(context, rect);
        
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return newImage;
    }
    
    return img;
}

- (UIColor *)colorWithHexString:(NSString *)stringToConvert
{
    //converts the hex value into a colour
    NSScanner *scanner = [NSScanner scannerWithString:stringToConvert];
    unsigned hexNum;
    if (![scanner scanHexInt:&hexNum]) return nil;
    return [self colorWithRGBHex:hexNum];
}

- (UIColor *)colorWithRGBHex:(UInt32)hex
{
    //converts a hex number into a colour
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:1.0f];
}

- (UIImage *)tintedWithLinearGradientColors:(NSArray *)colorsArr
{
    UIImage *image;
    
    CGFloat scale = 1.0;
    UIGraphicsBeginImageContext(CGSizeMake(self.contentFrame.size.width * scale, self.contentFrame.size.height * scale));
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.contentFrame.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, self.contentFrame.size.width * scale, self.contentFrame.size.height * scale);
    CGContextDrawImage(context, rect, image.CGImage);
    
    // Create gradient
    UIColor *colorOne = [colorsArr objectAtIndex:1]; // top color
    UIColor *colorTwo = [colorsArr objectAtIndex:0]; // bottom color
    
    NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, (id)colorTwo.CGColor, nil];
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColors(space, (__bridge CFArrayRef)colors, NULL);
    
    // Apply gradient
    CGContextClipToMask(context, rect, image.CGImage);
    CGContextDrawLinearGradient(context, gradient, CGPointMake(0,0), CGPointMake(0,self.contentFrame.size.height * scale), 0);
    UIImage *gradientImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return gradientImage;
}

@end




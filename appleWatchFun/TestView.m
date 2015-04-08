//
//  TestView.m
//  appleWatchFun
//
//  Created by Jorge Valbuena on 2015-03-13.
//  Copyright (c) 2015 Jorge Valbuena. All rights reserved.
//

#import "TestView.h"

@implementation TestView

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.4];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
    }
    return self;
}


@end

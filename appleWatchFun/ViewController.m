//
//  ViewController.m
//  appleWatchFun
//
//  Created by Jorge Valbuena on 2015-03-09.
//  Copyright (c) 2015 Jorge Valbuena. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"

@interface ViewController ()

@property (nonatomic, strong) TestView *myView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.myView = [[TestView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

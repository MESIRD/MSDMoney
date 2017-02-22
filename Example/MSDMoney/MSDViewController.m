//
//  MSDViewController.m
//  MSDMoney
//
//  Created by btmesird on 02/22/2017.
//  Copyright (c) 2017 btmesird. All rights reserved.
//

#import "MSDViewController.h"

#import <MSDMoney/MSDMoney.h>


@interface MSDViewController ()

@end

@implementation MSDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    MSDMoney *money = [[MSDMoney alloc] initWithString:@"2.32"];
    NSLog(@"%@", money.stringValue);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

@end

//
//  ViewController.m
//  MSDMoney
//
//  Created by mesird on 14/08/2016.
//  Copyright © 2016 mesird. All rights reserved.
//

#import "ViewController.h"

#import "MSDMoney.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *reg = @"^[0-9]+([.]{0}|[.]{1}[0-9]+)$";
    NSString *object = @"012";
    if ([object rangeOfString:reg options:NSRegularExpressionSearch].location != NSNotFound) {
        NSLog(@"YES");
    } else {
        NSLog(@"NO");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

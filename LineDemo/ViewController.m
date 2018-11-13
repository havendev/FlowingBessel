//
//  ViewController.m
//  LineDemo
//
//  Created by Haven on 2018/11/13.
//  Copyright © 2018 Haven. All rights reserved.
//

#import "ViewController.h"
#import "InsideLineView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height + 20

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    InsideLineView *lineView = [[InsideLineView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:lineView];
}

@end

//
//  ViewController.m
//  RNPatchDemo
//
//  Created by c0ming on 2016/9/29.
//  Copyright © 2016年 c0ming. All rights reserved.
//

#import "ViewController.h"

@import RNPatchSDK;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [RNPatch applyPatch:@"" fromOldFile:@"" toNewFile:@""];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end

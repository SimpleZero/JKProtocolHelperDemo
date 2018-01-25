//
//  TViewController.m
//  JKProtocolHelper
//
//  Created by 01 on 2018/1/24.
//  Copyright © 2018年 01. All rights reserved.
//

#import "TViewController.h"
#import "ViewController.h"

@interface TViewController ()

@end

@implementation TViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    ViewController *vc = [[ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end

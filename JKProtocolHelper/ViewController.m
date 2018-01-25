//
//  ViewController.m
//  JKProtocolHelper
//
//  Created by 01 on 2018/1/23.
//  Copyright © 2018年 01. All rights reserved.
//

#import "ViewController.h"
#import "JKProtocolHelper.h"

@interface Test: NSObject<UIScrollViewDelegate>
@end

@implementation Test
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"Test");
}
@end


@interface ViewController ()<UITableViewDelegate>
@property (nonatomic, strong) Test *test;
@property (nonatomic, strong) id helper;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    CGFloat width = self.view.frame.size.width;
//    CGFloat height = self.view.frame.size.height;
    
//    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:scrollView];
//    scrollView.contentSize = CGSizeMake(width, height*5);
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    
    _test = [Test new];
    _helper = [JKProtocolHelper helperWithProtocol:@protocol(UIScrollViewDelegate) executors:@[self, _test]];
//    scrollView.delegate = _helper;
    tableView.delegate = _helper;
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"view controller");
}


@end

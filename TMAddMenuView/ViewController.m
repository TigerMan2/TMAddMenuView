//
//  ViewController.m
//  TMAddMenuView
//
//  Created by Apple on 2017/8/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "TMAddMenuView.h"

@interface ViewController ()<TMAddMenuViewDelegate>

@property (nonatomic , strong) TMAddMenuView *addMenuView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightItemTap:)];
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}
#pragma mark - Event Response
- (void)rightItemTap:(UIBarButtonItem *)sender
{
    if (self.addMenuView.isShow) {
        [self.addMenuView dismiss];
    }
    else {
        [self.addMenuView showInView:self.navigationController.view];
    }
}
- (TMAddMenuView *)addMenuView{
    if (_addMenuView == nil) {
        _addMenuView = [[TMAddMenuView alloc] init];
        [_addMenuView setDelegate:self];
    }
    return _addMenuView;
}
- (void)addMenuView:(TMAddMenuView *)addMenuView didSelectedItem:(TMAddMenuItem *)item
{
    if (item.className.length > 0) {
        id vc = [[NSClassFromString(item.className) alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else NSLog(@"Operation is not open!");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

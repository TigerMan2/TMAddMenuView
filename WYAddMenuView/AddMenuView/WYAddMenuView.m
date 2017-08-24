//
//  WYAddMenuView.m
//  WYAddMenuView
//
//  Created by Apple on 2017/8/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "WYAddMenuView.h"
#import "WYAddMenuHelper.h"
#import "WYAddMenuCell.h"


#define     WIDTH_TABLEVIEW             140.0f
#define     HEIGHT_TABLEVIEW_CELL       45.0f
#define     HEIGHT_NAVBAR               44.0f
#define     HEIGHT_STATUSBAR            20.0f

@interface WYAddMenuView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , strong) WYAddMenuHelper *helper;

@property (nonatomic , strong) UITableView *tableView;

@property (nonatomic , strong) NSMutableArray *dataSources;

@end

@implementation WYAddMenuView

- (instancetype) init
{
    self = [super init];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        [self addSubview:self.tableView];
        
        self.dataSources = self.helper.menuData;
        
        UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        [self addGestureRecognizer:panGR];
        
    }
    return self;
}

- (void) showInView:(UIView *)view
{
    [view addSubview:self];
    [self setNeedsDisplay];
    [self setFrame:view.bounds];
    CGRect rect = CGRectMake(view.frame.size.width - WIDTH_TABLEVIEW - 5, HEIGHT_NAVBAR + HEIGHT_STATUSBAR + 10, WIDTH_TABLEVIEW, self.dataSources.count * HEIGHT_TABLEVIEW_CELL);
    [self.tableView setFrame:rect];
}

- (BOOL)isShow
{
    return self.superview != nil;
}

- (void) dismiss
{
    [UIView animateWithDuration:0.2 animations:^{
        [self setAlpha:0.0f];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        [self setAlpha:1.0f];
    }];
}
- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismiss];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSources.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WYAddMenuItem *item = self.dataSources[indexPath.row];
    WYAddMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WYAddMenuCell"];
    [cell setMenuItem:item];
    return cell;
}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WYAddMenuItem *item = self.dataSources[indexPath.row];
    if (_delegate && [_delegate respondsToSelector:@selector(addMenuView:didSelectedItem:)]) {
        [_delegate addMenuView:self didSelectedItem:item];
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    [self dismiss];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return HEIGHT_TABLEVIEW_CELL;
}

#pragma mark - tableView
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView setScrollEnabled:NO];
        [_tableView registerClass:[WYAddMenuCell class] forCellReuseIdentifier:@"WYAddMenuCell"];
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [_tableView setBackgroundColor:WYAddMenuTableBackColor];
        [_tableView.layer setCornerRadius:3.0f];
        [_tableView.layer setMasksToBounds:YES];
    }
    return _tableView;
}
#pragma mark - Helper
- (WYAddMenuHelper *)helper
{
    if (_helper == nil) {
        _helper = [[WYAddMenuHelper alloc] init];
    }
    return _helper;
}
#pragma mark - 实现箭头
- (void)drawRect:(CGRect)rect
{
    CGFloat startX = self.frame.size.width - 27;
    CGFloat startY = HEIGHT_STATUSBAR + HEIGHT_NAVBAR + 3;
    CGFloat endY = HEIGHT_NAVBAR + HEIGHT_STATUSBAR + 10;
    CGFloat width = 6;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, startX, startY);
    CGContextAddLineToPoint(context, startX + width, endY);
    CGContextAddLineToPoint(context, startX - width, endY);
    CGContextClosePath(context);
    //设置填充色
    [WYAddMenuTableBackColor setFill];
    //设置边框色
    [WYAddMenuTableBackColor setStroke];
    CGContextDrawPath(context, kCGPathFillStroke);
    
}
@end

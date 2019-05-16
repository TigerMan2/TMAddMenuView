//
//  LTAddMenuCell.m
//  LTAddMenuView
//
//  Created by Apple on 2017/8/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "LTAddMenuCell.h"
#import "Masonry.h"

@interface LTAddMenuCell ()

@property (nonatomic , strong) UILabel *titleLabel;

@property (nonatomic , strong) UIImageView *iconImage;

@end

@implementation LTAddMenuCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setBackgroundColor:LTAddMenuTableBackColor];
        
        UIView *selectView = [[UIView alloc] init];
        [selectView setBackgroundColor:LTAddMenuSelectColor];
        [self setSelectedBackgroundView:selectView];
        
        [self addSubview:self.titleLabel];
        [self addSubview:self.iconImage];
        [self LT_addMasonry];
    }
    return self;
}

- (void)setMenuItem:(LTAddMenuItem *)menuItem
{
    _menuItem = menuItem;
    [self.iconImage setImage:[UIImage imageNamed:menuItem.iconPath]];
    [self.titleLabel setText:menuItem.title];
}

#pragma mark - Masonry
- (void) LT_addMasonry
{
    [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).mas_offset(15.0f);
        make.centerY.mas_equalTo(self);
        make.height.and.with.mas_equalTo(32);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImage.mas_right).mas_equalTo(10.f);
        make.centerY.mas_equalTo(self.iconImage);
    }];
}

#pragma mark - iconImages
- (UIImageView *)iconImage
{
    if (_iconImage == nil) {
        _iconImage = [[UIImageView alloc] init];
    }
    return _iconImage;
}
#pragma mark - titleLabel
- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setTextColor:[UIColor whiteColor]];
        [_titleLabel setFont:[UIFont systemFontOfSize:16.0f]];
    }
    return _titleLabel;
}
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0*2);
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithWhite:0.5 alpha:1.0f].CGColor);
    CGContextBeginPath(context);
    CGFloat startX =  15.0f;
    CGFloat endX = self.frame.size.width - 16.0f;
    CGFloat y = self.frame.size.height;
    CGContextMoveToPoint(context, startX, y);
    CGContextAddLineToPoint(context, endX, y);
    CGContextStrokePath(context);
}
@end

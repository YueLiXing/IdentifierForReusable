//
//  RedTableViewCell.m
//  Example
//
//  Created by yuelixing on 2016/11/29.
//  Copyright © 2016年 YueLiXing. All rights reserved.
//

#import "RedTableViewCell.h"

@interface RedTableViewCell ()

@property (nonatomic, retain) UILabel * titleLabel;

@property (nonatomic, retain) UIView * redView;

@end

@implementation RedTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
     
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.redView];
    }
    return self;
}

- (void)setString:(NSString *)string {
    _string = string;
    self.titleLabel.text = string;
    CGSize size = [self.titleLabel sizeThatFits:CGSizeMake(AppWidth-20-20, 70)];
    self.titleLabel.frame = CGRectMake(50, 0, size.width, size.height);
    self.titleLabel.center = CGPointMake(self.titleLabel.center.x, self.redView.center.y);
}

// MARK: - get

- (UIView *)redView {
    if (!_redView) {
        _redView = [[UIView alloc] init];
        _redView.backgroundColor = [UIColor redColor];
        _redView.frame = CGRectMake(0, 0, 40, 40);
    }
    return _redView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.numberOfLines = 0;
        _titleLabel.font = [UIFont systemFontOfSize:18];
    }
    return _titleLabel;
}

@end

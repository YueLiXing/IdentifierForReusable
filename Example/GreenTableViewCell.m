//
//  GreenTableViewCell.m
//  Example
//
//  Created by yuelixing on 2016/11/29.
//  Copyright © 2016年 YueLiXing. All rights reserved.
//

#import "GreenTableViewCell.h"

@interface GreenTableViewCell ()

@property (nonatomic, retain) UIView * greenView;

@property (nonatomic, retain) UILabel * titleLabel;

@end

@implementation GreenTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:self.titleLabel];
        
        [self.contentView addSubview:self.greenView];
    }
    return self;
}

- (void)setString:(NSString *)string {
    _string = string;
    self.titleLabel.text = string;
    CGSize size = [self.titleLabel sizeThatFits:CGSizeMake(AppWidth-20-20, 70)];
    self.titleLabel.frame = CGRectMake(10, 0, size.width, size.height);
}

// MARK: - get

- (UIView *)greenView {
    if (!_greenView) {
        _greenView = [[UIView alloc] init];
        _greenView.backgroundColor = [UIColor greenColor];
        _greenView.frame = CGRectMake(AppWidth-20, 0, 20, 70);
    }
    return _greenView;
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

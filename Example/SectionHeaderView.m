//
//  SectionHeaderView.m
//  Example
//
//  Created by yuelixing on 2016/11/29.
//  Copyright © 2016年 YueLiXing. All rights reserved.
//

#import "SectionHeaderView.h"

@interface SectionHeaderView ()

@property (nonatomic, retain) UILabel * titleLabel;

@end

@implementation SectionHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor yellowColor];
        
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    self.titleLabel.text = title;
    [self.titleLabel sizeToFit];
    self.titleLabel.center = CGPointMake(AppWidth/2.0, [[self class] height]/2.0);
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:20];
//        _titleLabel.textColor = [UIColor whiteColor];
    }
    return _titleLabel;
}

+ (CGFloat)height {
    return 40;
}

@end

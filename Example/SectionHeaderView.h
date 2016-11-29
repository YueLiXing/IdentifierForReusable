//
//  SectionHeaderView.h
//  Example
//
//  Created by yuelixing on 2016/11/29.
//  Copyright © 2016年 YueLiXing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionHeaderView : UITableViewHeaderFooterView

@property (nonatomic, copy) NSString * title;

+ (CGFloat)height;

@end

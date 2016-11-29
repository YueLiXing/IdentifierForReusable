//
//  UITableViewCell+Identifier.h
//  Test
//
//  Created by yuelixing on 2016/11/29.
//  Copyright © 2016年 YueLiXing. All rights reserved.
//

#import <UIKit/UIKit.h>

#define IdentifierForReusableHeaderCode + (NSString *)identifierForReusable;\
- (NSString *)identifierForReusable;

@interface UITableViewCell (identifierForReusable)

IdentifierForReusableHeaderCode

@end

@interface UICollectionReusableView (identifierForReusable)

IdentifierForReusableHeaderCode

@end

@interface UITableViewHeaderFooterView (identifierForReusable)

IdentifierForReusableHeaderCode

@end

//
//  UITableViewCell+Identifier.m
//  Test
//
//  Created by yuelixing on 2016/11/29.
//  Copyright © 2016年 YueLiXing. All rights reserved.
//

#import "IdentifierForReusable.h"

#define IdentifierForReusableCode + (NSString *)identifierForReusable {\
return NSStringFromClass(self);\
}\
- (NSString *)identifierForReusable {\
    return [[self class] identifierForReusable];\
}


@implementation UITableViewCell (identifierForReusable)

IdentifierForReusableCode

@end

@implementation UICollectionReusableView (identifierForReusable)

IdentifierForReusableCode

@end

@implementation UITableViewHeaderFooterView (identifierForReusable)

IdentifierForReusableCode

@end


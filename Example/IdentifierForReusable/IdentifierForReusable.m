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


@implementation UITableViewCell (IdentifierForReusable)

IdentifierForReusableCode

@end

@implementation UICollectionReusableView (IdentifierForReusable)

IdentifierForReusableCode

@end

@implementation UITableViewHeaderFooterView (IdentifierForReusable)

IdentifierForReusableCode

@end

@implementation UITableView (IdentifierForReusable)

- (void)registerCellClass:(Class)cellClass {
    NSAssert(cellClass, @"cellClass 不可为空");
    NSAssert([cellClass isSubclassOfClass:[UITableViewCell class]], @"cellClass 必须是 UITableViewCell的子类");
    NSAssert([cellClass instancesRespondToSelector:@selector(identifierForReusable)], @"cellClass 必须实现identifierForReusable");
    [self registerClass:cellClass forCellReuseIdentifier:[cellClass identifierForReusable]];
}
- (void)registerHeaderFooterClass:(Class)aClass {
    NSAssert(aClass, @"aClass 不可为空");
    NSAssert([aClass isSubclassOfClass:[UITableViewHeaderFooterView class]], @"class 必须是 UITableViewHeaderFooterView的子类");
    NSAssert([aClass instancesRespondToSelector:@selector(identifierForReusable)], @"cellClass 必须实现identifierForReusable");
    [self registerClass:aClass forHeaderFooterViewReuseIdentifier:[aClass identifierForReusable]];
}

@end


@implementation UICollectionView (IdentifierForReusable)

- (void)registerClass:(Class)cellClass {
    NSAssert(cellClass, @"cellClass 不可为空");
    NSAssert([cellClass isSubclassOfClass:[UICollectionViewCell class]], @"cellClass 必须是 UICollectionViewCell的子类");
    NSAssert([cellClass instancesRespondToSelector:@selector(identifierForReusable)], @"cellClass 必须实现identifierForReusable");
    [self registerClass:cellClass forCellWithReuseIdentifier:[cellClass identifierForReusable]];
}

- (void)registerClass:(Class)aClass forSupplementaryViewOfKind:(NSString *)kind {
    NSAssert(aClass, @"aClass 不可为空");
    NSAssert(kind, @"kind 不可为空");
    NSAssert([aClass isSubclassOfClass:[UICollectionReusableView class]], @"cellClass 必须是 UICollectionReusableView的子类");
    NSAssert([aClass instancesRespondToSelector:@selector(identifierForReusable)], @"cellClass 必须实现identifierForReusable");
    [self registerClass:aClass forSupplementaryViewOfKind:kind withReuseIdentifier:[aClass identifierForReusable]];
}



@end

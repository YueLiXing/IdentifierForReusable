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

@interface UITableViewCell (IdentifierForReusable)

IdentifierForReusableHeaderCode

@end

@interface UICollectionReusableView (IdentifierForReusable)

IdentifierForReusableHeaderCode

@end

@interface UITableViewHeaderFooterView (IdentifierForReusable)

IdentifierForReusableHeaderCode

@end


// Helpful

@interface UITableView (IdentifierForReusable)

/**
 使用类名注册 Cell
 */
- (void)registerCellClass:(Class)cellClass;
/**
 使用类名注册 Header Footer
 */
- (void)registerHeaderFooterClass:(Class)aClass;

@end


@interface UICollectionView (IdentifierForReusable)
/**
 使用类名注册 Cell
 */
- (void)registerClass:(Class)cellClass;
/**
 使用类名注册 Header Footer
 */
- (void)registerClass:(Class)aClass forSupplementaryViewOfKind:(NSString *)kind;

@end

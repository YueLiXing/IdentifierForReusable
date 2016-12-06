# IdentifierForReusable

### 最初版(见名知意)
``` objective-c
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
```
可以直接通过 Cell 的实例或者类名来直接访问一个固定的 identifier ,省去了 宏定义 cell 的 identifier 过程

### 随后
我想，既然省掉了声明或者宏定义 identifier 的过程，不如顺便把注册和获取的过程也简化下，于是便有了下面的东西

``` objective-c
@interface UITableView (IdentifierForReusable)

/**
 使用类名注册 Cell
 */
- (void)registerCellClass:(Class)cellClass;
/**
 使用类名注册 Header Footer
 */
- (void)registerHeaderFooterClass:(Class)aClass;

- (__kindof UITableViewCell *)dequeueReusableCellWithClass:(Class)cellClass;

- (__kindof UITableViewCell *)dequeueReusableCellWithClass:(Class)cellClass forIndexPath:(NSIndexPath *)indexPath;

- (__kindof UITableViewHeaderFooterView *)dequeueReusableHeaderFooterViewWithClass:(Class)aClass;

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

/**
 获取 cell

 @param cellClass cell 的 class
 */
- (__kindof UICollectionViewCell *)dequeueReusableCellWithReuseClass:(Class)cellClass forIndexPath:(NSIndexPath *)indexPath;

/**
 获取 UICollectionReusableView
 */
- (__kindof UICollectionReusableView *)dequeueReusableSupplementaryViewOfKind:(NSString *)elementKind withReuseClass:(Class)aClass forIndexPath:(NSIndexPath *)indexPath;

@end

```

### 举个栗子

1. cell 和 headerfooter view 的注册
``` objective-c 
[_tableView registerCellClass:[RedTableViewCell class]];
[_tableView registerCellClass:[GreenTableViewCell class]];
[_tableView registerHeaderFooterClass:[SectionHeaderView class]];
[_tableView registerHeaderFooterClass:[SectionFooterView class]];
```
2. cell 的获取
``` objective-c
// 支持原生方法 
RedTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:[RedTableViewCell identifierForReusable] forIndexPath:indexPath];
// 简单方法 1
RedTableViewCell * cell = [tableView dequeueReusableCellWithClass:[RedTableViewCell class]];
// 简单方法 2
RedTableViewCell * cell = [tableView dequeueReusableCellWithClass:[RedTableViewCell class] forIndexPath:indexPath];
```

3.headerfooter view
``` objective-c
// 支持原生方法 
//    SectionHeaderView * headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:[SectionHeaderView identifierForReusable]];
// 简单方法
SectionHeaderView * headerView = [tableView dequeueReusableHeaderFooterViewWithClass:[SectionHeaderView class]];
```
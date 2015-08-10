//
//  SSSimpleDropdown.h
//  SimpleDropdownListView
//
//  Created by serhatsezer on 10/08/15.
//  Copyright (c) 2015 serhat sezer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SSSimpleDropdown;
@protocol SSSimpleDropdownDelegate <NSObject>

- (void)didTapListItemWithIndexPath:(NSIndexPath *)indexPath title:(NSString *)title listView:(UITableView *)listView;

@end

@interface SSSimpleDropdown : UIView <UITableViewDataSource, UITableViewDelegate>

// Delegation
@property (nonatomic, weak) id<SSSimpleDropdownDelegate>listDelegate;

// Assignable dropdown height
@property (nonatomic, assign) CGFloat dropdownHeight;

// Initialization method
- (id)initListViewWithData:(NSArray *)items parentView:(UIView *)parentView locationView:(UIView *)locationView;

- (void)toggleDropDownWithAnimate:(BOOL)animated;

@end

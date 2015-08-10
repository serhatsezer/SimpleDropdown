//
//  SSSimpleDropdown.m
//  SimpleDropdownListView
//
//  Created by serhatsezer on 10/08/15.
//  Copyright (c) 2015 serhat sezer. All rights reserved.
//

#import "SSSimpleDropdown.h"
#define kDropdownInitialHeight 0.0f
#define kDropdownExpendedHeight 200.0f
#define kCellIdentifier @"DropdownListCell"
#define kCellHeight 40.0f

@interface SSSimpleDropdown ()

@property (nonatomic, strong) UITableView *listView;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) UIView *locationView;
@property (nonatomic, strong) UIView *parentView;

@property (nonatomic, assign) CGFloat locationViewX;
@property (nonatomic, assign) CGFloat locationViewY;
@property (nonatomic, assign) CGFloat locationViewWidth;
@property (nonatomic, assign) CGFloat locationViewHeight;
@property (nonatomic, assign, getter=isOpened) BOOL opened;

@end

@implementation SSSimpleDropdown


- (id)initListViewWithData:(NSArray *)items parentView:(UIView *)parentView locationView:(UIView *)locationView {
    
    self = [super init];
    
    if(self) {
        
        self.locationView = locationView;
        self.items = items;
        
        _locationViewX     = CGRectGetMinX(locationView.bounds);
        _locationViewY     = CGRectGetMaxY(locationView.bounds);
        _locationViewWidth = CGRectGetWidth(locationView.bounds);
        
        // Create tableview according to location view coordinate
        _listView = [[UITableView alloc] initWithFrame:CGRectMake(_locationViewX,
                                                                  _locationViewY,
                                                                  _locationViewWidth,
                                                                  kDropdownInitialHeight)
                                                 style:UITableViewStylePlain];
        _listView.tableFooterView = [UIView new];
        _listView.dataSource = self;
        _listView.delegate = self;
        _listView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _listView.separatorColor = [UIColor grayColor];
        [self addSubview:_listView];
        [locationView addSubview:self];
        
        [self.listView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
        
        _opened = NO;
    }
    
    return self;
}

- (void)toggleDropDownWithAnimate:(BOOL)animated {
    
    if(animated) {
        
        if(!self.isOpened) {
            [UIView animateWithDuration:0.5 animations:^{
                _listView.frame = CGRectMake(_locationViewX,
                                             _locationViewY,
                                             _locationViewWidth,
                                             [self listViewHeight]);
            }];
            _opened = YES;
            
        } else {
            [UIView animateWithDuration:0.6 animations:^{
                _listView.frame = CGRectMake(_locationViewX,
                                             _locationViewY,
                                             _locationViewWidth,
                                             kDropdownInitialHeight);
            }];
            _opened = NO;
        }
        
    } else {
        
        if(self.isOpened) {
            _listView.frame = CGRectMake(_locationViewX,
                                         _locationViewY,
                                         _locationViewWidth,
                                         [self listViewHeight]);
            _opened = YES;
        } else {
            _listView.frame = CGRectMake(_locationViewX,
                                         _locationViewY,
                                         _locationViewWidth,
                                         kDropdownInitialHeight);
            _opened = NO;
        }
        
    }
    
}

#pragma mark Helper method

- (CGFloat)listViewHeight {
    return (self.dropdownHeight > 10.0) ? self.dropdownHeight : kCellHeight * self.items.count;
}

#pragma mark TableView Delegate & Data Source methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:1.000 green:0.286 blue:0.314 alpha:1.000];
    cell.textLabel.text = _items[indexPath.row];
    [cell.textLabel setTextAlignment:NSTextAlignmentCenter];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"User did tap.");
    [self didTapCellWithIndexPath:indexPath title:_items[indexPath.row]];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kCellHeight;
}

- (void)didTapCellWithIndexPath:(NSIndexPath *)indexPath title:(NSString *)title {
    if([self.listDelegate respondsToSelector:@selector(didTapListItemWithIndexPath:title:listView:)]) {
        [self.listDelegate didTapListItemWithIndexPath:indexPath title:title listView:_listView];
    }
    
    // toggle animation
    [self toggleDropDownWithAnimate:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSAssert(_items.count, @"You have to set items.");
    return _items.count;
}


@end

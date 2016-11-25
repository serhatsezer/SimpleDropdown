//
//  ViewController.m
//  SimpleDropdownListView
//
//  Created by serhatsezer on 10/08/15.
//  Copyright (c) 2015 serhat sezer. All rights reserved.
//

#import "ViewController.h"
#import "SSSimpleDropdown.h"

@interface ViewController ()<SSSimpleDropdownDelegate>
@property(nonatomic,strong) SSSimpleDropdown *simpleDropDownExample;
@property (weak, nonatomic) IBOutlet UIButton *mybutton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *titles = @[@"Title 1", @"Title 2", @"Title 3", @"Title 4"];
    
    // Also you can use with custom UIView.
    UIView *customView = [self.view viewWithTag:2];
    [customView addGestureRecognizer:[[UITapGestureRecognizer alloc]
                                      initWithTarget:self
                                      action:@selector(buttonTapped:)]];
    
    _simpleDropDownExample = [[SSSimpleDropdown alloc] initListViewWithData:titles
                                                                parentView:self.view
                                                              locationView:customView];
    _simpleDropDownExample.listDelegate = self;
    [self.view addSubview:_simpleDropDownExample];
}

- (IBAction)buttonTapped:(id)sender {
    [_simpleDropDownExample toggleDropDownWithAnimate:YES];
}


// Use delegate method to determine user tapped cell or not
- (void)didTapListItemWithIndexPath:(NSIndexPath *)indexPath title:(NSString *)title listView:(UITableView *)listView {
    NSLog(@"Item index path %zd and title %@ " , indexPath.row, title);
}

@end

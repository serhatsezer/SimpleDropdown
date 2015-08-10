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
    
    _simpleDropDownExample = [[SSSimpleDropdown alloc] initListViewWithData:titles
                                                                parentView:self.view
                                                              locationView:self.mybutton];
    _simpleDropDownExample.listDelegate = self;
}

- (IBAction)buttonTapped:(id)sender {
    [_simpleDropDownExample toggleDropDownWithAnimate:YES];
}


// Use delegate method to determine user tapped cell or not
- (void)didTapListItemWithIndexPath:(NSIndexPath *)indexPath title:(NSString *)title listView:(UITableView *)listView {
    NSLog(@"Item index path %@ and title %@ " ,indexPath, title);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

# SimpleDropdown
It's a simple and lightweigh drop-down list view. It uses UITableView under the hood. But later it will going to be support many other view types like UICollectionView and plain views. If you have any idea please send a pull request.

### Usage

```
NSArray *titles = @[@"Title 1", @"Title 2", @"Title 3", @"Title 4"];
    
SSSimpleDropdown *simpleDropDownExample = [[SSSimpleDropdown alloc] initListViewWithData:titles
                                                                parentView:self.view
                                                              locationView:self.mybutton];
simpleDropDownExample.listDelegate = self;
```

> You can trigger drop-down toggle function with sender or any other gesture types.

```
- (IBAction)buttonTapped:(id)sender {
    [_simpleDropDownExample toggleDropDownWithAnimate:YES];
}
```

> When if any drop-down item was tapped it will throw a delegate method. You can catch that cell information and title value.

```
- (void)didTapListItemWithIndexPath:(NSIndexPath *)indexPath title:(NSString *)title listView:(UITableView *)listView {
    NSLog(@"Item index path %@ and title %@ " ,indexPath, title);
}
```

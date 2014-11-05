//
//  ViewController.m
//  indexedTableView
//
//  Created by Chauyan Wang on 11/5/14.
//  Copyright (c) 2014 WCY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate> {
    NSArray* titles;
    NSDictionary* data;
}

@property (nonatomic, strong) IBOutlet UITableView* tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    titles = [[NSArray alloc] initWithObjects:@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j", @"k", @"l", nil];
    data = [[NSDictionary alloc] initWithObjectsAndKeys:
            @[@"aaaa", @"aaaaaaaa"], @"a",
            @[@"bbbbb", @"bbbbbbbb"], @"b",
            @[@"ccccc", @"ccccccccc"], @"c",
            @[@"ddddd", @"ddddddddd"], @"d",
            @[@"eeeee", @"eeeeeeeee"], @"e",
            @[@"fffff", @"ffffffffff"], @"f",
            @[@"ggggg", @"ggggggggg"], @"g",
            @[@"hhhhhh", @"hhhhhhhhh"], @"h",
            @[@"iiiii", @"iiiiiiiii"], @"i",
            @[@"jjjjj", @"jjjjjjjj"], @"j",
            @[@"kkkkk", @"kkkkkkkkk"], @"k",
            @[@"lllll", @"llllllll"], @"l",  nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark tableview delegate
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[data objectForKey:[titles objectAtIndex:section]] count];
}

- (NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [titles objectAtIndex:section];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return [titles count];
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    UITableViewCell* tableViewCell;
    
    tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"tableViewCell"];
    if(tableViewCell == nil) {
        tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableViewCell"];
    }
    
    [tableViewCell.textLabel setText:[[data objectForKey:[titles objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row]];
    
    return tableViewCell;
}

@end

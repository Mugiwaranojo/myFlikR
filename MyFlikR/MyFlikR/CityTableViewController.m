//
//  CityTableViewController.m
//  MyFlikR
//
//  Created by fitec on 10/07/2014.
//  Copyright (c) 2014 Mugiwaranojo. All rights reserved.
//

#import "CityTableViewController.h"
#import "PictureCarrousselViewController.h"
#import "City+DAO.h"

@interface CityTableViewController ()
<UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray * cities;

@end

@implementation CityTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.cities= [[City allCities] mutableCopy];
    
}

- (IBAction)addCity:(id)sender
{
    City * c = [City new];
    [self.cities addObject:c];
    [self.tableView reloadData];
}

#pragma mark -UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cities.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int position = indexPath.row;
    City * c= self.cities[position];
    
    UITableViewCell * cell;
    cell= [tableView dequeueReusableCellWithIdentifier:@"CITY_CELL" forIndexPath: indexPath];
    
    cell.textLabel.text = c.name;
    
    return cell;
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    int position = indexPath.row;
    City * c= self.cities[position];
    
    [City delete:c];
    [self.cities removeObject:c];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
        if([segue.identifier  isEqual: @"CITY_SELECTED"])
        {
            UITableViewCell * cellSelected= (UITableViewCell *) sender;
            NSIndexPath * indexPath= [self.tableView indexPathForCell:cellSelected];
            City * citySelected= self.cities[indexPath.row];
            
            PictureCarrousselViewController * destinationController = segue.destinationViewController;
            destinationController.city= citySelected;
        }
}

@end

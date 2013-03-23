//
//  RootViewController.h
//  FilteredList
//
//  Created by Mark Makdad on 6/10/11.
//  Copyright 2011 Long Weekend LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface RootViewController : UITableViewController

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@property (retain) NSArray *people;

@property (nonatomic,retain) IBOutlet UITableView *tableView;
//! Filtering view from XIB file
@property (nonatomic, retain) IBOutlet UIView *filterSortView;

//! Filter control
@property (nonatomic, retain) IBOutlet UISegmentedControl *filterControl;

//! Sort control
@property (nonatomic, retain) IBOutlet UISegmentedControl *sortControl;

-(void)sortControlValueChanged:(id)sender;

-(void)filterControlValueChanged:(id)sender;

@end

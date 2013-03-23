//
//  RootViewController.m
//  FilteredList
//
//  Created by Mark Makdad on 6/10/11.
//  Copyright 2011 Long Weekend LLC. All rights reserved.
//

#import "RootViewController.h"
#import "Person.h"

@implementation RootViewController

@synthesize people;
@synthesize managedObjectContext=_managedObjectContext;
@synthesize tableView;
// Sorting & filtering UI components
@synthesize filterSortView, filterControl, sortControl;

-(void)sortControlValueChanged:(id)sender
{
    //source: http://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/SortDescriptors/Concepts/Creating.html
    
    NSManagedObjectContext *moc = [self managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:moc];
    NSFetchRequest *request = [[[NSFetchRequest alloc] init] autorelease];
    [request setEntity:entityDescription];
    NSSortDescriptor *lastNameDescriptor = [[NSSortDescriptor alloc] init];
    NSSortDescriptor *firstNameDescriptor = [[NSSortDescriptor alloc] init];
    NSArray *sortDescriptors = [[[NSArray alloc]init]autorelease];
    NSError *error = nil;
    
    switch ([sender selectedSegmentIndex]) 
    {
        case 0:
            lastNameDescriptor = [[NSSortDescriptor alloc]initWithKey:@"lastName" ascending:YES];
            firstNameDescriptor = [[NSSortDescriptor alloc]initWithKey:@"firstName" ascending:YES];

            sortDescriptors = [NSArray arrayWithObjects:lastNameDescriptor,firstNameDescriptor,nil];
            [request setSortDescriptors:sortDescriptors];
         
            self.people = [moc executeFetchRequest:request error:&error];

            if (people == nil)
            {
                NSLog(@"error: %@",error);
            }
        
            [self.tableView reloadData];
        
            break;
        case 1:
            lastNameDescriptor = [[NSSortDescriptor alloc]initWithKey:@"lastName" ascending:NO];
            firstNameDescriptor = [[NSSortDescriptor alloc]initWithKey:@"firstName" ascending:NO];

            sortDescriptors = [NSArray arrayWithObjects:lastNameDescriptor,firstNameDescriptor,nil];
            [request setSortDescriptors:sortDescriptors];
            
            self.people = [moc executeFetchRequest:request error:&error];
            
            if (people == nil)
            {
                NSLog(@"error: %@",error);

            }
            [self.tableView reloadData];

            break;

        default:
            break;
    }
}

-(void)filterControlValueChanged:(id)sender
{
    //source: http://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/CoreData/Articles/cdFetching.html

    NSManagedObjectContext *moc = [self managedObjectContext];
    NSEntityDescription *entityDescription =[NSEntityDescription entityForName:@"Person" inManagedObjectContext:moc];
    NSFetchRequest *request = [[[NSFetchRequest alloc] init] autorelease];
    [request setEntity:entityDescription];
    
    NSPredicate *predicate;
    NSError *error = nil;

    switch ([sender selectedSegmentIndex]) 
    {
        case 0:
            predicate = [NSPredicate predicateWithFormat:@"gender LIKE[c] 'm'"];
            [request setPredicate:predicate];
    
            self.people= [moc executeFetchRequest:request error:&error];
            
            if (people == nil)
            {
                NSLog(@"error: %@",error);
            }
            [self.tableView reloadData];
            
            break;
        case 1:
            predicate = [NSPredicate predicateWithFormat: @"gender LIKE[c] 'f'"];
            [request setPredicate:predicate];
            
            self.people= [moc executeFetchRequest:request error:&error];
            if (people == nil)
            {
                NSLog(@"error: %@",error);
            }
            [self.tableView reloadData];

            break;
        case 2:
            
            predicate = [NSPredicate predicateWithFormat: @"(gender LIKE[c] 'm') OR (gender LIKE[c] 'f')"];
            [request setPredicate:predicate];
            
            self.people= [moc executeFetchRequest:request error:&error];
            if (people == nil)
            {
                NSLog(@"error: %@",error);
            }
            [self.tableView reloadData];
            break;
        default:
            break;
    }

}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.navigationItem.title = @"People";
  
  // Get our people array - this next block of code could probably be extracted out to a private
  // method and generalized for different fetch request types
  NSEntityDescription *personEntity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:self.managedObjectContext];
  NSFetchRequest *request = [[NSFetchRequest alloc] init];
  [request setEntity:personEntity];
  NSError *error = nil;    
  self.people = [self.managedObjectContext executeFetchRequest:request error:&error];
  if (error)
  {
    [NSException raise:NSInternalInconsistencyException format:@"Could not fetch Core Data records: %@",error];
  }
  [request release];
  
  // Now do a secondary load from another XIB file (other than the main table view)
  [[NSBundle mainBundle] loadNibNamed:@"FilterSortView" owner:self options:nil];
  
  // This disables the default selection
  self.filterControl.selectedSegmentIndex = -1;
  self.sortControl.selectedSegmentIndex = -1;
  
  // Now register for events when the value changes
  // TODO: write method implementations for each of these and then uncomment these lines.
    [self.filterControl addTarget:self action:@selector(filterControlValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.sortControl addTarget:self action:@selector(sortControlValueChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  self.filterControl = nil;
  self.sortControl = nil;
  self.filterSortView = nil;
}

#pragma mark -
#pragma mark UITableViewDataSource

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [self.people count];
}

#pragma mark -
#pragma mark UITableViewDelegate

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [[self tableView] dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil)
  {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  }
  Person *person = [self.people objectAtIndex:[indexPath row]];
//    NSLog(@"%@",person.firstName); 
  cell.textLabel.text = [NSString stringWithFormat:@"%@, %@",person.lastName,person.firstName];
  return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
  return self.filterSortView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
  return self.filterSortView.frame.size.height;
}

#pragma mark -
#pragma mark Class Plumbing

- (void)dealloc
{
  [filterControl release];
  [sortControl release];
  [filterSortView release];
  
  [people release];
  
  [_managedObjectContext release];
  [super dealloc];
}

@end

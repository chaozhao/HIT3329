//
//  RootViewController.m
//  FilteredList
//
//  Created by Mark Makdad on 6/10/11.
//  Copyright 2011 Long Weekend LLC. All rights reserved.
// Chao Zhao
// 6555985
// HIT3329

-(void)sortControlValueChanged:(id)sender
{
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

  // write method implementations for each of these and then uncomment these lines.
	[self.filterControl addTarget:self action:@selector(filterControlValueChanged:) forControlEvents:UIControlEventValueChanged];
	[self.sortControl addTarget:self action:@selector(sortControlValueChanged:) forControlEvents:UIControlEventValueChanged];

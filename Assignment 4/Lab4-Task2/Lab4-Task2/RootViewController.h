//
//  RootViewController.h
//  Lab4-Task2
//
//  Created by Chao Zhao on 30/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface RootViewController : UITableViewController
{
    IBOutlet UITableView *tableView;  
}
@property(nonatomic,retain) NSArray *listData;
@property(nonatomic,retain) IBOutlet UITableView *tableView;

-(UITableViewCell*)LoadGPSWithCell:(UITableViewCell*)cell;
-(UITableViewCell*)LoadGPSWithCell:(UITableViewCell*)cell atIndexPath:(NSIndexPath *)indexPath;

@end

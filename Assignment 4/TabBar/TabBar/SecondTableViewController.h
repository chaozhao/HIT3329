//
//  SecondTableViewController.h
//  TabBar
//
//  Created by Chao Zhao on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,retain) IBOutlet UITableView *tableView;

@end

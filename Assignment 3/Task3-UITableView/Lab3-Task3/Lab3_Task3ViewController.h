//
//  Lab3_Task3ViewController.h
//  Lab3-Task3
//
//  Created by 6555985 on 27/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Lab3_Task3ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    
}

@property(nonatomic,retain) NSArray *listData;
@property(nonatomic,retain) IBOutlet UITableView *tableView;


@end

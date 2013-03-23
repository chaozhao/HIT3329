//
//  RSSViewController.h
//  RSS
//
//  Created by Chao Zhao on 17/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSSViewController : UIViewController<NSXMLParserDelegate>

@property(nonatomic, retain) NSXMLParser *rssParser;

@property (retain) NSMutableArray *listData;

@property (retain) NSMutableArray *titles;

@property (nonatomic,retain) IBOutlet UITableView *tableView;

-(IBAction)refreshTableView:(id)sender;

@property (nonatomic,retain) NSMutableDictionary * item;

@property (nonatomic,retain) NSString * currentElement;
@property (nonatomic,retain) NSMutableString * currentTitle, * currentDate, * currentSummary, * currentLink;

@end

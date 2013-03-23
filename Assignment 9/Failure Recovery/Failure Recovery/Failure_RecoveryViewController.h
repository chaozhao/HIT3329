//
//  Failure_RecoveryViewController.h
//  Failure Recovery
//
//  Created by Chao Zhao on 31/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
#import "Reachability.h"

@interface Failure_RecoveryViewController : UIViewController
{
    Reachability* hostReach;
    Reachability* internetReach;
    Reachability* wifiReach;
    BOOL downloadStatus;
}

@property (nonatomic,retain) IBOutlet UIProgressView *progressView;
@property (nonatomic,retain) ASIHTTPRequest *request;

-(IBAction) resumeURLRequest:(id)sender;
-(IBAction) startURLRequest:(id)sender;
- (void) dealloc;
@end

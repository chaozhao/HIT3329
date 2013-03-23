//
//  Failure_RecoveryViewController.m
//  Failure Recovery
//
//  Created by Chao Zhao on 31/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Failure_RecoveryViewController.h"

@implementation Failure_RecoveryViewController
@synthesize progressView;
@synthesize request = _request;

#pragma mark - ASIHttpRequest

-(IBAction)startURLRequest:(id)sender
{
    NSString *tempFile = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"1.download"];
    
	if ([[NSFileManager defaultManager] fileExistsAtPath:tempFile]) 
    {
		[[NSFileManager defaultManager] removeItemAtPath:tempFile error:nil];
	}
	[self resumeURLRequest:self];
}

-(IBAction)resumeURLRequest:(id) sender
{
    NSURL *url = [NSURL URLWithString:@"http://download.thinkbroadband.com/5MB.zip"];
    _request = [ASIHTTPRequest requestWithURL:url];
    [self setRequest:_request];
    [_request setDelegate:self];
    [_request setDownloadProgressDelegate:progressView];
    [_request setAllowResumeForFileDownloads:YES];    
    [_request setNumberOfTimesToRetryOnTimeout:2];
    [_request setShouldContinueWhenAppEntersBackground:YES];
    [_request setDownloadDestinationPath:[[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"1.zip"]];
    [_request setTemporaryFileDownloadPath:[[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"1.download"]];
    [_request startAsynchronous];
}
- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSLog(@"Download Finished");
    downloadStatus = YES;
}
- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSError *error = [_request error];
    NSLog(@"set download status = NO : %@",error);
    downloadStatus = NO;
}

#pragma mark - Reachability

- (void) alertWithReachability: (Reachability*) curReach
{
    NetworkStatus netStatus = [curReach currentReachabilityStatus];
    BOOL connectionRequired= [curReach connectionRequired];
    NSString* statusString= @"";
    switch (netStatus)
    {
        case NotReachable:
        {
            statusString = @":Access Not Available";
            //Minor interface detail- connectionRequired may return yes,
            //even when the host is unreachable.
            connectionRequired= NO;
            break;
        }
        case ReachableViaWWAN:
        {
            statusString = @":Reachable WWAN";
            if(downloadStatus == NO)
            {   
                //[self resumeURLRequest:self];
            }
            break;
        }
        case ReachableViaWiFi:
        {
            statusString= @":Reachable WiFi";
            if(downloadStatus == NO)
            {   
                //[self resumeURLRequest:self];
            }
            break;
        }
    }
    if(connectionRequired)
    {
        statusString= [NSString stringWithFormat: @"%@, :Connection Required", statusString];
    }
    NSLog(@"%@",statusString);
} // -(void) alertWithReachability:

- (void) updateInterfaceWithReachability: (Reachability*) curReach
{
    if(curReach == hostReach)
    {
        [self alertWithReachability: curReach];
        //NetworkStatus netStatus = [curReach currentReachabilityStatus];
        BOOL connectionRequired= [curReach connectionRequired];
        
        //summaryLabel.hidden = (netStatus != ReachableViaWWAN);
        NSString* baseLabel=  @"";
        if(connectionRequired)
        {
            baseLabel = @"Cellular data network is available. Internet traffic will be routed through it after a connection is established.";
        }
        else
        {
            baseLabel = @"Cellular data network is active.    Internet traffic will be routed through it.";
        }
        NSLog(@"%@",baseLabel);
    }
    
	if(curReach == internetReach)
	{	
		[self alertWithReachability: curReach];
	}
    
	if(curReach == wifiReach)
	{	
		[self alertWithReachability: curReach];
	}	
}//- (void) updateInterfaceWithReachability: 

//Called by Reachability whenever status changes.
- (void) reachabilityChanged: (NSNotification* )note
{
	Reachability* curReach = [note object];
	NSParameterAssert([curReach isKindOfClass: [Reachability class]]);
	[self updateInterfaceWithReachability: curReach];
} //- (void) reachabilityChanged: 

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    progressView.progress = 0.0;
    downloadStatus = YES;
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(reachabilityChanged:) name: kReachabilityChangedNotification object: nil];
    
	/*hostReach = [[Reachability reachabilityWithHostName: @"www.apple.com"] retain];
     [hostReach startNotifier];
     [self updateInterfaceWithReachability: hostReach];
     
     wifiReach = [[Reachability reachabilityForLocalWiFi] retain];
     [wifiReach startNotifier];
     [self updateInterfaceWithReachability: wifiReach];
     */
    internetReach = [[Reachability reachabilityForInternetConnection] retain];
	[internetReach startNotifier];
	//[self updateInterfaceWithReachability: internetReach];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

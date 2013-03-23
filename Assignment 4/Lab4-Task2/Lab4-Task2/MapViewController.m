//
//  MapViewController.m
//  Lab4-Task2
//
//  Created by Chao Zhao on 1/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapViewController.h"
#import "DisplayMap.h"

@implementation MapViewController

@synthesize mapView;
@synthesize selectedRow;

- (MKCoordinateRegion) loadCoordinatesToRegion:(MKCoordinateRegion )theregion
{
    NSArray *items = [selectedRow componentsSeparatedByString:@";"]; 
    
    @try
    {
        theregion.center.latitude = [[items objectAtIndex:0] doubleValue] ;
        theregion.center.longitude = [[items objectAtIndex:1] doubleValue];
    }
    @catch(NSException *e)
    {
        NSLog(@" Exception: %@",e);
    }
    
    return theregion;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [mapView setMapType:MKMapTypeStandard];
	[mapView setZoomEnabled:YES];
	[mapView setScrollEnabled:YES];
	MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } };
    //set latitude and longitude
    //region = [self loadCoordinatesToRegion:region];
    NSArray *items = [selectedRow componentsSeparatedByString:@";"]; 
    @try{
    region.center.latitude = [[items objectAtIndex:0] doubleValue] ;
    region.center.longitude = [[items objectAtIndex:1] doubleValue];
	}
    @catch (NSException *e)
    {
        NSLog(@"Map View Controller Exception: %@",e);
    }
    region.span.longitudeDelta = 0.5f;
	region.span.latitudeDelta = 0.5f;
	
    [mapView setRegion:region animated:YES]; 
	[mapView setDelegate:self];
	DisplayMap *ann = [[DisplayMap alloc] init]; 
	ann.title = @"This is title";
	ann.subtitle = @"This is subtitle"; 
	ann.coordinate = region.center; 
	[mapView addAnnotation:ann];
}

-(MKAnnotationView *)mapView:(MKMapView *)mV viewForAnnotation:(id <MKAnnotation>)annotation 
{
	MKPinAnnotationView *pinView = nil; 
	if(annotation != mapView.userLocation) 
	{
		static NSString *defaultPinID = @"com.invasivecode.pin";
		pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
		if ( pinView == nil ) pinView = [[[MKPinAnnotationView alloc]
										  initWithAnnotation:annotation reuseIdentifier:defaultPinID] autorelease];
		pinView.pinColor = MKPinAnnotationColorRed; 
		pinView.canShowCallout = YES;
		pinView.animatesDrop = YES;
    } 
	else {
		[mapView.userLocation setTitle:@"I am here"];
	}
	return pinView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

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

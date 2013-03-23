//
//  MapViewController.h
//  Lab4-Task2
//
//  Created by Chao Zhao on 1/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <MKMapViewDelegate>
{
    IBOutlet MKMapView *mapView;
}

@property (nonatomic,retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) NSString *selectedRow;

- (MKCoordinateRegion) loadCoordinatesToRegion:(MKCoordinateRegion )theregion;

@end

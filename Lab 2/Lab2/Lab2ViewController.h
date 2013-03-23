//
//  Lab2ViewController.h
//  Lab2
//
//  Created by Chao Zhao on 2/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Lab2ViewController : UIViewController

@property (nonatomic, retain) IBOutlet UILabel *lab;
@property (nonatomic, retain) IBOutlet UISlider *red;
@property (nonatomic, retain) IBOutlet UISlider *green;
@property (nonatomic, retain) IBOutlet UISlider *blue;

-(IBAction)update:(id)sender;

@end



//
//  principalViewController.h
//  Cronometer
//
//  Created by Fabian Rosales on 10/25/15.
//  Copyright (c) 2015 KeyBellSoftCR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface principalViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) IBOutlet UITableView *tableViewer;

- (IBAction)UIButtonPauseCronometerClick:(id)sender;
- (IBAction)UIButtonStartCronometerClick:(id)sender;
- (IBAction)UIButtonStopCronometerClick:(id)sender;


@property(nonatomic,strong) IBOutlet UILabel *labelCronosMiliSeconds;
@property(nonatomic,strong) IBOutlet UILabel *labelCronosSeconds;
@property(nonatomic,strong) IBOutlet UILabel *labelCronosMinutes;

@end

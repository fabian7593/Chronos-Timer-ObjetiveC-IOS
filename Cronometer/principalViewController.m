//
//  principalViewController.m
//  Cronometer
//
//  Created by Fabian Rosales on 10/25/15.
//  Copyright (c) 2015 KeyBellSoftCR. All rights reserved.
//

#import "principalViewController.h"
#import "OthersTableViewCell.h"

@interface principalViewController ()
{
    //declare variables
    NSTimer *timer;
    int plusMiliSecond;
    int plusSeconds;
    int plusMinutes;
    NSMutableArray *arrayToShowThePowerOfChronos;
}
@end

@implementation principalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initAllToDestroyTime];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

//have the array count
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [arrayToShowThePowerOfChronos count];
}

//the  field of array
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    OthersTableViewCell *otherCell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    otherCell.labelSaveCronometer.text = [arrayToShowThePowerOfChronos objectAtIndex:indexPath.row];;
    return otherCell;
}


//pause chronos timer
- (IBAction)UIButtonPauseCronometerClick:(id)sender{
    [self printChronosTime];
    [timer invalidate];
    
    NSString *finalChronosPause=[NSString stringWithFormat:@" %@ : %@  : %@",[NSString stringWithFormat:@"%i",plusMinutes],[NSString stringWithFormat:@"%i",plusSeconds] ,[NSString stringWithFormat:@"%i",plusMiliSecond]];
    
    [arrayToShowThePowerOfChronos addObject:finalChronosPause];
    [self.tableViewer reloadData];
}

//Start chronos timer
- (IBAction)UIButtonStartCronometerClick:(id)sender{
    timer = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(initialTimer) userInfo:nil repeats:YES];
}

//stop and init all of chronos timer
- (IBAction)UIButtonStopCronometerClick:(id)sender{
    [self initAllToDestroyTime];
    [self printChronosTime];
    [self.tableViewer reloadData];
    [timer invalidate];
}

//initialized the variables
-(void)initAllToDestroyTime
{
    plusMiliSecond=0;
    plusSeconds=0;
    plusMinutes=0;
    arrayToShowThePowerOfChronos = [[NSMutableArray alloc]init];
}

//the method to run timer
//count miliseconds
-(void)initialTimer
{
    plusMiliSecond = plusMiliSecond + 1;
    
    if(plusMiliSecond==999)
    {
        plusMiliSecond=0;
        plusSeconds++;
    }
    
    if(plusSeconds==59)
    {
        plusSeconds=0;
        plusMinutes++;
    }
        
    [self printChronosTime];
}


//print the time in labels
-(void)printChronosTime
{
    self.labelCronosMiliSeconds.text =    [NSString stringWithFormat:@"%i",plusMiliSecond];
    self.labelCronosSeconds.text =    [NSString stringWithFormat:@"%i",plusSeconds];
    self.labelCronosMinutes.text =    [NSString stringWithFormat:@"%i",plusMinutes];
}

@end

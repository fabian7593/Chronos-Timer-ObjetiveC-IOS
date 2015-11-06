//
//  principalViewController.m
//  Cronometer
//
//  Created by Fabian Rosales on 10/25/15.
//  Copyright (c) 2015 KeyBellSoftCR. All rights reserved.
//

#import "principalViewController.h"
#import "OthersTableViewCell.h"
#import "PrincipalClass.h"
#import "AppDelegate.h"
#import "TimePower.h"
#import "ChildTimePower.h"

@interface principalViewController ()
{
    //declare variables
    PrincipalClass *principalClass;
    AppDelegate *appDelegateIntance;
    ChildTimePower *childTimePower;

    float internalTimer;
    NSTimer *timer;
    int plusMiliSecond;
    int plusSeconds;
    int plusMinutes;
    NSMutableArray *arrayToShowThePowerOfChronos;
    NSMutableArray *arrayTables;
}
@end

@implementation principalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initAllToDestroyTime];
    [self setInitialVariables];
    [self setFetchArrayChronos];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//realized fetch of chronos data
-(void)setFetchArrayChronos{
    arrayToShowThePowerOfChronos = (NSMutableArray *)[[childTimePower timePowerFetchRequest:appDelegateIntance.managedObjectContext]copy];
}

// set the principal variables
- (void)setInitialVariables
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegateIntance= appDelegate;
    //initialized variables
    principalClass = [[PrincipalClass alloc] init];
    childTimePower = [[ChildTimePower alloc]init];
    internalTimer=0.0004;
}

// initialized the variables to insert
-(void)setVariablesToinsert:(NSString *)fireHour
{
    TimePower *timePower;
    timePower=[childTimePower timePowerEntityInsert:appDelegateIntance.managedObjectContext];
    [childTimePower timePowerSet:timePower Date:[NSDate date]];
    [childTimePower timePowerSet:timePower Hour:fireHour];
    [appDelegateIntance saveContext];
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
    TimePower *tpower = [arrayToShowThePowerOfChronos objectAtIndex:indexPath.row];
    otherCell.labelSaveCronometer.text = tpower.hour;
    
    return otherCell;
}


//pause chronos timer
- (IBAction)UIButtonPauseCronometerClick:(id)sender{
    [self printChronosTime];
    [timer invalidate];
    
    NSString *finalChronosPause=[NSString stringWithFormat:@" %@ : %@  : %@",[NSString stringWithFormat:@"%i",plusMinutes],[NSString stringWithFormat:@"%i",plusSeconds] ,[NSString stringWithFormat:@"%i",plusMiliSecond]];
    
    [self setVariablesToinsert:finalChronosPause];
    [self setFetchArrayChronos];
    
    [self.tableViewer reloadData];
}

//Start chronos timer
- (IBAction)UIButtonStartCronometerClick:(id)sender{
    timer = [NSTimer scheduledTimerWithTimeInterval:internalTimer target:self selector:@selector(initialTimer) userInfo:nil repeats:YES];
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
    [childTimePower destroyerTimePowerData:appDelegateIntance.managedObjectContext];
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

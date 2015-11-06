//
//  ChildTimePower.h
//  Cronometer
//
//  Created by Cesar Gomez on 11/4/15.
//  Copyright © 2015 KeyBellSoftCR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "TimePower.h"

#pragma chronosmodel CoreData
#define timerPowerString                      @"TimePower"
#define dateString                            @"date"
#define hourString                            @"hour"

@interface ChildTimePower : NSObject

// Insert code here to declare functionality of your managed object subclass

- (id)timePowerEntityInsert:(NSManagedObjectContext *)context;
- (NSArray *)timePowerFetchRequestDescending:(NSManagedObjectContext *)context;
- (NSArray *)timePowerFetchRequest:(NSManagedObjectContext *)context;
- (void) destroyerTimePowerData:(NSManagedObjectContext *)context;

// Set Variables
- (void)timePowerSet:(TimePower *)timePower Date:(NSDate *)date;
- (void)timePowerSet:(TimePower *)timePower Hour:(NSString *)hour;

@end

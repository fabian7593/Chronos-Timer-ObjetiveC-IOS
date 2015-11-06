//
//  ChildTimePower.m
//  Cronometer
//
//  Created by Cesar Gomez on 11/4/15.
//  Copyright © 2015 KeyBellSoftCR. All rights reserved.
//

#import "ChildTimePower.h"
#import "PrincipalClass.h"

@implementation ChildTimePower
// Insert code here to add functionality to your managed object subclass

- (id)timePowerEntityInsert:(NSManagedObjectContext *)context{
    TimePower *timePower = [NSEntityDescription insertNewObjectForEntityForName:timerPowerString inManagedObjectContext:context];
    return timePower;
}
- (NSArray *)timePowerFetchRequestDescending:(NSManagedObjectContext *)context{
    return [PrincipalClass fetchingCoreDataContext:context entity:timerPowerString variable:dateString ascending:NO];
}
- (NSArray *)timePowerFetchRequest:(NSManagedObjectContext *)context{
    return [PrincipalClass fetchingCoreDataContext:context entity:timerPowerString];
}

-(void)destroyerTimePowerData:(NSManagedObjectContext *)context{
    [PrincipalClass deleteAllDataInContext:context byEntity:timerPowerString];
}

// Set Variables
- (void)timePowerSet:(TimePower *)timePower Date:(NSDate *)date{
    [timePower setValue:date forKey:dateString];
}
- (void)timePowerSet:(TimePower *)timePower Hour:(NSString *)hour{
    [timePower setValue:hour forKey:hourString];
}

@end

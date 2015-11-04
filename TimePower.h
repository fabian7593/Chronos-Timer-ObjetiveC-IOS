//
//  TimePower.h
//  Cronometer
//
//  Created by Fabian Rosales  on 11/4/15.
//  Copyright © 2015 KeyBellSoftCR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface TimePower : NSManagedObject
@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSString *hour;
@end


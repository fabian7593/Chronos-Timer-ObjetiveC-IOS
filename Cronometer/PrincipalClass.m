//
//  PrincipalClass.m
//  Cronometer
//
//  Created by Fabian Rosales  on 11/4/15.
//  Copyright © 2015 KeyBellSoftCR. All rights reserved.
//

#import "PrincipalClass.h"

@implementation PrincipalClass

#pragma coreadata
//fetching coredata with entity, descriptor and context
+(NSArray *)fetchingCoreDataContext:(NSManagedObjectContext *)context entity:(NSString *)entity variable:(NSString *)variable ascending:(BOOL)ascending
{
    NSFetchRequest *fetch = [NSFetchRequest fetchRequestWithEntityName:entity];
    NSSortDescriptor *sort = [[NSSortDescriptor alloc]
                              initWithKey:variable ascending:ascending];
    [fetch setSortDescriptors:@[sort]];
    NSError *error;
    NSArray *array = [context executeFetchRequest:fetch error:&error];
    
    return array;
}


+(NSArray *)fetchingCoreDataContext:(NSManagedObjectContext *)context entity:(NSString *)entity predicate :(NSString *)predicate param:(NSString *)param variable:(NSString *)variable ascending:(BOOL)ascending
{
    NSFetchRequest *fetch = [NSFetchRequest fetchRequestWithEntityName:entity];
    NSSortDescriptor *sort = [[NSSortDescriptor alloc]
                              initWithKey:variable ascending:ascending];
    
    NSPredicate *nsPredicate = [NSPredicate predicateWithFormat:predicate,param];
    [fetch setPredicate:nsPredicate];
    [fetch setSortDescriptors:@[sort]];
    
    NSError *error;
    NSArray *array = [context executeFetchRequest:fetch error:&error];
    
    return array;
}



//fetchign coredata with entity and context
+(NSArray *)fetchingCoreDataContext:(NSManagedObjectContext *)context entity:(NSString *)entity
{
    NSFetchRequest *fetch = [NSFetchRequest fetchRequestWithEntityName:entity];
    NSError *error;
    NSArray *array = [context executeFetchRequest:fetch error:&error];
    return array;
}



//this method delete all data of entity and context
+(void)deleteAllDataInContext: (NSManagedObjectContext *) localContext byEntity:(NSString *) entityName{
    
    NSFetchRequest *allData = [[NSFetchRequest alloc] init];
    [allData setEntity:[NSEntityDescription entityForName:entityName inManagedObjectContext:localContext]];
    [allData setIncludesPropertyValues:NO]; //only fetch the managedObjectID
    
    NSError *error = nil;
    NSArray *arrayEntities = [localContext executeFetchRequest:allData error:&error];
    
    //error handling goes here
    for (NSManagedObject *entityObject in arrayEntities) {
        [localContext deleteObject:entityObject];
    }
    NSError *saveError = nil;
    [localContext save:&saveError];
    //more error handling here
}




@end

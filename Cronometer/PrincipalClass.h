//
//  PrincipalClass.h
//  Cronometer
//
//  Created by Fabian Rosales  on 11/4/15.
//  Copyright © 2015 KeyBellSoftCR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>


@interface PrincipalClass : NSObject

+ (NSArray *)fetchingCoreDataContext:(NSManagedObjectContext *)context entity:(NSString *)entity predicate :(NSString *)predicate param:(NSString *)param variable:(NSString *)variable ascending:(BOOL)ascending;
+ (NSArray *)fetchingCoreDataContext:(NSManagedObjectContext *)context entity:(NSString *)entity variable:(NSString *)variable ascending:(BOOL)ascending;
+ (NSArray *)fetchingCoreDataContext:(NSManagedObjectContext *)context entity:(NSString *)entity;
+(void)deleteAllDataInContext: (NSManagedObjectContext *) localContext byEntity:(NSString *) entityName;

@end

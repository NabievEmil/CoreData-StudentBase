//
//  University.h
//  Homework5
//
//  Created by Наталия on 02.04.15.
//  Copyright (c) 2015 Emil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Facultative;

@interface University : NSManagedObject

@property (nonatomic, retain) NSString * universityName;
@property (nonatomic, retain) NSSet *facultatives;
@end

@interface University (CoreDataGeneratedAccessors)

- (void)addFacultativesObject:(Facultative *)value;
- (void)removeFacultativesObject:(Facultative *)value;
- (void)addFacultatives:(NSSet *)values;
- (void)removeFacultatives:(NSSet *)values;

@end

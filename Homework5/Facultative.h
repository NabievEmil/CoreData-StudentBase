//
//  Facultative.h
//  Homework5
//
//  Created by Наталия on 02.04.15.
//  Copyright (c) 2015 Emil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Facultative : NSManagedObject

@property (nonatomic, retain) NSString * facultativeName;
@property (nonatomic, retain) NSManagedObject *university;
@property (nonatomic, retain) NSSet *students;
@end

@interface Facultative (CoreDataGeneratedAccessors)

- (void)addStudentsObject:(NSManagedObject *)value;
- (void)removeStudentsObject:(NSManagedObject *)value;
- (void)addStudents:(NSSet *)values;
- (void)removeStudents:(NSSet *)values;

@end

//
//  Student.h
//  Homework5
//
//  Created by Наталия on 02.04.15.
//  Copyright (c) 2015 Emil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Facultative;

@interface Student : NSManagedObject

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSNumber * course;
@property (nonatomic, retain) Facultative *facultative;

@end

//
//  StudentBaseViewController.h
//  Homework5
//
//  Created by Наталия on 03.04.15.
//  Copyright (c) 2015 Emil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "University.h"
#import "Student.h"
#import "Facultative.h"

@interface StudentBaseViewController : UITableViewController

@property (strong,nonatomic) NSManagedObjectContext *managedObjectContext;

@end

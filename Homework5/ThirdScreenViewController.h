//
//  ThirdScreenViewController.h
//  Homework5
//
//  Created by Наталия on 04.04.15.
//  Copyright (c) 2015 Emil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdScreenViewController : UITableViewController

@property (strong,nonatomic) NSArray *students;
@property (strong,nonatomic) NSManagedObjectContext *managedObjectContext;

@end

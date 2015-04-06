//
//  SecondScreenViewController.h
//  Homework5
//
//  Created by Наталия on 03.04.15.
//  Copyright (c) 2015 Emil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondScreenViewController : UITableViewController

@property (strong,nonatomic) NSArray *facultatives;
@property (strong,nonatomic) NSManagedObjectContext *managedObjectContext;

@end

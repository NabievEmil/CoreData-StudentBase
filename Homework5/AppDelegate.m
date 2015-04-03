//
//  AppDelegate.m
//  Homework5
//
//  Created by Наталия on 02.04.15.
//  Copyright (c) 2015 Emil. All rights reserved.
//

#import "AppDelegate.h"
#import "University.h"
#import "Student.h"
#import "Facultative.h"
#import "StudentBaseViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSManagedObjectModel *model = [NSManagedObjectModel mergedModelFromBundles:nil];
    
    self.managedObjectModel = model;

    NSURL *docsURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]lastObject];
    
    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    
    [coordinator addPersistentStoreWithType:NSSQLiteStoreType
                              configuration:nil
                                        URL:[docsURL URLByAppendingPathComponent:@"Homework5.sqlite"]
                                    options:nil
                                      error:nil];
    self.persistentStoreCoordinator = coordinator;
    self.managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    self.managedObjectContext.persistentStoreCoordinator = coordinator;
    
//    for (int i = 0; i < 3; i++)
//    {
//        University *university = [NSEntityDescription insertNewObjectForEntityForName:@"University"
//                                                                inManagedObjectContext:self.managedObjectContext];
//        university.universityName = [NSString stringWithFormat:@"University %d",i+1];
//        for (int j = 0; j < 3; j++)
//        {
//            Facultative *facultative = [NSEntityDescription insertNewObjectForEntityForName:@"Facultative" inManagedObjectContext:self.managedObjectContext];
//            facultative.facultativeName = [NSString stringWithFormat:@"Facultative %d.%d",i+1,j+1];
//            facultative.university = university;
//            for (int k = 0; k < 3; k++)
//            {
//                Student *student = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:self.managedObjectContext];
//                student.firstName = [NSString stringWithFormat:@"Student %d.%d.%d",i+1,j+1,k+1];
//                student.facultative = facultative;
//                student.course = [[NSNumber alloc]initWithInt:arc4random() % 4 + 1];
//                [facultative addStudentsObject:student];
//            }
//            [university addFacultativesObject:facultative];
//        }
//        
//    }
    
    [self.managedObjectContext save:nil];
    
//    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"University"];
//    
//    NSArray *universities = [self.managedObjectContext executeFetchRequest:fetchRequest
//                                                                   error:nil];
//    NSLog(@"%@",universities);
    
    StudentBaseViewController *controller = (StudentBaseViewController *)self.window.rootViewController;
    controller.managedObjectContext = self.managedObjectContext;
    

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


@end

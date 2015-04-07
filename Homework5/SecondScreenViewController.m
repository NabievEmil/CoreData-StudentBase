//
//  SecondScreenViewController.m
//  Homework5
//
//  Created by Наталия on 03.04.15.
//  Copyright (c) 2015 Emil. All rights reserved.
//

#import "SecondScreenViewController.h"
#import "Facultative.h"
#import "ThirdScreenViewController.h"
#import "Student.h"
#import "AddStudentViewController.h"

@interface SecondScreenViewController ()

@property (strong,nonatomic) NSFetchedResultsController *fetchedResultsController;

@end

@implementation SecondScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Student"];
    fetchRequest.sortDescriptors = @[[[NSSortDescriptor alloc]initWithKey:@"facultative.facultativeName"
                                                                ascending:YES],
                                     [[NSSortDescriptor alloc]initWithKey:@"firstName"
                                                                ascending:YES]];
    NSPredicate *predicateRequest = [NSPredicate predicateWithFormat:@"facultative.university == %@",self.university];
    [fetchRequest setPredicate:predicateRequest];
    //    self.facultatives = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                                        managedObjectContext: self.managedObjectContext
                                                                          sectionNameKeyPath:@"facultative.facultativeName"
                                                                                   cacheName:nil];
    [self.fetchedResultsController performFetch:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return [self.fetchedResultsController sections].count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id<NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return [sectionInfo numberOfObjects];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Student *student = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = student.firstName;
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    id<NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return [sectionInfo name];
}


#pragma mark - Handlers

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[AddStudentViewController class]])
    {
        AddStudentViewController *controller = segue.destinationViewController;
        
        controller.managedObjectContext = self.managedObjectContext;
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/



//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    ThirdScreenViewController *controller2 = segue.destinationViewController;
//    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
//    Facultative *facultative = self.facultatives[indexPath.row];
//    NSArray *students = [facultative.students allObjects];
//    controller2.students = students;
//}


@end

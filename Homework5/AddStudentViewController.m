//
//  AddStudentViewController.m
//  Homework5
//
//  Created by Наталия on 07.04.15.
//  Copyright (c) 2015 Emil. All rights reserved.
//

#import "AddStudentViewController.h"
#import "Facultative.h"
#import "Student.h"


@interface AddStudentViewController ()
@property (strong, nonatomic) IBOutlet UITextField *facultativeNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *studentNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *studentCourseTextField;

@end

@implementation AddStudentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)didPressOnSave:(id)sender
{
    Facultative *facultative = [NSEntityDescription insertNewObjectForEntityForName:@"Facultative"
                                                             inManagedObjectContext:self.managedObjectContext];
    facultative.facultativeName = self.facultativeNameTextField.text;
    
    Student *student = [NSEntityDescription insertNewObjectForEntityForName:@"Student"
                                                     inManagedObjectContext:self.managedObjectContext];
    student.firstName = self.studentNameTextField.text;
    student.facultative = facultative;
    
    [self.managedObjectContext save:nil];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

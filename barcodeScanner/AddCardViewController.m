//
//  AddCardViewController.m
//  barcodeScanner
//
//  Created by Lynne Okada on 11/23/14.
//  Copyright (c) 2014 Lynne Okada. All rights reserved.
//

#import "AddCardViewController.h"
#import "Card.h"
#import "AppDelegate.h"
#import "ScannerViewController.h"

@interface AddCardViewController ()
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *cardID;

@end

@implementation AddCardViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void) viewDidAppear:(BOOL)animated
{
    // get access to the managed object context
    NSManagedObjectContext *context = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;
    // get entity description for entity we are selecting
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Card" inManagedObjectContext:context];
    // create a new fetch request
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    // create an error variable to pass to the execute method
    NSError *error;
    // retrieve results
    NSMutableArray* fetchedCards = [[context executeFetchRequest:request error:&error] mutableCopy];
    if (fetchedCards == nil) {
        //error handling, e.g. display error to user
    }
    
    self.cardID.text = self.cardBeingAdded.cardBarCodeID;
}

- (IBAction)saveTapped:(id)sender
{
    self.cardBeingAdded.cardName = self.textField.text;
    
    [(AppDelegate *)[UIApplication sharedApplication].delegate saveContext];
}

- (IBAction)unwindToAddCardViewController:(UIStoryboardSegue *)unwindSegue
{
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"scan"])
    {
        ScannerViewController *scannerViewController = [segue destinationViewController];
        self.cardBeingAdded = scannerViewController.cardBeingAdded;
    }
}


@end

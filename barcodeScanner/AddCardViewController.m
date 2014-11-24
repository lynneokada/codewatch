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

@implementation AddCardViewController {
    NSMutableArray *cards;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.textField.delegate = self;
}

- (void) viewDidAppear:(BOOL)animated
{
    self.cardID.text = self.barCodeID;
}

- (IBAction)saveTapped:(id)sender
{
    self.cardBeingAdded.cardName = self.textField.text;
    self.cardBeingAdded.cardBarCodeID = self.cardID.text;
    
    [(AppDelegate *)[UIApplication sharedApplication].delegate saveContext];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [self.textField resignFirstResponder];
    return YES;
}


@end

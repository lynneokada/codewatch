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

@interface AddCardViewController ()
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation AddCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)saveTapped:(id)sender
{
    self.cardBeingAdded.cardName = self.textField.text;
    
    [(AppDelegate *)[UIApplication sharedApplication].delegate saveContext];
}

- (IBAction)unwindToAddCardViewController:(UIStoryboardSegue *)unwindSegue
{
    
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

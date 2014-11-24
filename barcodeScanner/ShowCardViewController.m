//
//  ShowCardViewController.m
//  barcodeScanner
//
//  Created by Lynne Okada on 11/23/14.
//  Copyright (c) 2014 Lynne Okada. All rights reserved.
//

#import "ShowCardViewController.h"
#import "Card.h"

@interface ShowCardViewController ()

@end

@implementation ShowCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.name.text = self.card.cardName;
    self.ID.text = self.card.cardBarCodeID;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

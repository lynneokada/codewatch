//
//  AddCardViewController.h
//  barcodeScanner
//
//  Created by Lynne Okada on 11/23/14.
//  Copyright (c) 2014 Lynne Okada. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Card;

@interface AddCardViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) Card *cardBeingAdded;
@property (nonatomic, strong) NSString *barCodeID;

@end

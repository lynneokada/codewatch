//
//  ScannerViewController.h
//  barcodeScanner
//
//  Created by Lynne Okada on 11/23/14.
//  Copyright (c) 2014 Lynne Okada. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@class Card;

@interface ScannerViewController : UIViewController <AVCaptureMetadataOutputObjectsDelegate>

@property (nonatomic, strong) Card *cardBeingAdded;

@end


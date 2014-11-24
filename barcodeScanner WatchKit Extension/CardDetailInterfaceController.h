//
//  CardDetailInterfaceController.h
//  barcodeScanner
//
//  Created by Lynne Okada on 11/23/14.
//  Copyright (c) 2014 Lynne Okada. All rights reserved.
//

#import <WatchKit/WatchKit.h>

@interface CardDetailInterfaceController : WKInterfaceController
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *storeName;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *memberID;
@property (weak, nonatomic) IBOutlet WKInterfaceImage *QRCode;
@property (weak, nonatomic) IBOutlet WKInterfaceImage *barCode;

@end

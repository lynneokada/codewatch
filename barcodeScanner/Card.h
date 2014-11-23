//
//  Card.h
//  barcodeScanner
//
//  Created by Lynne Okada on 11/23/14.
//  Copyright (c) 2014 Lynne Okada. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Card : NSManagedObject

@property (nonatomic, retain) NSString * cardName;
@property (nonatomic, retain) NSString * cardBarCodeID;
@property (nonatomic, retain) NSData * imageQR;
@property (nonatomic, retain) NSData * imageBarCode;

@end

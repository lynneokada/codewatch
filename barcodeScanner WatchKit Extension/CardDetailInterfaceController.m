//
//  CardDetailInterfaceController.m
//  barcodeScanner
//
//  Created by Lynne Okada on 11/23/14.
//  Copyright (c) 2014 Lynne Okada. All rights reserved.
//

#import "CardDetailInterfaceController.h"

@implementation CardDetailInterfaceController

- (instancetype)initWithContext:(id)context {
    self = [super initWithContext:context];
    if (self){
        NSArray *storeInfo = (NSArray*)context;
        // Initialize variables here.
        // Configure interface objects here.
        NSLog(@"%@ initWithContext", self);
        
        // set self.memberships to contain the data from the phone
        [self.storeName setText:storeInfo[0]];
        NSString *ID = [NSString stringWithFormat:@"ID: %@",storeInfo[1]];
        [self.memberID setText:ID];
    }
    return self;
}

@end

//
//  InterfaceController.m
//  barcodeScanner WatchKit Extension
//
//  Created by Lynne Okada on 11/23/14.
//  Copyright (c) 2014 Lynne Okada. All rights reserved.
//

#import "InterfaceController.h"
#import "MembershipTableCell.h"
#import "CardDetailInterfaceController.h"


@interface InterfaceController()
@property (strong, nonatomic) IBOutlet WKInterfaceTable *membershipTable;
@property (strong, nonatomic) NSArray *memberships;
@end


@implementation InterfaceController

- (instancetype)initWithContext:(id)context {
    self = [super initWithContext:context];
    if (self){
        // Initialize variables here.
        // Configure interface objects here.
        NSLog(@"%@ initWithContext", self);
        
        // set self.memberships to contain the data from the phone
        [self loadTableData];
    }
    return self;
}

-(void)loadTableData {
    // remove this once we get real data
    self.memberships = @[@"Safeway", @"Costco", @"Planet Granite", @"CVS", @"Walgreens", @"HomeDepot"];
    
    [self.membershipTable setNumberOfRows:self.memberships.count withRowType:@"defaultRow"];
    
    for (NSInteger i = 0; i < self.memberships.count; i++) {
        MembershipTableCell *cell = [self.membershipTable rowControllerAtIndex:i];
        [cell.storeName setText:self.memberships[i]];
    }
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    NSLog(@"%@ will activate", self);
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    NSLog(@"%@ did deactivate", self);
}

- (id)contextForSegueWithIdentifier:(NSString *)segueIdentifier inTable:(WKInterfaceTable *)table rowIndex:(NSInteger)rowIndex
{
    NSMutableArray *context= [[NSMutableArray alloc] init];
    if ([segueIdentifier isEqualToString:@"viewDetail"])
    {
        [context addObject:self.memberships[rowIndex]];
        [context addObject:@"lou64gtbfhhjk"];
//        CardDetailInterfaceController *cardDetailViewController = [segueIdentifier];
//        cardDetailViewController.storeName = self.memberships[rowIndex];
    }
    return context;
}

@end




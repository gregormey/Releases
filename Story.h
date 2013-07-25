//
//  Story.h
//  Releases
//
//  Created by Gregor Meyenberg on 15.07.13.
//  Copyright (c) 2013 Gregor Meyenberg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Story : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * story;
@property (nonatomic) int16_t size;
@property (nonatomic) BOOL ordered;
@property (nonatomic, retain) NSString * status;
@property (nonatomic) int16_t relativeBenefit;
@property (nonatomic) int16_t relativePenalty;
@property (nonatomic) int16_t businessValue;
@property (nonatomic, retain) NSDecimalNumber *  businessValuePerCent;
@property (nonatomic, retain) NSDecimalNumber * costPerCent;
@property (nonatomic) int16_t relativeRisk;
@property (nonatomic, retain) NSDecimalNumber * riskPerCent;
@property (nonatomic, retain) NSDecimalNumber * priorityCalc;
@property (nonatomic) int16_t priority;
@property (nonatomic, retain) NSManagedObject *project;

- (void) calcBussinesValue;
- (void) calcBussinesValuePerCent;
- (void) calcCostPerCent;

@end

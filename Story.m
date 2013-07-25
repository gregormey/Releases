//
//  Story.m
//  Releases
//
//  Created by Gregor Meyenberg on 15.07.13.
//  Copyright (c) 2013 Gregor Meyenberg. All rights reserved.
//

#import "Story.h"


@implementation Story

@dynamic title;
@dynamic story;
@dynamic size;
@dynamic ordered;
@dynamic status;
@dynamic relativeBenefit;
@dynamic relativePenalty;
@dynamic businessValue;
@dynamic businessValuePerCent;
@dynamic costPerCent;
@dynamic relativeRisk;
@dynamic riskPerCent;
@dynamic priorityCalc;
@dynamic priority;
@dynamic project;

-(void) calcBussinesValue {
    [self setBusinessValue:self.relativeBenefit + self.relativePenalty];
}

-(void) calcBussinesValuePerCent {
    NSNumber *bvSum = [ [self project] valueForKeyPath:@"stories.@sum.businessValue" ];
    [self setBusinessValuePerCent: [[NSDecimalNumber alloc] initWithFloat:self.businessValue/([bvSum floatValue]/100)]];
}

@end

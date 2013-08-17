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



//calclates bussiness value by bulding the sum from relativeBenefit and relativePenalty
-(void) calcBussinesValue {
    [self setBusinessValue:self.relativeBenefit + self.relativePenalty];
}

//calculates percentage of the stories bussines value on the entiere project
-(void) calcBussinesValuePerCent {
    NSNumber *bvSum = [ [self project] valueForKeyPath:@"stories.@sum.businessValue" ];
    [self setBusinessValuePerCent: [[NSDecimalNumber alloc] initWithFloat:self.businessValue/([bvSum floatValue]/100)]];
}

//calculates percentage of the stories cost on the entiere project
-(void) calcCostPerCent {
    NSNumber *costSum = [ [self project] valueForKeyPath:@"stories.@sum.size" ];
    [self setCostPerCent: [[NSDecimalNumber alloc] initWithFloat:self.size/([costSum floatValue]/100)]];
}

//calculates percentage of the stories risk  on the entiere project
-(void) calcRiskPerCent {
    NSNumber *riskSum = [ [self project] valueForKeyPath:@"stories.@sum.relativeRisk" ];
    [self setRiskPerCent: [[NSDecimalNumber alloc] initWithFloat:self.relativeRisk/([riskSum floatValue]/100)]];
}


//calculates a value for the priority of the story by bussiness value percentage divided by cost percentage plus
// risk percentage
-(void) calcPriorityCalc {
    [self setPriorityCalc: [[NSDecimalNumber alloc] initWithFloat:[self.businessValuePerCent floatValue]/([self.costPerCent floatValue]+[self.riskPerCent floatValue])]];
}


- (void)awakeFromInsert {
    [self observeFields];
}

- (void)awakeFromFetch {
    [self observeFields];
}

-(void)observeField:(NSString*) field{
    [self addObserver:self forKeyPath:field
              options:(NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew) context:NULL];
}


- (void)observeFields {
    [self observeField:@"relativeBenefit" ];
    [self observeField:@"relativePenalty" ];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change
                       context:(void *)context {
    if ([keyPath isEqualToString:@"relativeBenefit"]||
        [keyPath isEqualToString:@"relativePenalty"]) {
            [self calcBussinesValue];
    }
}

- (void)willTurnIntoFault {
    [self removeObserver:self forKeyPath:@"relativeBenefit"];
    [self removeObserver:self forKeyPath:@"relativePenalty"];
}




@end

//
//  TestStory.m
//  Releases
//
//  Created by Gregor Meyenberg on 25.07.13.
//  Copyright (c) 2013 Gregor Meyenberg. All rights reserved.
//

#import "TestStory.h"
#import "Story.h"

@implementation TestStory
        
//returns instance of Story in current NSManagedContext
- (Story*) getStory{
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Story" inManagedObjectContext:[self getMoc]];
    Story *story =[[Story alloc] initWithEntity:entity insertIntoManagedObjectContext:[self getMoc]];
    
    return story;
}

//returns instance of Project in current NSManagedContext
- (NSManagedObject*) getProject {
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Project" inManagedObjectContext:[self getMoc]];
    return  [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:[self getMoc]];
}

//creates story, sets relative panalty and relative benefit to test the behaviour of the method
// calcBussinesValue from Story
- (void)testCalcBussinesValue {

    Story *story = [self getStory];
    [story setRelativeBenefit:9];
    [story setRelativePenalty:9];
    int expected = 18;
    [story calcBussinesValue];
    int result = story.businessValue;
    
    STAssertEquals(expected, result,
                   @"We expected Business Value %d, but it was %d",expected,story.businessValue);
}


//creates two storys, connects them to the same project and sets bussinessValue of the stories to test the behaviour of the method calcBussinesValuePerCent from Story
- (void)testCalcBussinesValuePerCent{
    NSManagedObject *project = [self getProject];
    Story *story1 = [self getStory];
    Story *story2 = [self getStory];
   
    story1.businessValue=2;
    story2.businessValue=2;
    
    story1.project=project;
    story2.project=project;
        
    
    [story1 calcBussinesValuePerCent];
    [story2 calcBussinesValuePerCent];
    
    int expected = 50;
    NSDecimalNumber *result1=story1.businessValuePerCent;
    NSDecimalNumber *result2=story2.businessValuePerCent;
    
    STAssertEquals(expected, [result1 intValue],
                   @"We expected Business Value per Cent 1 %d, but it was %d",expected,[result1 intValue]);
    
    STAssertEquals(expected, [result2 intValue],
                   @"We expected Business Value per Cent 2 %d, but it was %d",expected,[result2 intValue]);
    
}

//creates two storys, connects them to the same project and sets size of the stories to test the behaviour of the method calcCostPerCent from Story
- (void)testCalcCostPerCent{
    NSManagedObject *project = [self getProject];
    Story *story1 = [self getStory];
    Story *story2 = [self getStory];
    
    story1.size=2;
    story2.size=2;
    
    story1.project=project;
    story2.project=project;
    
    
    [story1 calcCostPerCent];
    [story2 calcCostPerCent];
    
    int expected = 50;
    NSDecimalNumber *result1=story1.costPerCent;
    NSDecimalNumber *result2=story2.costPerCent;
    
    STAssertEquals(expected, [result1 intValue],
                   @"We expected Cost Value per Cent 1 %d, but it was %d",expected,[result1 intValue]);
    
    STAssertEquals(expected, [result2 intValue],
                   @"We expected Cost Value per Cent 2 %d, but it was %d",expected,[result2 intValue]);
    
}


//creates two storys, connects them to the same project and sets relativeRisk of the stories to test the behaviour of the method calcRiskPerCent from Story
- (void)testCalcRiskPerCent{
    NSManagedObject *project = [self getProject];
    Story *story1 = [self getStory];
    Story *story2 = [self getStory];
    
    story1.relativeRisk=2;
    story2.relativeRisk=2;
    
    story1.project=project;
    story2.project=project;
    
    
    [story1 calcRiskPerCent];
    [story2 calcRiskPerCent];
    
    int expected = 50;
    NSDecimalNumber *result1=story1.riskPerCent;
    NSDecimalNumber *result2=story2.riskPerCent;
    
    STAssertEquals(expected, [result1 intValue],
                   @"We expected Risk Value per Cent 1 %d, but it was %d",expected,[result1 intValue]);
    
    STAssertEquals(expected, [result2 intValue],
                   @"We expected Risk Value per Cent 2 %d, but it was %d",expected,[result2 intValue]);
    
}

//creates two storys, connects them to the same project and sets BusinessValuePerCent, CostPerCent, RiskPerCent  of the stories to test the behaviour of the method calcPriorityCalc from Story
- (void)testCalcPriorityCalc{
    NSManagedObject *project = [self getProject];
    Story *story1 = [self getStory];
    Story *story2 = [self getStory];
    
    [story1 setBusinessValuePerCent:[[NSDecimalNumber alloc] initWithInt:50]];
    [story2 setBusinessValuePerCent:[[NSDecimalNumber alloc] initWithInt:50]];
    
    [story1 setCostPerCent:[[NSDecimalNumber alloc] initWithInt:50]];
    [story2 setCostPerCent:[[NSDecimalNumber alloc] initWithInt:50]];
    
    [story1 setRiskPerCent:[[NSDecimalNumber alloc] initWithInt:50]];
    [story2 setRiskPerCent:[[NSDecimalNumber alloc] initWithInt:50]];
    
    story1.project=project;
    story2.project=project;
    
    
    [story1 calcPriorityCalc];
    [story2 calcPriorityCalc];
    
    float expected = 0.5;
    NSDecimalNumber *result1=story1.priorityCalc;
    NSDecimalNumber *result2=story2.priorityCalc;
    
    STAssertEquals(expected, [result1 floatValue],
                   @"We expected Risk Value per Cent 1 %d, but it was %d",expected,[result1 floatValue]);
    
    STAssertEquals(expected, [result2 floatValue],
                   @"We expected Risk Value per Cent 2 %d, but it was %d",expected,[result2 floatValue]);
    
}


@end

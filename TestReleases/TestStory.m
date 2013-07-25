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
        

- (Story*) getStory{
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Story" inManagedObjectContext:[self getMoc]];
    Story *story =[[Story alloc] initWithEntity:entity insertIntoManagedObjectContext:[self getMoc]];
    
    return story;
}

- (NSManagedObject*) getProject {
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Project" inManagedObjectContext:[self getMoc]];
    return  [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:[self getMoc]];
}


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

@end

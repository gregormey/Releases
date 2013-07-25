//
//  TestStory.m
//  Releases
//
//  Created by Gregor Meyenberg on 25.07.13.
//  Copyright (c) 2013 Gregor Meyenberg. All rights reserved.
//

#import "TestStory.h"
#import "Story.h"

@implementation TestStory  {
        Story *story;
}



- (void)testCalcBussinesValue {
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Story" inManagedObjectContext:[self getMoc]];
    story =  [[Story alloc] initWithEntity:entity insertIntoManagedObjectContext:[self getMoc]];
    
    int expected = 18;
    [story setRelativeBenefit:9];
    [story setRelativePenalty:9];
    [story calcBussinesValue];
    int result = story.businessValue;
    
    STAssertEquals(expected, result,
                   @"We expected Business Value %d, but it was %d",expected,story.businessValue);
}

@end

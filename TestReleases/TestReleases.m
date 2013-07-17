//
//  TestReleases.m
//  TestReleases
//
//  Created by Gregor Meyenberg on 15.07.13.
//  Copyright (c) 2013 Gregor Meyenberg. All rights reserved.
//


#import "TestReleases.h"
#import "Story.h"


@implementation TestReleases {
    NSManagedObjectModel *_mom;
    NSPersistentStoreCoordinator *_psc;
    NSManagedObjectContext *_moc;
    NSPersistentStore *_store;
    Story *story;
    
}

@synthesize managedObjectContext = _moc;

- (void)setUp
{
    [super setUp];
    
    NSArray *bundles = [NSArray arrayWithObject:[NSBundle bundleForClass:[self class]]];
    _mom = [NSManagedObjectModel mergedModelFromBundles:bundles];
    NSLog(@"Model: %@", _mom);
    _psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_mom];
    _moc = [[NSManagedObjectContext alloc] init];
    [_moc setPersistentStoreCoordinator:_psc];

    story = (Story *)[NSEntityDescription insertNewObjectForEntityForName:@"Story" inManagedObjectContext:_moc];
    
    
   /* _store = [_psc addPersistentStoreWithType:NSInMemoryStoreType configuration:nil URL:nil options:nil error:NULL];
    STAssertNotNil(_store,@"Unable to create in-memory store");
    
    _moc = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_moc setPersistentStoreCoordinator:_psc];  */
}

- (void)tearDown
{
    [super tearDown];
    _mom = nil; _psc = nil; _moc = nil; _store = nil;
}


- (void)testCalcBussinesValue {
    
    STAssertNotNil(story, @"should have a story");
  /*  NSEntityDescription *entity = [NSEntityDescription entityForName:@"Story" inManagedObjectContext:_moc];
    Story* story =  [[Story alloc] initWithEntity:entity insertIntoManagedObjectContext:_moc];
    
    
    int expected = 18;
    [story setRelativeBenefit:9];
    [story setRelativePenalty:8];
    [story calcBussinesValue];

    STAssertEquals(expected, story.businessValue,
                   @"We expected Business Value %d, but it was %d",expected,story.businessValue); */
}

@end

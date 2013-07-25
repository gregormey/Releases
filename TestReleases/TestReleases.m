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
}


- (void)setUp
{
    [super setUp];
    
      
    NSBundle * bundle = [NSBundle bundleForClass:[self class]];
    _mom = [NSManagedObjectModel mergedModelFromBundles:[NSArray arrayWithObject:bundle]];
 
    _psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: _mom];
    _store = [_psc addPersistentStoreWithType: NSInMemoryStoreType
                                configuration: nil
                                          URL: nil
                                      options: nil
                                        error: NULL];
    _moc = [[NSManagedObjectContext alloc] init];
    [_moc setPersistentStoreCoordinator: _psc];
    

}

- (void)tearDown
{
    [super tearDown];
    _mom = nil; _psc = nil; _moc = nil; _store = nil;
}


-(NSManagedObjectContext*)getMoc
{
    return _moc;
}


@end

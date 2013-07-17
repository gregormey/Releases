//
//  TestReleases.h
//  TestReleases
//
//  Created by Gregor Meyenberg on 15.07.13.
//  Copyright (c) 2013 Gregor Meyenberg. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@interface TestReleases : SenTestCase

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

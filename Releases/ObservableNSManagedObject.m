//
//  ObservableNSManagedObject.m
//  Releases
//
//  Created by Gregor Meyenberg on 09.08.13.
//  Copyright (c) 2013 Gregor Meyenberg. All rights reserved.
//

#import "ObservableNSManagedObject.h"

@implementation ObservableNSManagedObject

- (void)awakeFromInsert {
    [self observeFields];
}

- (void)awakeFromFetch {
    [self observeFields];
}

@end

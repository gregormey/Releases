//
//  ObservableNSManagedObject.m
//  Releases
//
//  Created by Gregor Meyenberg on 09.08.13.
//  Copyright (c) 2013 Gregor Meyenberg. All rights reserved.
//

#import "ObservableNSManagedObject.h"

@implementation ObservableNSManagedObject{
    NSMutableArray *_observedFields;
}

-(void)initObservedFields{
    _observedFields=[NSMutableArray array];
}

-(NSMutableArray*)getObeservedFields {
    return _observedFields;
}

-(void) addObeservedField:(NSString*) field {
    [_observedFields addObject:field];
}

- (void)awakeFromInsert {
    [self initObservedFields];
    [self observeFields];
}

- (void)awakeFromFetch {
    [self initObservedFields];
    [self observeFields];
}


-(void)observeField:(NSString*) field{
    [self addObserver:self forKeyPath:field
              options:(NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew) context:NULL];
}


- (void)observeFields {
    for(NSString *field in  _observedFields){
        [self observeField:field];
        NSLog(@"field Name: %@", field);
    }
}

- (void)willTurnIntoFault {
    for(NSString *field in  _observedFields){
         [self removeObserver:self forKeyPath:field];
    }
    

}



@end

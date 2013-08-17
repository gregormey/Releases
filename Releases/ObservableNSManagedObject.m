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

-(id)initWithEntity:(NSEntityDescription *)entity insertIntoManagedObjectContext:(NSManagedObjectContext *)context{

    self = [super initWithEntity:entity insertIntoManagedObjectContext:context];
    if (self)
    {
        _observedFields=[NSMutableArray array];
    }
    return self;
}

-(NSMutableArray*)getObeservedFields {
    return _observedFields;
}

-(void) addObeservedField:(NSString*) field {
    [_observedFields addObject:field];
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

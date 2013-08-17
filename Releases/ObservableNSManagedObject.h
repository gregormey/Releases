//
//  ObservableNSManagedObject.h
//  Releases
//
//  Created by Gregor Meyenberg on 09.08.13.
//  Copyright (c) 2013 Gregor Meyenberg. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface ObservableNSManagedObject : NSManagedObject

-(NSManagedObjectContext*)getMoc;

@end

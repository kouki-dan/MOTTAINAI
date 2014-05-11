//
//  Mottainai.h
//  MOTTAINAI
//
//  Created by Kouki Saito on 2014/05/11.
//  Copyright (c) 2014年 Kouki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Mottainai : NSManagedObject

@property (nonatomic, retain) NSDate * created;
@property (nonatomic, retain) NSNumber * group;
@property (nonatomic, retain) NSNumber * sync;
@property (nonatomic, retain) NSString * text;

@end

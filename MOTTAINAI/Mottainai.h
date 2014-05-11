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

@property (nonatomic) NSTimeInterval created;
@property (nonatomic, retain) NSString * text;
@property (nonatomic) BOOL sync;
@property (nonatomic) int32_t group;

@end

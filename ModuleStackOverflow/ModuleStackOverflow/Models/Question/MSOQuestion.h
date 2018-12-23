//
//  MSOQuestion.h
//  ModuleStackOverflow
//
//  Created by Iskander Foatov on 07/12/2018.
//  Copyright © 2018 Iskander Foatov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MSOOwner;

NS_ASSUME_NONNULL_BEGIN


@interface MSOQuestion : NSObject

@property (nonatomic, readonly) NSUInteger question_id;
@property (nonatomic, readonly) NSURL *link;
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSDate *creationDate;
@property (nonatomic, readonly) NSDate *lastActivityDate;
@property (nonatomic, readonly) NSUInteger score;
@property (nonatomic, readonly) NSUInteger answerCount;
@property (nonatomic, nullable, readonly) NSNumber *acceptedAnswerId;
@property (nonatomic, readonly) NSUInteger viewCount;
@property (nonatomic, readonly) BOOL isAnswered;
@property (nonatomic, readonly) NSArray<NSString *> *tags;
@property (nonatomic, readonly) MSOOwner *owner;


@end

NS_ASSUME_NONNULL_END

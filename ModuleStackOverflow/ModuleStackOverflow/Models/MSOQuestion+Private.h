//
//  MSOQuestion+Private.h
//  ModuleStackOverflow
//
//  Created by Iskander Foatov on 07/12/2018.
//  Copyright © 2018 Iskander Foatov. All rights reserved.
//

#import "MSOQuestion.h"


@interface MSOQuestion ()

@property (nonatomic, assign) NSUInteger question_id;
@property (nonatomic, strong) NSURL *link;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSDate *creationDate;
@property (nonatomic, strong) NSDate *lastActivityDate;
@property (nonatomic, assign) NSUInteger score;
@property (nonatomic, assign) NSUInteger answerCount;
@property (nonatomic, nullable, strong) NSNumber *acceptedAnswerId;
@property (nonatomic, assign) NSUInteger viewCount;
@property (nonatomic, assign) BOOL isAnswered;
@property (nonatomic, strong) NSArray<NSString *> *tags;
@property (nonatomic, strong) MSOOwner *owner;

@end

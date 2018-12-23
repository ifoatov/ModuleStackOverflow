//
//  MSOQuestionFactory.h
//  ModuleStackOverflow
//
//  Created by Iskander Foatov on 07/12/2018.
//  Copyright © 2018 Iskander Foatov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MSOQuestion;


@interface MSOQuestionFactory : NSObject

+ (nonnull NSArray<MSOQuestion *> *)questionsWithJson:(NSArray * _Nonnull )json;

@end

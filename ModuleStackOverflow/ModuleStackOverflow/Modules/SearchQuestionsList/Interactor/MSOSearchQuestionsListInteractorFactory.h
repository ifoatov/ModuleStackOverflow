//
//  MSOSearchQuestionsListInteractorFactory.h
//  ModuleStackOverflow
//
//  Created by Iskander Foatov on 22/12/2018.
//  Copyright © 2018 Iskander Foatov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSOSearchQuestionsListInteractorProtocol.h"


NS_ASSUME_NONNULL_BEGIN


@interface MSOSearchQuestionsListInteractorFactory : NSObject

+ (id<MSOSearchQuestionsListInteractorProtocol>)onlineInteractor;

+ (id<MSOSearchQuestionsListInteractorProtocol>)offlineInteractor;

@end

NS_ASSUME_NONNULL_END

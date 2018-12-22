//
//  MSOSearchQuestionsListInteractor.h
//  ModuleStackOverflow
//
//  Created by Iskander Foatov on 20/12/2018.
//  Copyright © 2018 Iskander Foatov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSOSearchQuestionsListInteractorProtocol.h"

@protocol MSOOnlineProviderProtocol;


NS_ASSUME_NONNULL_BEGIN


@interface MSOSearchQuestionsListOnlineInteractor : NSObject <MSOSearchQuestionsListInteractorProtocol>

- (instancetype)initWithProvider:(id<MSOOnlineProviderProtocol>)provider;

@end

NS_ASSUME_NONNULL_END

//
//  MSOQuestionViewModel.h
//  ModuleStackOverflow
//
//  Created by Iskander Foatov on 23/12/2018.
//  Copyright © 2018 Iskander Foatov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSOTableItemViewModelProtocol.h"


NS_ASSUME_NONNULL_BEGIN

@interface MSOQuestionViewModel : NSObject <MSOTableItemViewModelProtocol>

@property (nonatomic, readonly) MSOQuestion *question;

- (instancetype)initWithQuestion:(MSOQuestion *)question;

@end

NS_ASSUME_NONNULL_END

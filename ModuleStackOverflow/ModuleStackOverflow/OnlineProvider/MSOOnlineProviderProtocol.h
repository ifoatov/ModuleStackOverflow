//
//  MSOOnlineProviderProtocol.h
//  ModuleStackOverflow
//
//  Created by Iskander Foatov on 07/12/2018.
//  Copyright © 2018 Iskander Foatov. All rights reserved.
//

@class MSOQuestion;


typedef void(^MSOOnlineProviderComplitionBlock)(NSString * _Nonnull tag, NSArray<MSOQuestion *> * _Nullable questions, NSError * _Nullable error);


@protocol MSOOnlineProviderProtocol

- (void)getQuestionsWithTag:(NSString *)tag
				 complition:(MSOOnlineProviderComplitionBlock)complition;

@end

//
//  MSOServiceLocatorProtocol.h
//  ModuleStackOverflow
//
//  Created by Iskander Foatov on 07/12/2018.
//  Copyright © 2018 Iskander Foatov. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol MSOOnlineProviderProtocol;
@protocol MSODataBaseProtocol;


@protocol MSOServiceLocatorProtocol

@property (nonatomic, readonly) id<MSOOnlineProviderProtocol> onlineProvider;
@property (nonatomic, readonly) id<MSODataBaseProtocol> dataBase;

+ (id<MSOServiceLocatorProtocol>)shared;

@end

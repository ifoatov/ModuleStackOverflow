//
//  MSOServiceLocator.h
//  ModuleStackOverflow
//
//  Created by Iskander Foatov on 07/12/2018.
//  Copyright © 2018 Iskander Foatov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSOServiceLocatorProtocol.h"


NS_ASSUME_NONNULL_BEGIN



@interface MSOServiceLocator : NSObject <MSOServiceLocatorProtocol>

- (MSOServiceLocator *)shared;

@end

NS_ASSUME_NONNULL_END

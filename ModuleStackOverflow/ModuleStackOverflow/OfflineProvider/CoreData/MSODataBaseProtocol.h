//
//  MSODataBaseProtocol.h
//  ModuleStackOverflow
//
//  Created by Iskander Foatov on 14/12/2018.
//  Copyright © 2018 Iskander Foatov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSArray *(^dataBaseGetCompletionBlock)(NSArray *fetchResult);

/**
 Протокол базы данных
 */
@protocol MSODataBaseProtocol <NSObject>

/*
 Метод получения всех сохраненных в базе объектов Вопрос
 */
- (void)getAnswers:(dataBaseGetCompletionBlock)completion;

@end

//
//  MSOQuestionTableViewCell.h
//  ModuleStackOverflow
//
//  Created by Iskander Foatov on 22/12/2018.
//  Copyright © 2018 Iskander Foatov. All rights reserved.
//

#import <UIKit/UIKit.h>


@class MSOQuestion;


NS_ASSUME_NONNULL_BEGIN


@interface MSOQuestionTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *voutesLabel;
@property (weak, nonatomic) IBOutlet UILabel *answersLaber;
@property (weak, nonatomic) IBOutlet UILabel *viewsLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


- (void)setupWithQuestion:(MSOQuestion *)question;

@end

NS_ASSUME_NONNULL_END

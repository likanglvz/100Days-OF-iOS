//
//  NameAndGenderCell.m
//  customCellNib
//
//  Created by 李康 on 16/4/21.
//  Copyright © 2016年 李康. All rights reserved.
//

#import "NameAndGenderCell.h"
@interface NameAndGenderCell()
@property(strong,nonatomic) IBOutlet UILabel *nameLabel;
@property(strong,nonatomic)IBOutlet UILabel *genderLaber;


@end

@implementation NameAndGenderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setName:(NSString *)n{
    if (![n isEqualToString:_name]) {
        _name=[n copy];
    }
    self.nameLabel.text= _name;
    
}
-(void)setGender:(NSString *)g{
    if (![g isEqualToString:_gender]) {
        _gender=[g copy];
    }
    self.genderLaber.text = _gender;
}

@end

//
//  ViewController.h
//  plistTut
//
//  Created by Jon Howell on 08/10/2014.
//  Copyright (c) 2014 Manchester Metropolitan University - ESS - essmobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UITextField *name;
    IBOutlet UITextField *home;
    IBOutlet UITextField *work;
    IBOutlet UITextField *cell;
    
    NSString *personName;
    NSMutableArray *phoneNumber;
}

@property (nonatomic,retain) UITextField *name;
@property (nonatomic,retain) UITextField *home;
@property (nonatomic,retain) UITextField *work;
@property (nonatomic,retain) UITextField *cell;

@property (nonatomic,retain) NSString *personName;
@property (nonatomic,retain) NSMutableArray *phoneNumber;

- (IBAction)saveButton:(UIButton *)sender;
-(IBAction)textFieldReturn:(id)textField;
@end


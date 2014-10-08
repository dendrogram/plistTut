//
//  ViewController.h
//  plistTut
//
//  Created by Jon Howell on 08/10/2014.
//  Copyright (c) 2014 Manchester Metropolitan University - ESS - essmobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UITextField *nameEntered;
    IBOutlet UITextField *home;
    IBOutlet UITextField *work;
    IBOutlet UITextField *cell;
    
    NSString *personalName;
    NSMutableArray *phoneNumbers;
}

@property (nonatomic,retain) UITextField *nameEntered;
@property (nonatomic,retain) UITextField *home;
@property (nonatomic,retain) UITextField *work;
@property (nonatomic,retain) UITextField *cell;

@property (nonatomic,retain) NSString *personalName;
@property (nonatomic,retain) NSMutableArray *phoneNumbers;

-(IBAction)saveData;
-(IBAction)textFieldReturn:(id)textField;
@end


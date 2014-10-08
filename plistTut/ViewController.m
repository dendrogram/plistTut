//
//  ViewController.m
//  plistTut
//
//  Created by Jon Howell on 08/10/2014.
//  Copyright (c) 2014 Manchester Metropolitan University - ESS - essmobile. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    
}

@synthesize name,work,home,cell,personName,phoneNumber;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Data.plist code - get path from root direcory
    NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    // get documents path
    NSString *documentsPath = [paths objectAtIndex:0]; // get the path to our Data/plist file
    NSString *plistPath = [documentsPath
                           stringByAppendingPathComponent:@"Data.plist"];
    // check to see if Data.plist exists in documents
    if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        // if not in documents, get property list from main bundle
        plistPath = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
    }
    // read property list into memory as an NSData object
    NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    // convert static property liost into dictionary object
    NSDictionary *temp = (NSDictionary *)[NSPropertyListSerialization
                                          propertyListFromData:plistXML mutabilityOption:NSPropertyListMutableContainersAndLeaves format:&format errorDescription:&errorDesc];
    if (!temp) {
        NSLog(@"Error reading plist: %@, format: %lu", errorDesc, format);
    }
    // assign values
    self.personName = [temp objectForKey:@"Name"];
    self.phoneNumber = [NSMutableArray arrayWithArray:[temp objectForKey:@"Phone"]];
    // display values
    name.text = personName;
    home.text = [phoneNumber objectAtIndex:0];
    work.text = [phoneNumber objectAtIndex:1];
    cell.text = [phoneNumber objectAtIndex:2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)saveButton:(UIButton *)sender {
        // get paths from root direcory
        NSArray *paths = NSSearchPathForDirectoriesInDomains
        (NSDocumentDirectory, NSUserDomainMask, YES);
        // get documents path
        NSString *documentsPath = [paths objectAtIndex:0]; // get the path to our Data/plist file
        NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"Data.plist"];
        // set the variables to the values in the text fields
        self.personName = name.text;
        self.phoneNumber = [[NSMutableArray alloc] initWithCapacity:3];
        [phoneNumber addObject:home.text];
        [phoneNumber addObject:work.text];
        [phoneNumber addObject:cell.text];
        // create dictionary with values in UITextFields
        NSDictionary *plistDict = [NSDictionary dictionaryWithObjects: [NSArray arrayWithObjects: personName, phoneNumber, nil] forKeys:[NSArray arrayWithObjects: @"Name", @"Phone", nil]];
        NSString *error = nil;
        // create NSData from dictionary
        NSData *plistData = [NSPropertyListSerialization
                             dataFromPropertyList:plistDict format:NSPropertyListXMLFormat_v1_0 errorDescription:&error];
        // check is plistData exists
        if(plistData) {
            // write plistData to our Data.plist file
            [plistData writeToFile:plistPath atomically:YES];
        }
        else
            {
            NSLog(@"Error in saveData: %@", error);
            }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [name resignFirstResponder];
    [work resignFirstResponder];
    [home resignFirstResponder];
    [cell resignFirstResponder];
}

-(IBAction)textFieldReturn:(id)textField{
    
}
@end

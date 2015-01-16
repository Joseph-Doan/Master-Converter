//
//  MasterConverterViewController.h
//  Master Converter
//
//  Created by Joseph Doan on 1/8/15.
//  Copyright (c) 2015 Joseph Doan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterConverterViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *numberTextField;

@property (strong, nonatomic) IBOutlet UITextField *categoryMenuTextField;

@property (strong, nonatomic) IBOutlet UIPickerView *subCategoryPickerView;

@property (strong, nonatomic) IBOutlet UITableView *resultTableView;


- (IBAction)enterButtonPressed:(id)sender;

@end

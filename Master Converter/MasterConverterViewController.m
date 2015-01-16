//
//  MasterConverterViewController.m
//  Master Converter
//
//  Created by Joseph Doan on 1/8/15.
//  Copyright (c) 2015 Joseph Doan. All rights reserved.
//

#import "MasterConverterViewController.h"

@interface MasterConverterViewController ()
{
    NSArray *categoryArray;
    UIPickerView *categoryMenuPickerView;
    UIToolbar *pickerToolBar;
    
    NSArray *categoryUnits;
}

@end

@implementation MasterConverterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Default Category to Area at launch
    self.categoryMenuTextField.text = @"Area";
    
    categoryArray = @[@"Area", @"Length"];
    categoryUnits = @[@"sq cm", @"sq m", @"ha", @"sq km", @"sq mm", @"sq in", @"sq ft", @"sq yd", @"acre"];
    
    self.subCategoryPickerView.delegate = self;
    self.subCategoryPickerView.dataSource = self;
    
    self.categoryMenuTextField.delegate = self;
    
    self.subCategoryPickerView.backgroundColor = [UIColor grayColor];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.subCategoryPickerView selectRow:4 inComponent:0 animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Helper Methods

- (void)showCategoryMenu
{
    categoryMenuPickerView = [[UIPickerView alloc] initWithFrame:CGRectZero];
    categoryMenuPickerView.dataSource = self;
    categoryMenuPickerView.delegate = self;
    
    // Create Done Button
    pickerToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 56)];
    pickerToolBar.barStyle = UIBarStyleBlackOpaque;
    [pickerToolBar sizeToFit];
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [barItems addObject:flexSpace];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pickerDoneClicked)];
    [barItems addObject:doneBtn];
    [pickerToolBar setItems:barItems animated:YES];

    categoryMenuPickerView.showsSelectionIndicator = YES;
    self.categoryMenuTextField.inputView = categoryMenuPickerView;
    self.categoryMenuTextField.inputAccessoryView = pickerToolBar;
    
}

- (void)pickerDoneClicked
{
    [self.categoryMenuTextField resignFirstResponder];
    [self loadCategoryUnitArray];

}

- (void)loadCategoryUnitArray
{
    if ([self.categoryMenuTextField.text isEqualToString:@"Area"]) {
        categoryUnits = @[@"sq cm", @"sq m", @"ha", @"sq km", @"sq mm", @"sq in", @"sq ft", @"sq yd", @"acre"];
    }
}

#pragma mark - UITextField Delegate
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == self.categoryMenuTextField) {
        [self showCategoryMenu];
    }
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - UIPickerView DataSource
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView == self.subCategoryPickerView) {
        return categoryUnits.count;
    } else {
        return categoryArray.count;
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView == self.subCategoryPickerView) {
        return categoryUnits[row];
    } else {
        return categoryArray[row];
    }
}

#pragma mark - UIPickerView Delegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView == categoryMenuPickerView) {
        self.categoryMenuTextField.text = categoryArray[row];
        [categoryMenuPickerView resignFirstResponder];
    }

    
}

- (IBAction)enterButtonPressed:(id)sender {
}
@end

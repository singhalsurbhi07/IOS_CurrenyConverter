//
//  ViewController.h
//  CurrencyConverterIos
//
//  Created by Surbhi on 5/20/14.
//  Copyright (c) 2014 ___SurbhiSinghal___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
@property (strong,nonatomic) IBOutlet UIPickerView *picker;
@property(strong,nonatomic) IBOutlet UILabel* lblOutput;
@property(strong,nonatomic) IBOutlet UILabel* lblOutput1;
@property(strong,nonatomic) IBOutlet UILabel* result;
@property(strong,nonatomic) IBOutlet UITextField* input;


- (IBAction)getResult:(id)sender;
- (IBAction)textFieldReturn:(id)sender;
-(IBAction)backgroundTouched:(id)sender;


@end

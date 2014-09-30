//
//  ViewController.m
//  CurrencyConverterIos
//
//  Created by Surbhi on 5/20/14.
//  Copyright (c) 2014 ___SurbhiSinghal___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
NSArray *countryNames;
float exchangeRates[5];

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    countryNames=[[NSArray alloc]initWithObjects:@"INR",@"USD",@"EUR",@"CNY",@"AED",nil];
    
    _picker.delegate=self;
    _picker.dataSource=self;
    NSURL *url = [NSURL URLWithString:@"https://openexchangerates.org/api/latest.json?app_id=d1b77c0209f74a9cba208556ad685419"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSDictionary *fullResponse = [NSJSONSerialization JSONObjectWithData:data
                                                                      options:0
                                                                        error:NULL];
             NSDictionary *reqDictionary=[fullResponse objectForKey:@"rates"];
             NSLog(@"required value=%@",[reqDictionary objectForKey:(@"AOA")]);
             NSString *val;
             for(int i=0;i<5;i++){
                 switch (i) {
                     case 0:
                         val=[reqDictionary objectForKey:(@"INR") ];
                              
                         break;
                     case 1:
                         val=[reqDictionary objectForKey:(@"USD") ];
                         
                         break;
                     case 2:
                         val=[reqDictionary objectForKey:(@"EUR") ];
                         
                         break;
                     case 3:
                         val=[reqDictionary objectForKey:(@"CNY") ];
                         
                         break;
                     case 4:
                         val=[reqDictionary objectForKey:(@"AED") ];
                         
                         break;
                     default:
                         break;
                 }
                 exchangeRates[i]=[val floatValue];
                 NSLog(@"val=%f",exchangeRates[i]);
             }
             
             
         }
     }];
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
    
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [countryNames count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [countryNames objectAtIndex:row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    switch (component) {
        case 0:
            _lblOutput.text=[countryNames objectAtIndex:row];
            break;
        case 1:
            _lblOutput1.text=[countryNames objectAtIndex:row];
        default:
            break;
    }
}
-(IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}

-(IBAction)getResult:(id)sender{
   // NSString *val1=_lblOutput.text;
    int index1 = [countryNames indexOfObject:_lblOutput.text];
    int index2=[countryNames indexOfObject:_lblOutput1.text];
    NSLog(@"indexes are: %d,%d",index1,index2);
    NSString *inp=_input.text;
    float flinp=[inp floatValue];
    
    float intresult=flinp/exchangeRates[index1];
    float final=intresult*exchangeRates[index2];
    NSString *myString = [NSString stringWithFormat:@"%f %@", final,countryNames[index2]];

    _result.text=myString;
    
    
    
    

}

- (IBAction)backgroundTouched:(id)sender {
    [self.view endEditing:YES];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  TipSplit
//
//  Created by Johnathan Mai on 2/10/16.
//  Copyright © 2016 Johnathan Mai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

    @property (weak, nonatomic) IBOutlet UITextField *textFieldBill;
    @property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControlTax;
    @property (weak, nonatomic) IBOutlet UISwitch *switchTax;
    @property (weak, nonatomic) IBOutlet UISlider *sliderTipAmount;
    @property (weak, nonatomic) IBOutlet UILabel *textTipAmount;
    @property (weak, nonatomic) IBOutlet UILabel *textSplitAmount;
    @property (weak, nonatomic) IBOutlet UIStepper *stepperSplitAmount;
    @property (weak, nonatomic) IBOutlet UILabel *textTotalTax;
    @property (weak, nonatomic) IBOutlet UILabel *textTotalNoTip;
    @property (weak, nonatomic) IBOutlet UILabel *textFinalTip;
    @property (weak, nonatomic) IBOutlet UILabel *textTotalWithTip;
    @property (weak, nonatomic) IBOutlet UILabel *textTotalPerPerson;

@property float billAmount, taxPercent, totalTax, tipPercent, totalAmountForTip, totalTip, billAmountWithTip, totalSplit;
@property int splitNum;
@property bool includeTax;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeValues];
    
}

- (IBAction)billInputed:(id)sender {
    NSString* total = self.textFieldBill.text;
}

- (IBAction)clearAll:(id)sender {
    self.textTipAmount.text = @"15%";
    self.textSplitAmount.text = @"1";
    self.textTotalTax.text = @"0.00";
    self.textTotalNoTip.text = @"0.00";
    self.textFinalTip.text = @"0.00";
    self.textTotalWithTip.text = @"0.00";
    self.textTotalPerPerson.text = @"0.00";
    self.textFieldBill.text = @"";
    
    [self initializeValues];
    [self.segmentedControlTax setSelectedSegmentIndex: 0];
    [self.sliderTipAmount setValue: 15 animated: true];
    [self.stepperSplitAmount setValue: 1];
    [self.switchTax setOn: true animated: true];
}


- (void) initializeValues {
    self.billAmount = 0.0;
    self.taxPercent = 0.075;
    self.totalTax = 0.0;
    self.tipPercent = 0.15;
    self.totalAmountForTip = 0.0;
    self.totalTip = 0.0;
    self.billAmountWithTip = 0.0;
    self.totalSplit = 0.0;
    self.splitNum = 1;
    self.includeTax = true;
    
}

- (IBAction)backgroundTouched:(id)sender {
    [self.textFieldBill resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

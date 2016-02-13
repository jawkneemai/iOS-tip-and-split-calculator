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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  计算器
//
//  Created by wen@yoho on 15/4/9.
//  Copyright (c) 2015年 wen@yoho. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UILabel *label;
    double leftNum;

    double resNum;
    NSString *op;
  
    BOOL isOp;
    BOOL isFloat;
    
    Operation _currentOper;
    
}


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createPage];
    
    isOp = NO;
    isFloat = NO;

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)createPage
{
    label = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, self.view.bounds.size.width, 150)];
    label.text = @"0";
    label.textAlignment = NSTextAlignmentRight;
    label.font = [UIFont fontWithName:@"Arial" size:50];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor grayColor];
    [self.view addSubview:label];
    
    NSArray *array = @[@"AC", @"+/-", @"%", @"÷", @"7", @"8", @"9", @"*", @"4", @"5", @"6", @"-", @"1", @"2", @"3", @"+", @"0", @".", @"="];
    float width = self.view.bounds.size.width/4;
    float height = (self.view.bounds.size.height - 30 - 150)/5;
    float originX = 0;
    int i = 0;
    for (NSString *str in array)
    {
        if ([str isEqualToString:@"0"])
        {
            width = width * 2;
        }
        else
        {
            width = self.view.bounds.size.width/4;
        }
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(originX, 180 + (height * (i / 4)), width, height)];
        [btn setTitle:str forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:20.0];
        btn.layer.borderWidth = 0.5;
        btn.layer.borderColor = [UIColor blackColor].CGColor;
        
        if ([str isEqualToString:@"AC"] || [str isEqualToString:@"+/-"] ||  [str isEqualToString:@"%"] )
        {
            btn.backgroundColor = [UIColor lightGrayColor];
        }
        else
            if ([str isEqualToString:@"÷"] || [str isEqualToString:@"*"] ||  [str isEqualToString:@"-"] ||  [str isEqualToString:@"+"] ||  [str isEqualToString:@"="] )
            {
                btn.backgroundColor = [UIColor orangeColor];
            }
        
        [btn addTarget:self action:@selector(onBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
        i++;
        if(i%4)
        {
            originX += width;
        }
        else
        {
            originX = 0;
        }
    }
  
}

- (void)onBtnClick:(UIButton *)sender
{
    NSString *str = sender.titleLabel.text;
    if ([str isEqualToString:@"AC"])
    {
        [self clearNum];
        return;
    }
    else if ([str isEqualToString:@"+/-"])
    {
        [self revNum];
        return;
    }
    else if ([str isEqualToString:@"%"])
    {
        [self perNum];
        return;
    }
    else if ([str isEqualToString:@"="])
    {
        [self performResNum];
        return;
    }
    else if ([str isEqualToString:@"+"] || [str isEqualToString:@"-"] || [str isEqualToString:@"*"] || [str isEqualToString:@"÷"])
    {
        if (![op isEqualToString:@""]) {
            [self performResNum];
        }
        op = str;
        label.text = @"0";
        return;
    }
    else
    {
        [self showNum:str];
        return;
    }

}

- (void)clearNum
{
    label.text = @"0";
    
    leftNum = 0;
    resNum = 0;
    op = @"";
    
    isFloat = NO;
    isOp = NO;
}

- (void)revNum
{
    float num = [label.text floatValue];
    if (num == 0) {
        return;
    }
    if (num < 0) {
        label.text = [label.text substringFromIndex:1];
    }
    else
    {
        label.text = [NSString stringWithFormat:@"-%@",label.text];
    }
}

-(void)perNum
{
    
}

- (void)performResNum
{
    
}

- (void)showNum:(NSString *)num
{
    if ([num isEqualToString:@"."] && isFloat) {
        return;
    }
    if ([num isEqualToString:@"."]) {
        isFloat = YES;
    }
    if (isFloat) {
        label.text = [label.text stringByAppendingString:num];
        return;
    }
    if ([label.text floatValue] == 0) {
        if (isFloat) {
            label.text = @"0.";
        }
        else
        {
            label.text = num;
        }
    }
    else
    {
        label.text = [label.text stringByAppendingString:num];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  GraphMottainaiViewController.m
//  MOTTAINAI
//
//  Created by Kouki Saito on 2014/05/18.
//  Copyright (c) 2014年 Kouki. All rights reserved.
//

#import "GraphMottainaiViewController.h"

@interface GraphMottainaiViewController ()

@end

@implementation GraphMottainaiViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)viewWillAppear:(BOOL)animated
{
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    self.mottainai = [appDelegate getAllMottainai];

    /* 集計関数の使い方がわからないからループで集計 */
    // TODO
   



    
    PNLineChart *lineChart = [[PNLineChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_WIDTH, 200.0)];
    [lineChart setXLabels:@[@"４日前",@"一昨日",@"昨日",@"今日"]];
     
    NSArray * data01Array = @[@60.1, @160.1, @126.4, @262.2];
    PNLineChartData *data01 = [PNLineChartData new];
    data01.color = PNFreshGreen;
    data01.itemCount = lineChart.xLabels.count;
    data01.getData = ^(NSUInteger index) {
        CGFloat yValue = [data01Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };

    lineChart.chartData = @[data01];
    [lineChart strokeChart];
    
    [self.view addSubview:lineChart];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

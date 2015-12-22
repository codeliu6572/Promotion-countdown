//
//  ViewController.m
//  促销倒计时
//
//  Created by yons on 15/4/30.
//  Copyright (c) 2015年 yons. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    int _time;
    NSString *_count;
    int count;
    UILabel *_day;
    UILabel *_hour;
    UILabel *_minute;
    UILabel *_second;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //多线程读秒操作(可以加在button里控制)
//    [self performSelectorInBackground:@selector(thread) withObject:nil];
    [self performSelectorInBackground:@selector(thread1) withObject:nil];
    
    _time=259200;
    
    
    
    _day=[[UILabel alloc]initWithFrame:CGRectMake(20, 200, 70, 40)];
    _day.backgroundColor=[UIColor redColor];
    _day.textAlignment=NSTextAlignmentCenter;
    _day.font=[UIFont systemFontOfSize:20];
    _day.text=[NSString stringWithFormat:@"%.2d",_time/(24*60*60)];
    [self.view addSubview:_day];
    
    _hour=[[UILabel alloc]initWithFrame:CGRectMake(90, 200, 70, 40)];
    _hour.backgroundColor=[UIColor orangeColor];
    _hour.textAlignment=NSTextAlignmentCenter;
    _hour.font=[UIFont systemFontOfSize:20];
    _hour.text=[NSString stringWithFormat:@"%.2d",_time%(24*60*60)/(60*60)];
    [self.view addSubview:_hour];
    
    _minute=[[UILabel alloc]initWithFrame:CGRectMake(160, 200, 70, 40)];
    _minute.backgroundColor=[UIColor yellowColor];
    _minute.textAlignment=NSTextAlignmentCenter;
    _minute.font=[UIFont systemFontOfSize:20];
    _minute.text=[NSString stringWithFormat:@"%.2d",_time%(24*60*60)%(60*60)/60];
    [self.view addSubview:_minute];
    
    _second=[[UILabel alloc]initWithFrame:CGRectMake(230, 200, 70, 40)];
    _second.backgroundColor=[UIColor blueColor];
    _second.textAlignment=NSTextAlignmentCenter;
    _second.font=[UIFont systemFontOfSize:20];
    _second.text=[NSString stringWithFormat:@"%.2d",_time%(24*60*60)%(60*60)%60];
    [self.view addSubview:_second];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//// 在异步线程中无法操作UI，如果想要操作UI必须回调主线程
//- (void)thread
//{
//    for(int i=59;i>=0;i--)
//    {
//        _time--;
//
//        _count = [NSString stringWithFormat:@"%.2d",i];
//
//        // 回调主线程
//        [self performSelectorOnMainThread:@selector(mainThread) withObject:nil waitUntilDone:YES];
//
//        sleep(1);
//        if (i==0) {
//            i=60;
//        }
//
//    }
//}
// 在异步线程中无法操作UI，如果想要操作UI必须回调主线程
- (void)thread1
{
    for(int i=_time;i>=0;i--)
    {
        
        count=i;
        // 回调主线程
        [self performSelectorOnMainThread:@selector(mainThread1) withObject:nil waitUntilDone:YES];
        
        sleep(1);
        if (i==0) {
            //倒计时结束后
        }
        
    }
}
//// 此函数主线程执行
//- (void)mainThread
//{
//    _day.text=[NSString stringWithFormat:@"%.2d 天",_time/(24*60*60)];
//    _hour.text=[NSString stringWithFormat:@"%.2d 时",_time%(24*60*60)/(60*60)];
//    _minute.text=[NSString stringWithFormat:@"%.2d 分",_time%(24*60*60)%(60*60)/60];
//    _second.text=[NSString stringWithFormat:@"%@ 秒",_count];
//
//    if (_time==0) {
//        
//    }
//}
// 此函数主线程执行
- (void)mainThread1
{
    _day.text=[NSString stringWithFormat:@"%.2d 天",count/(24*60*60)];
    _hour.text=[NSString stringWithFormat:@"%.2d 时",count%(24*60*60)/(60*60)];
    _minute.text=[NSString stringWithFormat:@"%.2d 分",count%(24*60*60)%(60*60)/60];
    _second.text=[NSString stringWithFormat:@"%.2d 秒",count%(24*60*60)%(60*60)%60];

    if (_time==0) {
        
    }
}
@end

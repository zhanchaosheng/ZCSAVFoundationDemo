//
//  ViewController.m
//  ZCSAVFoundationDemo
//
//  Created by Cusen on 16/7/7.
//  Copyright © 2016年 Cusen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *demoTitles;
@property (nonatomic, strong) NSArray *demoSubTitle;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"AV Foundation";
    
    [self initSubView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initSubView {
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.demoTitles = @[@"音频的播放与录制",
                        @"视频播放",
                        @"AV Kit",
                        @"捕捉媒体"];
    self.demoSubTitle = @[@"AVAudioPlayer & AVAudioRecorder",
                          @"AVPlayer+AVPlayerLayer+AVPlayerItem",
                          @"AVPlayerViewController",
                          @"AVCaptureSession"];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.demoTitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = self.demoTitles[indexPath.row];
    cell.detailTextLabel.text = self.demoSubTitle[indexPath.row];
    return cell;
}
@end

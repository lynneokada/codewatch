//
//  ViewController.m
//  barcodeScanner
//
//  Created by Lynne Okada on 11/23/14.
//  Copyright (c) 2014 Lynne Okada. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    AVCaptureSession *captureSession;
    AVCaptureDevice *captureDevice;
    AVCaptureDeviceInput *deviceInput;
    AVCaptureMetadataOutput *metadataOutput;
    AVCaptureVideoPreviewLayer *previewLayer;
    
    UIView *highlightView;
    UILabel *label;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    highlightView = [[UIView alloc] init];
    highlightView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin;
    highlightView.layer.borderColor = [UIColor greenColor].CGColor;
    highlightView.layer.borderWidth = 3;
    [self.view addSubview:highlightView];
    
    label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, self.view.bounds.size.height - 40, self.view.bounds.size.width, 40);
    label.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    label.backgroundColor = [UIColor colorWithWhite:0.15 alpha:0.65];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"(none)";
    [self.view addSubview:label];
    
    captureSession = [[AVCaptureSession alloc] init];
    captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error = nil;
    
    deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:&error];
    if (deviceInput)
    {
        [captureSession addInput:deviceInput];
    } else {
        NSLog(@"ERROR: %@", error);
    }
    
    metadataOutput = [[AVCaptureMetadataOutput alloc] init];
    [metadataOutput setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    [captureSession addOutput:metadataOutput];
    
    metadataOutput.metadataObjectTypes = [metadataOutput availableMetadataObjectTypes];
    
    previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:captureSession];
    previewLayer.frame = self.view.bounds;
    previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [self.view.layer addSublayer:previewLayer];
    
    [captureSession startRunning];
    
    [self.view bringSubviewToFront:highlightView];
    [self.view bringSubviewToFront:label];
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    CGRect highlightRect = CGRectZero;
    AVMetadataMachineReadableCodeObject *barCodeObject;
    NSString *detectionString = nil;
    NSArray *barcodeTypes = @[AVMetadataObjectTypeUPCECode, AVMetadataObjectTypeCode39Code, AVMetadataObjectTypeCode39Mod43Code,
                              AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode93Code, AVMetadataObjectTypeCode128Code,
                              AVMetadataObjectTypePDF417Code, AVMetadataObjectTypeQRCode, AVMetadataObjectTypeAztecCode];
    
    for (AVMetadataObject *metadata in metadataObjects)
    {
        for (NSString *type in barcodeTypes)
        {
            if ([metadata.type isEqualToString:type])
            {
                barCodeObject = (AVMetadataMachineReadableCodeObject *)[previewLayer transformedMetadataObjectForMetadataObject:(AVMetadataMachineReadableCodeObject *)metadata];
                highlightRect = barCodeObject.bounds;
                detectionString = [(AVMetadataMachineReadableCodeObject *)metadata stringValue];
                break;
            }
        }
        if (detectionString != nil)
        {
            label.text = detectionString;
            break;
        }
        else
            label.text = @"(none)";
    }
    
    highlightView.frame = highlightRect;
}


@end

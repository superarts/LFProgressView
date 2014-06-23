# LFProgressView

Some additional properties have been added to draw something like this:

https://www.dropbox.com/s/dmyebdgkx8zb1j9/Screenshot%202014-06-13%2012.21.35.png

Since 1.3.2 more appearance are added:

```
	//	appearance
	[[LFProgressView appearance] setFlat:@YES];
	[[LFProgressView appearance] setShowStroke:@NO];
	[[LFProgressView appearance] setShowBackground:@YES];
	[[LFProgressView appearance] setShowBackgroundInnerShadow:@NO];
	[[LFProgressView appearance] setOuterStrokeWidth:@0];
	[[LFProgressView appearance] setProgressInset:@-1];
	[[LFProgressView appearance] setBorderRadius:@0];

	//	LFProgressView 1.3.2
	[[LFProgressView appearance] setTextColor:[UIColor whiteColor]];
	[[LFProgressView appearance] setTextAlignment:@(NSTextAlignmentLeft)];
	[[LFProgressView appearance] setShowTextShadow:@(YES)];
	[[LFProgressView appearance] setShowTextAlways:@(YES)];
	[[LFProgressView appearance] setFont:[UIFont fontWithName:@"Ubuntu-Bold" size:11]];
	[[LFProgressView appearance] setBackground:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.50f]];
	[[LFProgressView appearance] setStripeWidth:@(10)];
	[[LFProgressView appearance] setStripeSlope:@(2)];
```

Below 1.3.1

With these additional code:

```
		progress1.textAlignment = NSTextAlignmentLeft;
		progress1.textColor = [UIColor whiteColor];
		progress1.showTextShadow = YES;
		progress1.font = [UIFont fontWithName:@"Ubuntu-Bold" size:11.5];
		progress1.background = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.50f];
		progress1.stripeWidth = 10;
		progress1.stripeSlope = 2;
```

The other code works for the original LDProgressView:

```
		LDProgressView* progress1 = [[LDProgressView alloc] initWithFrame:CGRectMake(20, 41, self.view.frame.size.width-40, 20)];
		progress1.flat = @YES;
		progress1.showStroke = @NO;
		progress1.showBackground = @YES;
		progress1.showBackgroundInnerShadow = @NO;
		progress1.outerStrokeWidth = @0;
		progress1.progressInset = @-1;
		progress1.progress = 0.40;
		progress1.labelProgress = 0.0;
		progress1.borderRadius = @0;
		progress1.type = LDProgressStripes;
		progress1.color = [UIColor orangeColor];

		[progress1 overrideProgressText:@"test1"];
		[subview addSubview:progress1];
```

Please check the message below for LDProgressView.

----

LDProgressView (v. 1.2)
==============

[![Build Status](https://travis-ci.org/lightdesign/LDProgressView.png)](https://travis-ci.org/lightdesign/LDProgressView)

A flat or gradient progress view with a simple color setter and customizable options written in pure Core Graphics.

![LDProgressView](https://cloud.githubusercontent.com/assets/634167/2581587/56ce8420-b9ba-11e3-882d-a80c3f00ee1e.gif)

# Changelog

### Version 1.2.1 released! (3/14/2014)
* Allow custom override of progress text
* Allow disabling inner shadow using `showBackgroundInnerShadow` property
* Allows changing animation flag that will be applied on next progress change

### Version 1.2 (12/05/2013)
* You can now create an outline progress view through the following properties.
* New property: `showBackground`
* New property: `progressInset`
* New property: `outerStrokeWidth`
* New property: `showStroke`

### Version 1.1 (10/11/2013)
* New property: `borderRadius`
* New progress fill types: `LDProgressStripes` & `LDProgressGradient`

### Version 1.0 (09/30/2013)
* Initial release

# Install

## Manually
Download the zip of the project and put the classes `LDProgressView` and `UIColor+RGBValues` in your project. Then simply import "LDProgressView.h" in the file(s) you would like to use it in.

## CocoaPods
Add this to your Podfile: ```pod 'LDProgressView', '>= 1.1'```

To learn more about CocoaPods, please visit their [website](http://cocoapods.org).

# How To Use

Here are the examples as seen in the screenshot above:

```objc
// default color, animated
LDProgressView *progressView = [[LDProgressView alloc] initWithFrame:CGRectMake(20, 130, self.view.frame.size.width-40, 22)];
progressView.progress = 0.40;
[self.progressViews addObject:progressView];
[self.view addSubview:progressView];

// flat, green, animated
progressView = [[LDProgressView alloc] initWithFrame:CGRectMake(20, 160, self.view.frame.size.width-40, 22)];
progressView.color = [UIColor colorWithRed:0.00f green:0.64f blue:0.00f alpha:1.00f];
progressView.flat = @YES;
progressView.progress = 0.40;
progressView.animate = @YES;
[self.progressViews addObject:progressView];
[self.view addSubview:progressView];

// progress gradient, red, animated
progressView = [[LDProgressView alloc] initWithFrame:CGRectMake(20, 190, self.view.frame.size.width-40, 22)];
progressView.color = [UIColor colorWithRed:0.73f green:0.10f blue:0.00f alpha:1.00f];
progressView.progress = 0.40;
progressView.animate = @YES;
progressView.type = LDProgressGradient;
progressView.background = [progressView.color colorWithAlphaComponent:0.8];
[self.progressViews addObject:progressView];
[self.view addSubview:progressView];

// solid style, default color, not animated, no text, less border radius
progressView = [[LDProgressView alloc] initWithFrame:CGRectMake(20, 220, self.view.frame.size.width-40, 22)];
progressView.showText = @NO;
progressView.progress = 0.40;
progressView.borderRadius = @5;
progressView.type = LDProgressSolid;
[self.progressViews addObject:progressView];
[self.view addSubview:progressView];

// stripe style, no border radius, default color, not animated
progressView = [[LDProgressView alloc] initWithFrame:CGRectMake(20, 250, self.view.frame.size.width-40, 22)];
progressView.progress = 0.40;
progressView.borderRadius = @0;
progressView.type = LDProgressStripes;
progressView.color = [UIColor orangeColor];
[self.progressViews addObject:progressView];
[self.view addSubview:progressView];

```

You can also configure every LDProgressView using the UIAppearence protocol, which can be done in your app delegate. Here's a sample of this type of configuration:

```objc
[[LDProgressView appearance] setColor:[UIColor purpleColor]];
[[LDProgressView appearance] setBackground:[UIColor redColor]];
[[LDProgressView appearance] setFlat:@YES];
[[LDProgressView appearance] setAnimate:@YES];
[[LDProgressView appearance] setShowStroke:@YES];
[[LDProgressView appearance] setBorderRadius:@5];
[[LDProgressView appearance] setOuterStrokeWidth:@3];
[[LDProgressView appearance] setShowBackground:@NO];
[[LDProgressView appearance] setProgressInset:@5];
```

# License (MIT)

Copyright (C) 2013 Light Design <lightdesigncoding@icloud.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/lightdesign/ldprogressview/trend.png)](https://bitdeli.com/free "Bitdeli Badge")


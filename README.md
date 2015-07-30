Perl bindings for Upwork API
============

[![License](http://img.shields.io/packagist/l/upwork/perl-upwork.svg)](http://www.apache.org/licenses/LICENSE-2.0.html)
[![Build Status](https://travis-ci.org/upwork/perl-upwork.svg)](https://travis-ci.org/upwork/perl-upwork)
[![Latest Stable Version](https://poser.pugx.org/upwork/perl-upwork/v/stable.svg)](https://github.com/upwork/perl-upwork/releases)
[![Monthly downloads](http://img.shields.io/packagist/dm/upwork/perl-upwork.svg)](https://packagist.org/packages/upwork/perl-upwork)

# Introduction
This project provides a set of resources of Upwork API from http://developers.upwork.com
 based on OAuth 1.0a.

# Features
These are the supported API resources:

* My Info
* Custom Payments
* Hiring
* Job and Freelancer Profile
* Search Jobs and Freelancers
* Organization
* MC
* Time and Financial Reporting
* Metadata
* Snapshot
* Team
* Workd Diary
* Activities

# License

Copyright 2015 Upwork Corporation. All Rights Reserved.

perl-upwork is licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

## SLA
The usage of this API is ruled by the Terms of Use at:

    https://developers.upwork.com/api-tos.html

# Application Integration
To integrate this library you need to have:

* Perl >= 5.008003
* CPAN

## Example
In addition to this, a full example is available in the `example` directory. 
This includes `myapp.pl` that gets an access token and requests the data
for applications that are not web-based applications.

## Installation
1.
Start `cpan`

2.
Run the following command to install API:
```
cpan> install Net::Upwork::API
```

3.
open `myapp.pl` and type the consumerKey and consumerSecret that you previously got from the API Center.
***That's all. Run your app as `perl myapp.pl` and have fun.***

# barkibu_test

A test project for barkibu based on the following requirements:
https://public.3.basecamp.com/p/NjeXKfVTEg1jNb5mkzEgDtM3

I used this API https://cataas.com/ for demo purposes.

## Getting Started

To test this project you need to implement test backend environment. 
I decided that fastest way to do it you can use AWS Lambda and API Gateway.

### Prerequisites

AWS account with access to Lambda and API Gateway services.
Installed Flutter SDK.

### Installing
0. If you want to test it with ready backend you can miss steps 1-5.
1. Create new Lambda function with any name you want.
2. Copy content of lambda_function.py to your lambda function or copy from here:
``` python 
import urllib3
import json 

def lambda_handler(event, context):
    http = urllib3.PoolManager()
    cats = http.request('GET', 'https://cataas.com/api/cats?tags=cute&limit=10')
    if cats.status == 200:
        return {
            'statusCode': 200,
            'body': json.loads(cats.data.decode('utf-8'))
        }
    else:
        return {
            'statusCode': 400,
            'body': 'Unknown error of API'
        }
```
3. Create new API Gateway with any name you want.
4. Create new GET method for your API Gateway.
5. Deploy your API Gateway and test it with Lambda function.
6. Copy Function URL from your Lambda function and paste it to your file /lib/repositories/cat_repository.dart to the variable endpoint on line 6.
7. Copy this repo to your local machine.
8. Run ```flutter pub get``` to install all dependencies.
9. Run ```flutter test``` to test the project with unit and widget tests.
10. Run ```flutter run``` to run the project on your device or emulator or usr IDE to run it.

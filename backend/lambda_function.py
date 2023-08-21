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
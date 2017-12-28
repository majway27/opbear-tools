from __future__ import print_function

import boto3
import json
import os
import time

cfDistributionId = os.environ['DISTRIBUTION_ID_VAR']
executionEnviroment = os.environ['EXECUTION_ENVIRONMENT_VAR']
snsArn = os.environ['SNS_ARN_VAR']


def lambda_handler(event, context):
    path = []
    for items in event["Records"]:
        if items["s3"]["object"]["key"] == "index.html":
            path.append("/")
        else:
            path.append("/" + items["s3"]["object"]["key"])
    print(path)
    cf_client = boto3.client('cloudfront')
    invalidation = cf_client.create_invalidation(DistributionId=cfDistributionId,
                                                 InvalidationBatch={
                                                     'Paths': {
                                                         'Quantity': 1,
                                                         'Items': path
                                                     },
                                                     'CallerReference': str(time.time())
                                                 })

    message = {"Build": "Complete", "Environment": executionEnviroment}
    message_client = boto3.client('sns')
    response = message_client.publish(
        TargetArn=snsArn,
        Message=json.dumps({'default': json.dumps(message)}),
        MessageStructure='json'
    )
import json
import boto3
import os

# AWS Clients
s3 = boto3.client("s3")
ses = boto3.client("ses")

# Email Configuration
SENDER = os.environ["SENDER_EMAIL"]
RECIPIENT = os.environ["RECIPIENT_EMAIL"]
SUBJECT = "Terraform State File Updated"

def lambda_handler(event, context):
    # Get S3 bucket and object key from the event
    bucket = event['Records'][0]['s3']['bucket']['name']
    key = event['Records'][0]['s3']['object']['key']
    
    # Send an SES email notification
    email_body = f"Terraform state file '{key}' was updated in S3 bucket '{bucket}'."

    response = ses.send_email(
        Source=SENDER,
        Destination={"ToAddresses": [RECIPIENT]},
        Message={
            "Subject": {"Data": SUBJECT},
            "Body": {"Text": {"Data": email_body}},
        }
    )
    
    return {"statusCode": 200, "body": json.dumps("Email sent!")}

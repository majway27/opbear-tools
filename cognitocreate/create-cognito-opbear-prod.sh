#aws cognito-identity create-identity-pool --identity-pool-name opbear_idp_prod --allow-unauthenticated-identities --region us-west-2
#    "IdentityPoolId": "us-west-2:d6c67817-738c-43c5-a5eb-63bf9cd2934d", 
#    "AllowUnauthenticatedIdentities": true, 
#    "IdentityPoolName": "opbear_idp_prod"

#aws cognito-idp create-user-pool --pool-name opbear-prod --auto-verified-attributes email --policies file://user-pool-policy.json --region us-west-2
#   us-west-2_d1xMEfr8Z

#aws cognito-idp create-user-pool-client --user-pool-id us-west-2_d1xMEfr8Z --no-generate-secret --client-name webapp --region us-west-2
#    "UserPoolClient": {
#        "UserPoolId": "us-west-2_d1xMEfr8Z", 
#        "LastModifiedDate": 1513959016.485, 
#        "ClientId": "7i92i8k35jbfh0hqnrjs42rrak", 
#        "AllowedOAuthFlowsUserPoolClient": false, 
#        "RefreshTokenValidity": 30, 
#        "CreationDate": 1513959016.485, 
#        "ClientName": "webapp"

#aws cognito-identity update-identity-pool --allow-unauthenticated-identities --identity-pool-id us-west-2:d6c67817-738c-43c5-a5eb-63bf9cd2934d --identity-pool-name opbear_idp_prod --cognito-identity-providers ProviderName=cognito-idp.us-west-2.amazonaws.com/us-west-2_d1xMEfr8Z,ClientId=7i92i8k35jbfh0hqnrjs42rrak --region us-west-2
#    "IdentityPoolId": "us-west-2:d6c67817-738c-43c5-a5eb-63bf9cd2934d", 
#    "AllowUnauthenticatedIdentities": true, 
#    "CognitoIdentityProviders": [
#        {
#            "ServerSideTokenCheck": false, 
#            "ClientId": "7i92i8k35jbfh0hqnrjs42rrak", 
#            "ProviderName": "cognito-idp.us-west-2.amazonaws.com/us-west-2_d1xMEfr8Z"
#        }
#    ], 
#    "IdentityPoolName": "opbear_idp_prod"



# Links user pools with IAM roles to allow certain actions directly against AWS resources
# This can also be set in the gui as long as the IAM roles exist.
# * See unauthrole.json and authrole.json in cwd
##aws cognito-identity set-identity-pool-roles --identity-pool-id us-west-2:a0af11bf-8372-4f97-bae3-0eb192f4da67 --roles authenticated=$AUTH_ROLE_ARN,unauthenticated=$UNAUTH_ROLE_ARN --region us-west-2
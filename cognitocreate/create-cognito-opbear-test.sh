#aws cognito-identity create-identity-pool --identity-pool-name opbear_idp_test --allow-unauthenticated-identities --region us-west-2
#   "IdentityPoolId": "us-west-2:a0af11bf-8372-4f97-bae3-0eb192f4da67", 
#   "AllowUnauthenticatedIdentities": true, 
#   "IdentityPoolName": "opbear_idp_test"
#aws cognito-idp create-user-pool --pool-name opbear-test --auto-verified-attributes email --policies file://user-pool-policy.json --region us-west-2
#   us-west-2_3O2OnecGV
#aws cognito-idp create-user-pool-client --user-pool-id us-west-2_3O2OnecGV --no-generate-secret --client-name webapp --region us-west-2
# "UserPoolClient": {
#       "UserPoolId": "us-west-2_3O2OnecGV", 
#        "LastModifiedDate": 1513957921.418, 
#        "ClientId": "5kush4n96v69b64phcgeu31j2g", 
#        "AllowedOAuthFlowsUserPoolClient": false, 
#        "RefreshTokenValidity": 30, 
#        "CreationDate": 1513957921.418, 
#        "ClientName": "webapp"
#aws cognito-identity update-identity-pool --allow-unauthenticated-identities --identity-pool-id us-west-2:a0af11bf-8372-4f97-bae3-0eb192f4da67 --identity-pool-name opbear_idp_test --cognito-identity-providers ProviderName=cognito-idp.us-west-2.amazonaws.com/us-west-2_3O2OnecGV,ClientId=5kush4n96v69b64phcgeu31j2g --region us-west-2
#    "IdentityPoolId": "us-west-2:a0af11bf-8372-4f97-bae3-0eb192f4da67", 
#    "AllowUnauthenticatedIdentities": true, 
#    "CognitoIdentityProviders": [
#        {
#            "ServerSideTokenCheck": false, 
#            "ClientId": "5kush4n96v69b64phcgeu31j2g", 
#            "ProviderName": "cognito-idp.us-west-2.amazonaws.com/us-west-2_3O2OnecGV"
#        }
#    ], 
#    "IdentityPoolName": "opbear_idp_test"



# Links user pools with IAM roles to allow certain actions directly against AWS resources
# This can also be set in the gui as long as the IAM roles exist.
# * See unauthrole.json and authrole.json in cwd
##aws cognito-identity set-identity-pool-roles --identity-pool-id us-west-2:a0af11bf-8372-4f97-bae3-0eb192f4da67 --roles authenticated=$AUTH_ROLE_ARN,unauthenticated=$UNAUTH_ROLE_ARN --region us-west-2
aws cloudformation create-stack --stack-name MyFistCftEC2Stack02 --template-body file://aws-create-ec2.yaml
# {
#     "StackId": "arn:aws:cloudformation:ap-south-1:432974808028:stack/MyFistCftEC2Stack02/0639e240-64bf-11eb-a721-060255f00116"
# }


aws cloudformation describe-stacks --stack-name MyFistCftEC2Stack02
# {
#     "Stacks": [
#         {
#             "StackId": "arn:aws:cloudformation:ap-south-1:432974808028:stack/MyFistCftEC2Stack02/0639e240-64bf-11eb-a721-060255f00116",
#             "StackName": "MyFistCftEC2Stack02",
#             "Description": "Sample Template to create an EC2 Instance",
#             "Parameters": [
#                 {
#                     "ParameterKey": "InstanceType",
#                     "ParameterValue": "t2.micro"
#                 }
#             ],
#             "CreationTime": "2021-02-01T18:55:17.157000+00:00",
#             "RollbackConfiguration": {},
#             "StackStatus": "CREATE_COMPLETE",
#             "DisableRollback": false,
#             "NotificationARNs": [],
#             "Outputs": [
#                 {
#                     "OutputKey": "PublicIPAdd",
#                     "OutputValue": "65.0.93.44",
#                     "Description": "Public IP Addr of the EC2 Instance"
#                 },
#                 {
#                     "OutputKey": "InstanceId",
#                     "OutputValue": "i-0ea3a0a0217343933",
#                     "Description": "Instance Id of the EC2 Instance"
#                 },
#                 {
#                     "OutputKey": "PublicDNS",
#                     "OutputValue": "ec2-65-0-93-44.ap-south-1.compute.amazonaws.com",
#                     "Description": "Public DNS Name of the EC2 Instance"
#                 }
#             ],
#             "Tags": [],
#             "EnableTerminationProtection": false,
#             "DriftInformation": {
#                 "StackDriftStatus": "NOT_CHECKED"
#             }
#         }
#     ]
# }

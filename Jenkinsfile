pipeline {
    agent any
    parameters { 
        choice(name: 'Branch', choices: ["main", "develop"])
    }
    environment {
        AMZ_HOME="%ProgramFiles(x86)%\\Amazon"
        AWS_DEFAULT_REGION="ap-south-1"
        AWS_PROFILE="jenkins-user"
        PATH="${AMZ_HOME}\\AWSCLIV2;${PATH}"
    }
    stages {
        stage('Clone sources') {
            steps {
                git url: 'git@github.com:VargheseVibin/aws-cloud-formation.git',
                credentialsId: 'VargheseVibin',
                branch: 'main'
            }
        }
        stage('Check AWS CLI Install') {
            steps {
                bat 'call aws --version'
            }
        }
        stage('Set Profile & List Configs') {
            steps {
                withCredentials([[  $class: 'UsernamePasswordMultiBinding', 
                                    credentialsId: 'AWS-Account-Jenkins-User-Key', 
                                    usernameVariable: 'AWS_ACCESS_KEY_ID', 
                                    passwordVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    bat 'call aws configure set --profile=%AWS_PROFILE% aws_access_key_id %AWS_ACCESS_KEY_ID%'
                    bat 'call aws configure set --profile=%AWS_PROFILE% aws_secret_access_key %AWS_SECRET_ACCESS_KEY%'
                    bat 'echo AWS_ACCESS_KEY_ID:%AWS_ACCESS_KEY_ID%'
                    bat 'call aws configure set --profile=%AWS_PROFILE% default.region %AWS_DEFAULT_REGION%'
                    bat 'call aws configure list --profile=%AWS_PROFILE%'
                }
            }
        }
        stage('Create EC2 Instance from yaml Script') {
            steps {
                bat 'call aws cloudformation create-stack --stack-name MyFistCftEC2Stack02 --template-body file://aws-create-ec2.yaml --profile %AWS_PROFILE%'
            }
        }
        stage('Validate Stack Creation') {
            steps {
                bat 'call aws cloudformation describe-stacks --stack-name MyFistCftEC2Stack02 --profile %AWS_PROFILE%'
            }
        }
    }
}


export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
export AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}
export AWS_DEFAULT_OUTPUT=${AWS_DEFAULT_OUTPUT}
            
#ECR_LOGIN_STRING=`aws ecr get-login --region ${AWS_DEFAULT_REGION} --no-include-email`
aws ecr get-login --no-include-momnhuong@gmail.com --region ap-southeast-1 
aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin 709026135780.dkr.ecr.ap-southeast-1.amazonaws.com/nodejs

#eval ${ECR_LOGIN_STRING}
docker push ${ECR_REPO}:${BUILD_ID}

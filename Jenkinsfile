
pipeline {
   
   agent { label 'node1' }
   
   environment { 
	   
	//DOCKER_IMAGE = 'nodejs/app'
	//disable old jenkins jobs
	// final test
	DOCKER_IMAGE = 'nodejs'
	   
	//ECR_REPO = '709026135780.dkr.ecr.ap-southeast-1.amazonaws.com/nodejs'
	
	APP_VERSION = "${BUILD_ID}"
        APP_ENV = "${BRANCH_NAME}"
   
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
	AWS_DEFAULT_REGION    = 'ap-southeast-1'
	//AWS_DEFAULT_REGION    = 'us-east-1'
	AWS_DEFAULT_OUTPUT    = 'json'
	   
	//ECR_REPO = '709026135780.dkr.ecr.' + ${AWS_DEFAULT_REGION} + '.amazonaws.com/nodejs'
	//ECR_REPO = '709026135780.dkr.ecr.us-east-1.amazonaws.com/nodejs'
	 ECR_REPO = '709026135780.dkr.ecr.ap-southeast-1.amazonaws.com/nodejs'
	   
	STAGING_TASK    = 'nodejs-staging-task'
	STAGING_CLUSTER = 'nodejs-staging-cluster1'
	STAGING_SERVICE = 'nodejs-staging-srv'
	   
	RELEASE_TASK    = 'nodejs-release-task'
	RELEASE_CLUSTER = 'nodejs-release-cluster'
	RELEASE_SERVICE = 'nodejs-release-srv'
   }

   stages {

      stage('[NODEJS] Build') {
         steps {
            echo '****** Build app ******'
	    sh 'chmod +x ./jenkins/build.sh' 
            sh './jenkins/build.sh'
         }
      }
      
      stage('[NODEJS] Push to ECR') {
         steps {
            echo '****** Push docker image to ECR ******'
	    sh 'chmod +x ./jenkins/push.sh' 	 
            sh './jenkins/push.sh'
         }
      }
      
      stage('[NODEJS] Deploy to staging') {
            when {
                branch 'staging' 
	    }
            steps {
		echo "****** Deploy to ${BRANCH_NAME} branch ******"
           sh 'chmod +x ./jenkins/deploy_staging.sh' 
           sh './jenkins/deploy_staging.sh'
            }
        }
      stage('[NODEJS] Deploy to production') {
           when {
                branch 'release' 
            }
            steps {
		echo "****** Deploy to ${BRANCH_NAME} branch ******"
            sh 'chmod +x ./jenkins/deploy_release.sh'    
            sh './jenkins/deploy_release.sh'
            }
        }
   }
}

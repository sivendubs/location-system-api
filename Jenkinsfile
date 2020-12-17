pipeline {
    agent any
    tools {
        maven 'Maven' 
	  
	    
    }
   stages {
   	stage('SonarQube Analysis'){
        	steps {
			script {
		    	    LAST_STARTED = env.STAGE_NAME
                	    withSonarQubeEnv('Sonarqube') {
                    		sh "mvn -f location-system-api/pom.xml sonar:sonar -Dsonar.sources=src/"
			    }
			/*    timeout(time: 1, unit: 'HOURS') { 
                    		def qg = waitForQualityGate()
             			if (qg.status != 'OK') {
                 			error "Pipeline aborted due to quality gate failure: ${qg.status}"*/
              		//	}
                    	
                    			timeout(time: 1, unit: 'HOURS') { 
						final String response = sh(script: "curl -s http://104.248.169.167:9000/api/qualitygates/project_status?projectKey=com.mycompany:location-system-api", returnStdout: true).trim()
						echo response
						//sh "curl -u admin:admin -X GET -H 'Accept: application/json' http://104.248.169.167:9000/api/qualitygates/project_status?projectKey=com.mycompany:location-system-api > status.json"
                        			//def json = readJSON file:'status.json'
                        			//echo "${json.projectStatus}"
                        			//if ("${json.projectStatus.status}" != "OK") {
                            			//	currentBuild.result = 'FAILURE'
                           			//	error('Pipeline aborted due to quality gate failure.')
                           			//}
                        		
						
                    
                    		}
                	}
                }
	}
       
  
   /*   stage('Build') {
      		steps {
	    		script {
				configFileProvider([configFile(fileId: '706c4f0b-71dc-46f3-9542-b959e2d26ce7', variable: 'settings')]){
				LAST_STARTED = env.STAGE_NAME
				sh "mvn -f location-system-api/pom.xml -s $settings -Dkey=mule clean install  -DskipTests"     
				}	
		    	} 
            	}    
      } 
      stage('Build image') {
      		steps {
        		script {
		//	       sh "docker stop location-system-api" 
        	 //        	sh "docker rm location-system-api"
			   	LAST_STARTED = env.STAGE_NAME
				"docker build -t location-system-api:mule -f Dockerfile ."
                	 
                        }
               }
      }

      stage('Run container') {
      		steps {
        		script {
			     	LAST_STARTED = env.STAGE_NAME
          		    	sh 'docker run -itd -p 8084:8081 --name location-system-api location-system-api:mule'
				sh 'sleep 60'
       			}
		}
     }	   
    /*  stage('Build image') {
      		steps {
        		script {
			          sh "docker stop location-system-api" 
        		   	sh "docker rm location-system-api"
			   	LAST_STARTED = env.STAGE_NAME
			   	sh "docker build -t location-system-api:mule -f Dockerfile ."
                	 
                        }
               }
      }

      stage('Run container') {
      		steps {
        		script {
			     	LAST_STARTED = env.STAGE_NAME
          		    	sh ' docker run -itd -p 8082:8081 --name location-system-api location-system-api:mule'
				sh 'sleep 60'
       			}
		}
     }*/
   	
   /*  stage ('Munit Test'){
        	steps {
			script {
				configFileProvider([configFile(fileId: '706c4f0b-71dc-46f3-9542-b959e2d26ce7', variable: 'settings')]){
			   	LAST_STARTED = env.STAGE_NAME
			   	sh "mvn -f location-system-api/pom.xml -s $settings -Dkey=mule -Dhttp.port=8086 -Dmaven.repo.local=/var/lib/jenkins/.m2/repository test"
                               // sh "mvn -f location-system-api/pom.xml -Dhttp.port=8083 test"
				}	
			}		
        	}    
     }
    stage('Functional Testing'){
        	steps {
			script {
				LAST_STARTED = env.STAGE_NAME
				sh "mvn -f cucumber-API-Framework/pom.xml test -Dtestfile=cucumber-API-Framework/src/test/javarunner.TestRunner.java"
				cucumber(failedFeaturesNumber: -1, failedScenariosNumber: -1, failedStepsNumber: -1, fileIncludePattern: 'cucumber.json', jsonReportDirectory: 'cucumber-API-Framework/target', pendingStepsNumber: -1, skippedStepsNumber: -1, sortingMethod: 'ALPHABETICAL', undefinedStepsNumber: -1)
			}
        		
             	}   
     }
	
	/*  stage ('Jmeter Testing'){
	    steps{
		    sh "mvn -f apipos-jmeter-automation-master/pom.xml clean verify -Djmeter.path=/opt/jmeter/5.3/libexec/bin/"
		    perfReport filterRegex: '', sourceDataFiles: '**/
	   //*.jtl'
	//	   publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '', reportFiles: '**/index.html', reportName: 'HTML Report', reportTitles: ''])
	
	 //   	   }
	//    }
	   
	   
  /*  stage('Archetype'){
        	steps {
			script {
		    		LAST_STARTED = env.STAGE_NAME
		    		configFileProvider([configFile(fileId: '706c4f0b-71dc-46f3-9542-b959e2d26ce7', variable: 'settings')]){
                    			sh "mvn -f location-system-api/pom.xml -s $settings archetype:create-from-project"
		    			sh "mvn -f location-system-api/target/generated-sources/archetype/pom.xml -s $settings clean deploy -DaltSnapshotDeploymentRepository=nexus-snapshots::http://104.248.169.167:8081/repository/maven-snapshots/"
                  		} 
			}
              }   
     }
	   
    stage('Deploy to Cloudhub'){
        	steps {
			script {
				configFileProvider([configFile(fileId: '706c4f0b-71dc-46f3-9542-b959e2d26ce7', variable: 'settings')]){
				LAST_STARTED = env.STAGE_NAME
				sh 'mvn -f location-system-api/pom.xml package deploy -DmuleDeploy -DskipTests -Danypoint.username=joji6 -Danypoint.password=Canadavisa25@ -DapplicationName=location-details-sapi -Dcloudhub.region=us-east-2'
				}
			}
             	}
    }
	   
    stage('Email') {
      		steps {
			script {
          		    	readProps= readProperties file: 'cucumber-API-Framework/email.properties'
          		    	echo "${readProps['email.to']}"
        		    	emailext(subject: '$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS!', body: 'Build is Success.Please find the functional testing reports. In order to check the logs, please go to url: $BUILD_URL'+readFile("apiops-anypoint-jenkins-sapi/emailTemplate.html"), attachmentsPattern: 'cucumber-API-Framework/target/cucumber-reports/report.html', from: "${readProps['email.from']}", mimeType: "${readProps['email.mimeType']}", to: "${readProps['email.to']}")
                        }
		}
    }   
    */
  /*  stage('Kill container') {
      		steps {
        		script {
	  	        	LAST_STARTED = env.STAGE_NAME		
          		    	sh 'docker rm -f location-system-api'
        		}
      		}
    	}*/
   }
 /*  post {
        failure {
	    script {
	    		emailbody = "Build Failed at $LAST_STARTED Stage. Please find the attached logs for more details."
          		readProps= readProperties file: 'cucumber-API-Framework/email.properties'
				emailext(subject: '$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS!', body: "$emailbody", attachLog: true, from: "${readProps['email.from']}", to: "${readProps['email.to']}")
                    }
            
        }
    }*/
}

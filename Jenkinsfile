pipeline {
    agent any

    tools {
        jdk 'JDK17'
        maven 'Maven3'
    }

    environment {
        JFROG_URL = "trial5v4d48.jfrog.io"
        JFROG_REPO = "docker-local"
        IMAGE = "${JFROG_URL}/${JFROG_REPO}/hmrs-app"
        K8S_EC2_IP = "13.220.155.90"
    }

    stages {
        stage('1. Checkout GitHub Code') {
            steps { 
                checkout scm 
            }
        }

        stage('2. Build HMRS Jar with Maven') {
            steps { 
                sh 'mvn clean package -DskipTests' 
            }
        }

        stage('3. Build Docker Image') {
            steps { 
                sh "docker build -t ${IMAGE}:${BUILD_NUMBER} ." 
            }
        }

        stage('4. Push Image to JFrog') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'Jfrog_cred', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh """
                        docker login ${JFROG_URL} -u ${USER} -p ${PASS}
                        docker push ${IMAGE}:${BUILD_NUMBER}
                        docker tag ${IMAGE}:${BUILD_NUMBER} ${IMAGE}:latest
                        docker push ${IMAGE}:latest
                    """
                }
            }
        }

        stage('5. Auto Deploy to Kind K8s') {
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'k8s-ec2-ssh', keyFileVariable: 'KEY')]) {
                    sh """
                        # Copy manifests to K8s server
                        scp -i ${KEY} -o StrictHostKeyChecking=no -r k8s/ ubuntu@${K8S_EC2_IP}:/home/ubuntu/

                        # Deploy commands
                        ssh -i ${KEY} -o StrictHostKeyChecking=no ubuntu@${K8S_EC2_IP} << 'EOF'
                            kubectl apply -f /home/ubuntu/k8s/namespace.yaml
                            kubectl apply -f /home/ubuntu/k8s/
                            kubectl rollout restart deployment/hmrs-backend -n hmrs
                            kubectl get pods -n hmrs
EOF
                    """
                }
            }
        }
    } // <-- Ye wala bracket pichle code mein missing tha (Stages closing)

    post {
        success { 
            echo "🎉 HMRS Backend deployed successfully!" 
        }
        failure {
            echo "❌ Build failed. Check console output."
        }
    }
}

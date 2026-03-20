pipeline {
    agent any
    stages {
        stage ('PULL'){
            steps{
                git branch: 'main', url: 'https://github.com/abhi-lab299/terraform-t29.git'
            }
        }
        stage ('PLAN'){
            steps{
                sh '''
                terraform init
                terraform plan
                '''
            }
        }
        stage ('Approval'){
            steps{
                script {
                    timeout(time: 10, unit: 'MINUTES') {
                        input message: 'Do you want to apply Terraform?', ok: 'Proceed'
                    }
                    
                }
            }
        }
        stage ('Deploy'){
            steps {
                script{
                    try{
                        sh '''
                    
                            terraform apply -auto-approve
                        '''
                    }catch(err){
                        echo "error occur"

                        sh '''
                   
                            terraform init
                            terraform apply -auto-approve
                        '''
                }
            }
        }
        }
    }
}
def githubRepo = 'https://github.com/AdaDevSecOps/AdaStoreBack.git'
def githubBranch = 'main'

def dockerRepo = 'naleruto/ada-webserver'

pipeline
{
    agent any
    environment
    {
        imagename = "naleruto/ada-webserver"
        registryCredential = 'naleruto-dockerhub'
        dockerImage = ''
    }
    stages
    {


        stage('Git Clone')
        {
            steps
            {
                echo 'Git Clone'
                git url: githubRepo,
                    branch: githubBranch
            }
        }

        stage('Build Image')
        {
            steps
            {
                echo 'Building...'
                script
                {
                        dockerImage = docker.build imagename
                }
            }
        }



        stage('Run Container For Test')
        {
            steps
            {
                echo 'Run Container For Test...'
                script
                {
                        bat 'docker run -d \
                        --env BASE_TITLE=AdaSiamKubota \
                        --env BASE_URL=http://sit.ada-soft.com:8899/ \
                        --env BASE_DATABASE=AdaAccSKC \
                        --env DATABASE_IP=147.50.143.126,33433 \
                        --env DATABASE_USERNAME=sa \
                        --env DATABASE_PASSWORD=GvFhk@61 \
                        --env SYS_BCH_CODE=00001 \
                        --env HOST=147.50.143.126 \
                        --env USER=Admin \
                        --env PASS=Admin \
                        --env VHOST=AdaPos5.0CICD_Doc \
                        --env EXCHANGE= \
                        --env PORT=5672 \
                        --env MQ_BOOKINGLK_HOST=147.50.143.126 \
                        --env MQ_BOOKINGLK_USER=Admin \
                        --env MQ_BOOKINGLK_PASS=Admin \
                        --env MQ_BOOKINGLK_VHOST=AdaPos5.0CICD_Doc \
                        --env MQ_BOOKINGLK_EXCHANGE= \
                        --env MQ_BOOKINGLK_PORT=5672 \
                        --env INTERFACE_HOST=147.50.143.126 \
                        --env INTERFACE_USER=Admin \
                        --env INTERFACE_PASS=Admin \
                        --env INTERFACE_VHOST=AdaPos5.0CICD_Doc \
                        --env INTERFACE_EXCHANGE= \
                        --env INTERFACE_PORT=5672 \
                        --env MemberV5_HOST=147.50.143.126 \
                        --env MemberV5_USER=Admin \
                        --env MemberV5_PASS=Admin \
                        --env MemberV5_VHOST=AdaPos5.0CICD_Doc \
                        --env MemberV5_EXCHANGE= \
                        --env MemberV5_PORT=5672 \
                        --env MQ_REPORT_HOST=147.50.143.126 \
                        --env MQ_REPORT_USER=Admin \
                        --env MQ_REPORT_PASS=Admin \
                        --env MQ_REPORT_VHOST=AdaPos5.0CICD_Doc \
                        --env MQ_REPORT_EXCHANGE= \
                        --env MQ_REPORT_PORT=5672 \
                        --env MQ_Sale_HOST=147.50.143.126 \
                        --env MQ_Sale_USER=Admin \
                        --env MQ_Sale_PASS=Admin \
                        --env MQ_Sale_VHOST=AdaPos5.0SKCDev_Sale \
                        --env MQ_Sale_QUEUES=UPLOADSALE,UPLOADSALEPAY,UPLOADSALERT,UPLOADSALEVD,UPLOADSHIFT,UPLOADTAX,UPLOADVOID \
                        --env MQ_Sale_EXCHANGE= \
                        --env MQ_Sale_PORT=5672 \
                        --name adastoreback-web \
                        --mount type=bind,source=C:/X-User/Nattakit,target=/var/www/html/application/logs \
                        --mount type=bind,source=C:/X-User/Nattakit,target=/var/www/html/application/modules/common/assets/system/systemimage \
                        -p 8899:80 naleruto/ada-webserver'
                }
            }
        }


        stage('Excute Robot Test')
        {
            steps
            {
                echo 'Excute Robot...'
                script
                {
                    // bat 'cd "C:/ProgramData/Jenkins/.jenkins/workspace/QA automation"'
                    bat 'robot skc.robot'
                   step(
                    [
                        $class : 'RobotPublisher',
                        outputPath : '',
                        outputFileName : "*.xml",
                        disableArchiveOutput : false,
                        passThreshold : 100,
                        unstableThreshold: 95.0,
                        otherFiles : "*.png",
                    ]
                )
                }
            }
        }

        stage('Tests Container') {

            steps {
                echo 'Testing...'
                script {
                step(
                    [
                        $class : 'RobotPublisher',
                        outputPath : '',
                        outputFileName : "*.xml",
                        disableArchiveOutput : false,
                        passThreshold : 100,
                        unstableThreshold: 95.0,
                        otherFiles : "*.png",
                    ]
                )
                }  
            }
        }


       stage('Stop Container For Test')
        {
            steps
            {
                echo 'Stop Container For Test...'
                script
                {
                        bat 'docker stop adastoreback-web'

                }
            }
        }


       stage('Remove Container For Test')
        {
            steps
            {
                echo 'Remove Container For Test...'
                script
                {
                        bat 'docker rm adastoreback-web'

                }
            }
        }



       stage('Stop Container For Sit')
        {
            steps
            {
                echo 'Stop Container For Sit...'
                script
                {
                        bat 'docker stop adastoreback-sit'

                }
            }
        }


       stage('Remove Container For Sit')
        {
            steps
            {
                echo 'Remove Container For Sit...'
                script
                {
                        bat 'docker rm adastoreback-sit'

                }
            }
        }




        stage('(Deploy) Run Container For Sit')
        {
            steps
            {
                echo '(Deploy) Run Container For Sit...'
                script
                {
                        bat 'docker run -d \
                        --env BASE_TITLE=AdaSiamKubota \
                        --env BASE_URL=http://sit.ada-soft.com:8999/ \
                        --env BASE_DATABASE=AdaAccSKC \
                        --env DATABASE_IP=147.50.143.126,33433 \
                        --env DATABASE_USERNAME=sa \
                        --env DATABASE_PASSWORD=GvFhk@61 \
                        --env SYS_BCH_CODE=00001 \
                        --env HOST=147.50.143.126 \
                        --env USER=Admin \
                        --env PASS=Admin \
                        --env VHOST=AdaPos5.0CICD_Doc \
                        --env EXCHANGE= \
                        --env PORT=5672 \
                        --env MQ_BOOKINGLK_HOST=147.50.143.126 \
                        --env MQ_BOOKINGLK_USER=Admin \
                        --env MQ_BOOKINGLK_PASS=Admin \
                        --env MQ_BOOKINGLK_VHOST=AdaPos5.0CICD_Doc \
                        --env MQ_BOOKINGLK_EXCHANGE= \
                        --env MQ_BOOKINGLK_PORT=5672 \
                        --env INTERFACE_HOST=147.50.143.126 \
                        --env INTERFACE_USER=Admin \
                        --env INTERFACE_PASS=Admin \
                        --env INTERFACE_VHOST=AdaPos5.0CICD_Doc \
                        --env INTERFACE_EXCHANGE= \
                        --env INTERFACE_PORT=5672 \
                        --env MemberV5_HOST=147.50.143.126 \
                        --env MemberV5_USER=Admin \
                        --env MemberV5_PASS=Admin \
                        --env MemberV5_VHOST=AdaPos5.0CICD_Doc \
                        --env MemberV5_EXCHANGE= \
                        --env MemberV5_PORT=5672 \
                        --env MQ_REPORT_HOST=147.50.143.126 \
                        --env MQ_REPORT_USER=Admin \
                        --env MQ_REPORT_PASS=Admin \
                        --env MQ_REPORT_VHOST=AdaPos5.0CICD_Doc \
                        --env MQ_REPORT_EXCHANGE= \
                        --env MQ_REPORT_PORT=5672 \
                        --env MQ_Sale_HOST=147.50.143.126 \
                        --env MQ_Sale_USER=Admin \
                        --env MQ_Sale_PASS=Admin \
                        --env MQ_Sale_VHOST=AdaPos5.0SKCDev_Sale \
                        --env MQ_Sale_QUEUES=UPLOADSALE,UPLOADSALEPAY,UPLOADSALERT,UPLOADSALEVD,UPLOADSHIFT,UPLOADTAX,UPLOADVOID \
                        --env MQ_Sale_EXCHANGE= \
                        --env MQ_Sale_PORT=5672 \
                        --name adastoreback-sit \
                        --mount type=bind,source=C:/X-User/Nattakit,target=/var/www/html/application/logs \
                        --mount type=bind,source=C:/X-User/Nattakit,target=/var/www/html/application/modules/common/assets/system/systemimage \
                        -p 8999:80 naleruto/ada-webserver'
                }
            }
        }


        // stage('Deploy Image') {
        //     steps{
        //         script {
        //                 docker.withRegistry( '', registryCredential ) {
        //                     dockerImage.push("$BUILD_NUMBER")
        //                     dockerImage.push('latest')

        //             }
        //         }
        //     }
        // }

    }
}

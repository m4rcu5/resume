#!groovy

node {
    try {
        stage("Prepare environment") {
            checkout scm

            def container = docker.build 'resume'

            container.inside {
                stage("Markdown to HTML") {
                    sh "make html"
                }

                stage("Generate PDF") {
                    sh "make pdf"
                }
            }
        }

        stage("Publish") {
            parallel(
                "Archive Artifacts": {
                    sh 'tar -czf webcontent.tar.gz css/ images/ *.html'

                    archiveArtifacts artifacts: '*.md, *.pdf, webcontent.tar.gz', fingerprint: true
                },
                "Deploy to webserver": {
                    withCredentials([usernamePassword(credentialsId: 'ftp-resume.marcusvandam.nl', passwordVariable: 'FTP_PASSWORD', usernameVariable: 'FTP_USERNAME')]) {
                        sh "lftp -u ${FTP_USERNAME},'${FTP_PASSWORD}' -e 'mirror -R css; mirror -R images; mirror -Rr -I *.html; quit' ftp://web01.ams-sbp1.bytesheep.net"
                    }
                }
            )
        }
    } finally {
        deleteDir()
    }
}

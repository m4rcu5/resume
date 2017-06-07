#!groovy

node {
    def container

    stage('Clone repository') {
        checkout scm
    }

    stage("Build artifacts") {
        container = docker.build('resume.build', '-f Dockerfile.build .')

        container.inside {
            stage("Markdown to HTML") {
                sh "make html"
            }

            stage("Generate PDF") {
                sh "make pdf"
            }
        }
    }

    stage("Publish Artifacts") {
        stage("Archive Artifacts") {
            sh 'tar -czf webcontent.tar.gz css/ images/ *.html'

            archiveArtifacts artifacts: '*.md, *.pdf, webcontent.tar.gz', fingerprint: true
        }

        stage("Deploy to webserver") {
            withCredentials([usernamePassword(credentialsId: 'ftp-resume.marcusvandam.nl', passwordVariable: 'FTP_PASSWORD', usernameVariable: 'FTP_USERNAME')]) {
                sh "lftp -u ${FTP_USERNAME},'${FTP_PASSWORD}' -e 'mirror -R css; mirror -R images; mirror -Rr -I *.html; quit' ftp://web01.ams-sbp1.bytesheep.net"
            }
        }
    }

    stage('Build image') {
        container = docker.build("marcusvandam/resume")
    }

    stage('Publish image') {
        gitCommit = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()

        // Push the resulting image to our own registry
        docker.withRegistry('https://docker-registry.bytesheep.net', 'docker-registry-bytesheep') {
            container.push("${gitCommit.take(6)}-${env.BUILD_NUMBER}")
            container.push("latest")
        }
    }
}

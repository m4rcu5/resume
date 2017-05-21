#!groovy

node {
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

    stage("Archive build output") {
        sh 'tar -czf webcontent.tar.gz css/ images/ *.html'

        archiveArtifacts artifacts: '*.md, *.pdf, webcontent.tar.gz', fingerprint: true
    }

    stage("Cleanup") {
        deleteDir()
    }
}

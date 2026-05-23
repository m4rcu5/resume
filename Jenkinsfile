#!groovy

def IMAGE_NAME = 'marcusvandam/resume'

node {
    def config, scmVars

    configFileProvider([
        configFile(fileId: 'deploy-config', variable: 'CONFIG_FILE')
    ]) {
        config = readYaml(file: env.CONFIG_FILE)
    }

    stage('Clone repository') {
        deleteDir()

        scmVars = checkout scm
    }

    stage('Build artifacts') {
        def container = docker.build('resume.build', '--pull -f Dockerfile.build .')

        container.inside {
            stage('Markdown to HTML') {
                sh 'make html'
            }
            stage('Generate PDF') {
                sh 'make pdf'
            }
            stage('Test HTML') {
                if (sh(script: 'LANG=C.UTF-8 htmlproofer --check-html build/', returnStatus: true) != 0) {
                    error('HTML validation failed')
                }
            }
        }
    }

    stage('Archive Artifacts') {
        sh 'tar -czf webcontent.tar.gz build/*'

        archiveArtifacts(
            artifacts: '*.md, build/*.pdf, webcontent.tar.gz',
            fingerprint: true
        )
    }

    stage("Publish") {
        stage('Push image') {
            def container = docker.build(IMAGE_NAME, '--pull .')

            docker.withRegistry(env.DOCKER_REGISTRY_URL, env.DOCKER_REGISTRY_CRED) {
                // Use tag name if this is a tagged build, otherwise use short commit hash
                container.push(scmVars.TAG_NAME ?: scmVars.GIT_COMMIT.take(10))

                container.push('latest')

            }
        }

        stage('Deploy to webserver') {
            withCredentials([usernamePassword(
                credentialsId: config.deploy.credentialId,
                passwordVariable: 'FTP_PASSWORD',
                usernameVariable: 'FTP_USERNAME'
            )]) {
                withEnv([
                    "DEPLOY_HOST=${config.deploy.host}",
                    "DEPLOY_PATH=${config.deploy.path}"
                ]) {
                    sh '''lftp -u ${FTP_USERNAME},"${FTP_PASSWORD}" \
                        -e "set ftp:ssl-allow false;                \
                        mirror -RL build/ ${DEPLOY_PATH}; quit"     \
                        ftp://${DEPLOY_HOST}'''
                }
            }
        }

        if (scmVars.TAG_NAME) {
            stage('Publish GitHub release') {
                createGitHubRelease(
                    credentialId: config.github.credentialId,
                    repository: config.github.repository,
                    tag: scmVars.TAG_NAME,
                    commitish: scmVars.GIT_COMMIT
                )
                uploadGithubReleaseAsset(
                    credentialId: config.github.credentialId,
                    repository: config.github.repository,
                    tagName: scmVars.TAG_NAME,
                    uploadAssets: [
                        [filePath: 'build/resume.pdf']
                    ]
                )
            }
        }
    }
}

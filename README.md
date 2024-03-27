# Resume of Marcus van Dam #

## For Recruiters and Hiring Managers ##

You are looking at the source of my resume. This resume is compiled, tested and deployed to HTML and PDF which you find below. If you are interested in the source, please read along.

* **HTML:** <https://resume.marcusvandam.nl/Marcus_van_Dam.html>
* **PDF:** <https://resume.marcusvandam.nl/Marcus_van_Dam.pdf>


## For Engineers ##

You will not be able to use this repository without changing the `Jenkinsfile` (and the content of the resume of course).

### Setup ###

The textual content of this resume is kept in markdown format as `Marcus_van_Dam.md`, which uses a slightly enriched markdown format as documented here: [MultiMarkdown](https://fletcher.github.io/MultiMarkdown-6/)

The styling is handled by the stylesheets in the `css` folder and referenced at the top of the markdown file.

To aid compiling it down, there is a `Makefile` which supports the following targets:

```
Please use `make <target>' where <target> is one of
  html       to make the HTML file
  pdf        to make a standalone pdf file

  watch      to continuously update the html output
```

There is also a `Dockerfile.build` to setup the build environment.

### How to Build by Hand ###

I recommend compiling the resume using Docker.

The following steps will create the build directory, copy the images and css in place, and compile the markdown file to html.

```
~# docker build -t resume-builder -f Dockerfile.build .
~# docker run -v $(pwd):/app resume-builder make -C /app html
make: Entering directory '/app'
multimarkdown Marcus_van_Dam.md > build/Marcus_van_Dam.html
Building HTML finished.
Copied CSS and images.
Linking index.html.
make: Leaving directory '/app'
```

You should now be able to open the `build/Marcus_van_Dam.html` file in your browser and print it.

### Using Jenkins ###

The repository also contains a `Jenkinsfile` which performs the following steps.

1. Checkout the repository
2. Build the Docker build container
3. Compile the HTML and PDF files
4. Test the HTML artifact with `html-proofer`
5. Publish the artifact to the artifact storage and [my webserver](https://resume.marcusvandam.nl)
6. Build a production Docker container (based on Nginx)
7. Upload this container to my private registry

Failing any of these steps fails the build, and the Jenkins server is setup to trigger on every change on the master branch.

### Adding Continuous Deployment to Docker Swarm ###

Adding continues deployment to the Jenkins file above was done as a proof of concept and is no longer in the master branch. The example code below shows how I solved the issue.

```
def containerTag = sh(returnStdout: true, script: 'git rev-parse HEAD').trim().take(6) + '-' + env.BUILD_NUMBER

stage('Publish image') {
    // Push the resulting image to our own registry
    docker.withRegistry('https://docker-registry.bytesheep.net', 'docker-registry-bytesheep') {
        container.push(containerTag)
        container.push("latest")
    }
}

stage('Deploy image') {
    docker.withServer('5.79.101.237:2376', 'docker-swarm') {
        sh "docker service update --detach=false --image docker-registry.bytesheep.net/marcusvandam/resume:${containerTag} resume"
    }
}
```

## Acknowledgments ##

As I already acknowledged in the resume itself, frontend work is not one of my strong-suites. Therefore I want to thank Ryan Gray for the stylesheet I based this resume off.

## Contact ##

If you have any questions, you can always drop me a line on mail _at_ marcusvandam.nl

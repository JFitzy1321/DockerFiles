FROM octopusdeploy/octo
WORKDIR /app

RUN apk --no-cache add zip unzip

# variables from pipeline
ENV BITBUCKET_BUILD_NUMBER=125
ENV BITBUCKET_CLONE_DIR="/app"
# repository variable, secured (Secret)
ENV OCTOPUS_URL="url to octopus server/"
ENV OCTOPUS_API_KEY="inserted from the build script"
ENV OCTOPUS_SPACE="octopus space"
# deployment variables (from deployment environment)
ENV OCTOPUS_PACKAGE_NAME="the package name"

# Copy 'Build Artifacts' and deployment script into container
COPY dist/** ./dist/touchpoint-frontend/
COPY deploy .

ENTRYPOINT [ "/bin/sh" ]
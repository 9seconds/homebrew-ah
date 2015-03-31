# This is a docker file to test if Brew works

FROM sjackman/linuxbrew
MAINTAINER 9seconds <nineseconds@yandex.ru>

RUN brew update && brew upgrade
RUN brew tap 9seconds/homebrew-ah && brew install -vd ah

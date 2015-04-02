# This is a docker file to test if Brew works.

FROM sjackman/linuxbrew
MAINTAINER 9seconds <nineseconds@yandex.ru>

# Make sure everything is up to date.
RUN brew update && brew upgrade

# Add repository as a tap and inject current directory.
RUN brew tap 9seconds/homebrew-ah && \
    rm -rf /home/linuxbrew/.linuxbrew/Library/Taps/9seconds/homebrew-ah
ADD . /home/linuxbrew/.linuxbrew/Library/Taps/9seconds/homebrew-ah

# Do all possible installations.
RUN brew install ah && brew unlink ah && brew install ah --HEAD

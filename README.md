# yamamon-docker-ruby-build

Base docker image to ruby-build environment

## What kind of docker container?

- Based OS: Alpine Linux Image
- Installed to [ruby-build](https://github.com/rbenv/ruby-build) and Ruby
- Installed to [forego](https://github.com/ddollar/forego)

## Building the base image

To create the base image ```yamamon/ruby-build```, execute the following command on the ```yamamon-docker-ruby-build``` folder:

```
docker build -t yamamon/ruby-build .
```

In default, to install the ruby 2.1.7.
If you specify the version of ruby, Build in ```--build-arg RUBY_VERSION=$(ruby_version)``` option.


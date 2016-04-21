repository = ruby-build
ruby_version = 2.2.0
all: build

build:
	@docker build --build-arg RUBY_VERSION=$(ruby_version) --force-rm=true -t $(repository):$(ruby_version) .

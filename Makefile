repository = ruby-build
ruby_version = 2.1.7
all: build

build:
	@docker build --build-arg RUBY_VERSION=$(ruby_version) --force-rm=true -t yamamon/$(repository):$(ruby_version) .



VERSION=$(shell git describe | sed -e 's/-/\./' | cut -d- -f1)

all:
	rubyc exe/bolt   --auto-update-url=http://localhost:4567/bolt --auto-update-base=$(VERSION)
	mv a.out bolt
	chmod 755 bolt

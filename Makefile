

VERSION=$(shell git describe | sed -e 's/-/\./' | cut -d- -f1)
TARGET=bolt
TMPDIR=`mktemp -d`


all: $(TARGET)

bolt:
	rubyc -d $(TMPDIR) -o $(TARGET) -c --auto-update-url=http://localhost/$(TARGET) --auto-update-base=$(VERSION) exe/$(TARGET)

clean:
	rm -rf $(TARGET)-* /tmp/rubyc ~/.libautoupdate bolt

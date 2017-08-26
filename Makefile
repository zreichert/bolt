

VERSION=$(shell git describe | sed -e 's/-/\./' | cut -d- -f1)
TARGET=bolt
TMPDIR=`mktemp -d`
PLATFORM=`uname`

DISTRO=(shell)

#TODO make this work on Windows

all: $(TARGET)

$(TARGET):
	rubyc -d $(TMPDIR) -o $(TARGET) -c --auto-update-url=http://updates.puppetlabs.com/$(TARGET)/$(PLATFORM) --auto-update-base=$(VERSION) exe/$(TARGET)

clean:
	rm -rf $(TARGET)-* /tmp/rubyc ~/.libautoupdate $(TARGET)

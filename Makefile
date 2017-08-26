

VERSION=$(shell ruby -r './lib/bolt/version' -e "puts Bolt::VERSION")
TARGET=bolt
TMPDIR=`mktemp -d`
PLATFORM=`uname`

DISTRO=(shell)

#TODO make this work on Windows

all: $(TARGET)

$(TARGET):
	rubyc -d $(TMPDIR) -o $(TARGET) -c --auto-update-url=http://updates.puppet.com/$(TARGET)/$(PLATFORM) --auto-update-base=$(VERSION)  exe/$(TARGET)

clean:
	rm -rf $(TARGET)-* /tmp/rubyc ~/.libautoupdate $(TARGET)



VERSION=$(shell git describe | sed -e 's/-/\./' | cut -d- -f1)
TARGET=bolt
TMPDIR=`mktemp -d`
PLATFORM=`uname`

DISTRO=(shell)


#TODO make this work on Windows

all: $(TARGET)

$(TARGET):
	rubyc -d $(TMPDIR) -o $(TARGET) -c --auto-update-url=http://localhost/$(TARGET)/$(PLATFORM) --auto-update-base=$(VERSION) exe/$(TARGET)

clean:
	rm -rf $(TARGET)-* /tmp/rubyc ~/.libautoupdate $(TARGET)

setup:
	echo $(DISTRO)
	# Get system level requirements
#	[ -f "/etc/debian_version" ] && apt-get update && apt-get install gcc bison squashfs-tools ruby ruby-dev || true
#	[ -f "/etc/system-release" ] && yum -y install gcc ibson ruby ruby-devel squashfs-tools || true
#	[ "Darmwin" == "$(PLATFORM)" ] && brew install squashfs bison
#	# Install rubyc
#	[  -f 




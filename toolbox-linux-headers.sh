if [ -f /run/.containerenv ] || [ -f /run/.toolboxenv ]
then
    KERNEL_VERSION=$(uname -r)
    
    if ! dpkg -l | grep -q "linux-headers-$KERNEL_VERSION" && [ ! -f "/var/lib/dummy-headers-created" ]
    then
        TEMP_DIR=$(mktemp -d)
	echo $TEMP_DIR
        cd "$TEMP_DIR" || exit 1
        
        cat > linux-headers-control << EOF
Section: kernel
Priority: optional
Standards-Version: 3.9.2
Package: linux-headers-$KERNEL_VERSION
Version: $(echo "$KERNEL_VERSION" | sed 's/-[^-]*$//')
Maintainer: Container User <user@container>
Architecture: $(dpkg --print-architecture)
Description: Dummy linux-headers package
 Auto-generated dummy package for linux-headers-$KERNEL_VERSION.
EOF
        
        equivs-build linux-headers-control
        sudo dpkg -i linux-headers-${KERNEL_VERSION}_*.deb
        sudo apt-mark hold linux-headers-$KERNEL_VERSION
        
        cd / || exit 1
        rm -rf "$TEMP_DIR"
        
        sudo touch /var/lib/dummy-headers-created
    fi
fi

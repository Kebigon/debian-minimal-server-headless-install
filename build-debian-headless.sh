#!/bin/bash

# Create a temporary directory
tmp_dir="$(mktemp -d)"

# Extract the debian iso to the temporary directory
cat $1 | bsdtar -C $tmp_dir -xf -
chmod -R +w $tmp_dir

# Copy the preseed file to the future iso
cp preseed.cfg $tmp_dir/preseed.cfg

# Update isolinux configuration to boot on the headless install automatically
sed -i '/append/ s/$/ auto=true priority=critical file=\/cdrom\/preseed.cfg/' $tmp_dir/isolinux/txt.cfg
sed -i 's/default vesamenu.c32/default install/' $tmp_dir/isolinux/isolinux.cfg

# Put the iso back together
genisoimage -r -J -b isolinux/isolinux.bin -c isolinux/boot.cat \
	-no-emul-boot -boot-load-size 4 -boot-info-table \
	-o debian-headless-netinst.iso $tmp_dir

# Make the iso bootable
isohybrid debian-headless-netinst.iso

# Remove the temporary directory
rm -Rf $tmp_dir

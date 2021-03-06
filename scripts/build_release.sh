#!/bin/sh 

# config
cur_pwd=`pwd`
today=`date +%F-%T`

git_uri=git://git.gnome.org/xmlsec
rpm_root=/usr/src/redhat
build_root="$rpm_root/BUILD/xmlsec-build-area-$today"

echo "Creating build area $build_root"
rm -rf "$build_root"
mkdir -p "$build_root"
cd "$build_root"

echo "Checking out the module '$git_url'"
git clone $git_uri
cd xmlsec
find . -name ".git" | xargs rm -r

./autogen.sh --prefix=/usr --sysconfdir=/etc
make rpm-release

tar_file=`ls xmlsec*.tar.gz`
echo "Moving sources tar file to $rpm_root/SOURCES/$tar_file"
mv $tar_file $rpm_root/SOURCES

echo "Cleanup"
cd "$cur_pwd"
#rm -rf "$build_root"


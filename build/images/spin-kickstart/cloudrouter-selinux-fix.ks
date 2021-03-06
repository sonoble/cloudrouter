%post
# Fixing SELinux context definition errors
for i in git mediawiki bugzilla mojomojo dspam man2html git; do
	sed -i s/"object_r:httpd_$i"/"object_r:$i"/ /etc/selinux/targeted/contexts/files/file_contexts
done

for i in pkcsslotd_unit_file_t couchdb_js_exec_t snapperd_home_t vbetool_exec_t; do
    echo "Removing from selinux file_contexts: $i"
	sed -i /"$i"/d /etc/selinux/targeted/contexts/files/file_contexts
done
%end

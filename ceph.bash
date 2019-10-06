#!/bin/bash
LOGFILE="/Users/tostyle/Personal/nittaya/log_ceph.txt"
ceph_osd=$(grep -E 'osds' ${LOGFILE} | grep -E 'in$' | awk '{print $2}')
ceph_osds=$(grep -E 'osds' ${LOGFILE} | grep -E 'in$' | awk '{print $4}')
ceph_up=$(grep -E 'osds' ${LOGFILE} | grep -E 'in$' | awk '{print $6}')

if [ $ceph_osd == $ceph_osds ] && [ $ceph_osd == $ceph_up ]
then
 echo "PASS, it is equal"
else
 echo "FAIL, it is not equal"
fi
echo $ceph_osd $ceph_osds $ceph_up

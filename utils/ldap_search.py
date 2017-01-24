#!/usr/bin/env python

import sys
import ldap

if len(sys.argv) <2:
  print "Usage: %s <group name>" % (sys.argv[0])
  sys.exit()

base_dn = "dc=ge,dc=co,dc=uk"

l = ldap.initialize('ldap://192.168.50.11')
username = "cn=Directory Manager"
password = "admin"

try:
  l.protocol_version = ldap.VERSION3
  l.simple_bind_s(username, password)
except Exception, error:
  print error
  sys.exit()

results = {}

try:
  ldap_result_id = l.search("ou=groups," + base_dn, ldap.SCOPE_SUBTREE, "(cn=" + sys.argv[1] + ")", ["uniquemember"])
  while 1:
    result_type, result_data = l.result(ldap_result_id, 0)
    if (result_data == []):
      break
    else:
      if result_type == ldap.RES_SEARCH_ENTRY:
        for result_item in result_data:
          if not result_item[0] in results.keys():
            results[result_item[0]] = []

          for user in result_item[1]["uniquemember"]:
            results[result_item[0]].append(user)
except ldap.LDAPError, e:
  print e
  sys.exit()

for group in results.keys():
  print "Users found in group: " + group + "\n"
  for user in results[group]:
    print user
  print ""

bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
source ~/.rvm/scripts/rvm
# run rvm notes

rvm notes

cat >/tmp/math.patch <<MATH
diff -u ruby-1.8.5-p231/math.c ruby-1.8.5-p231-fixed/math.c
--- ruby-1.8.5-p231/math.c 	2011-05-13 10:22:23.558151604 -0700
+++ ruby-1.8.5-p231-fixed/math.c 	2011-05-13 10:22:37.178152194 -0700
@@ -34,7 +34,7 @@
 	if (isnan(x)) {
 #if defined(EDOM)
 	    errno = EDOM;
-#elif define(ERANGE)
+#elif defined(ERANGE)
 	    errno = ERANGE;
 #endif
 	    continue;
MATH

rvm install 1.8.7,1.9.2
CFLAGS='-O0' rvm_rubygems_version=1.3.5 rvm install 1.8.5 --patch backported-ossl-fixes --patch /tmp/math.patch

rvm reset
rvm use 1.8.5@noFeatures --create
gem install diff-lcs --force --no-ri --no-rdoc
gem install rspec-core --no-ri --no-rdoc
gem install rspec-mocks --no-ri --no-rdoc
gem install rspec-expectations --no-ri --no-rdoc
gem install rspec --no-ri --no-rdoc
gem install mocha --no-ri --no-rdoc

rvm reset
rvm use 1.8.5@allFeatures --create
gem install diff-lcs --force --no-ri --no-rdoc
gem install rspec-core --no-ri --no-rdoc
gem install rspec-mocks --no-ri --no-rdoc
gem install rspec-expectations --no-ri --no-rdoc
gem install rspec --no-ri --no-rdoc
gem install mocha --no-ri --no-rdoc
gem install rack --version=1.1.0 --no-ri --no-rdoc
gem install net-ssh --no-ri --no-rdoc
gem install stomp --no-ri --no-rdoc
# skipping rdoc, mongrel, couchrest, sqlite3, ruby-shadow, activerecord, ldap, RRD, SELinux, augeas, openssl, syslog

rvm reset
rvm use 1.8.7@noFeatures --create
gem install rspec mocha --no-ri --no-rdoc

rvm reset
rvm use 1.8.7@allFeatures --create
gem install rspec mocha rdoc mongrel ruby-shadow diff-lcs couchrest sqlite3 rack activerecord net-ssh stomp --no-ri --no-rdoc
# skipping ldap, RRD, SELinux, augeas, openssl, syslog

rvm reset
rvm use 1.9.2@noFeatures --create
gem install rspec mocha --no-ri --no-rdoc

rvm reset
rvm use 1.9.2@allFeatures --create
gem install rspec mocha rdoc diff-lcs ruby-shadow couchrest sqlite3 rack activerecord net-ssh stomp --no-ri --no-rdoc
# skipping ldap, RRD, SELinux, mongrel, augeas, openssl, syslog

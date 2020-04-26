To use on Windows, you need to first [enable the bash shell](https://www.omgubuntu.co.uk/2016/08/enable-bash-windows-10-anniversary-update) or [Cygwin/X](https://x.cygwin.com/). Cygwin used to be the only (reasonable) game in town, but Microsoft's inclusion of a bash shell makes that a viable choice.

Next, install [vcsh](https://github.com/RichiH/vcsh/blob/master/doc/INSTALL.md). 

For Cygwin you'll need to install perl and a few Perl libraries. If you've got perl installed, run `$ cpan Test::Most Shell::Command`, which will install all the dependencies too. (Not sure if this is a problem for everyone, but I had to install curl via Cygwin before this command worked. I think it was picking up some other version of curl.) You'll also need to install [ronn](https://github.com/rtomayko/ronn/blob/master/INSTALLING) to generate the man page.

Using the Window's bash shell would, presumably, take less effort since that supports [`sudo apt-get install vcsh`](https://howtoinstall.co/en/ubuntu/trusty/vcsh).

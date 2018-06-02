#!/bin/sh
#
# ufetch-macos - tiny system info for macos
#

## INFO

# user is already defined
host="$(hostname)"
os="$(sw_vers -productName) $(sw_vers -productVersion)"
kernel="$(uname -sr)"
uptime="$(uptime | awk -F, '{sub(".*up ",x,$1);print $1}' | sed -e 's/^[ \t]*//')"
if command -v pkgin &> /dev/null; then
	packages="$(pkgin list | wc -l)"
elif command -v brew &> /dev/null; then
	brew_packages="$(brew list | wc -l)"
	cask_packages="$(brew cask list 2> /dev/null | wc -l)"
	packages="$(( ${brew_packages} + ${cask_packages} ))"
elif command -v port &> /dev/null; then
	packages="$(port installed | wc -l)"
else
	packages='no package manager'
fi
packages="$(echo ${packages} | sed -e 's/^[ /t]*//')"
shell="$(basename ${SHELL})"
if [ -z "${WM}" ]; then
	WM='Quartz Compositor'
fi

## DEFINE COLORS

# probably don't change these
bc="$(tput bold)"		# bold
c0="$(tput setaf 0)"	# black
c1="$(tput setaf 1)"	# red
c2="$(tput setaf 2)"	# green
c3="$(tput setaf 3)"	# yellow
c4="$(tput setaf 4)"	# blue
c5="$(tput setaf 5)"	# magenta
c6="$(tput setaf 6)"	# cyan
c7="$(tput setaf 7)"	# white
rc="$(tput sgr0)"		# reset

# you can change these
lc="${rc}${bc}${c4}"	# labels
nc="${rc}${bc}${c4}"	# user and hostname
ic="${rc}${bc}${c7}"	# info
pc="${rc}${c2}"			# primary color
sc="${rc}${c3}"			# secondary color
tc="${rc}${c1}"		# tertiary color
qc="${rc}${c5}"		# quaternary color
uc="${rc}${c6}"		# quinary color


## OUTPUT

cat <<EOF
${nc}${USER}${ic}@${nc}${host}${rc}
${lc}OS:        ${ic}${os}${rc}
${lc}SHELL:     ${ic}${shell}${rc}
EOF




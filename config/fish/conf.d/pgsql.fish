# Ubuntu use "/usr/lib/postgresql/*/bin/" folder
# Fedora use "/usr/pgsql-*/bin" folder

if test -e /usr/lib/postgresql/14/bin
    set -gx PATH "/usr/lib/postgresql/14/bin:$PATH"

else if test -e /usr/lib/postgresql/13/bin
    set -gx PATH "/usr/lib/postgresql/13/bin:$PATH"

else if test -e /usr/lib/postgresql/12/bin
    set -gx PATH "/usr/lib/postgresql/12/bin:$PATH"

else if test -e /usr/lib/postgresql/11/bin
    set -gx PATH "/usr/lib/postgresql/11/bin:$PATH"

else if test -e /usr/lib/postgresql/10/bin
    set -gx PATH "/usr/lib/postgresql/10/bin:$PATH"

else if test -e /usr/pgsql-14/bin
    set -gx PATH "/usr/pgsql-14/bin:$PATH"

else if test -e /usr/pgsql-13/bin
    set -gx PATH "/usr/pgsql-13/bin:$PATH"

else if test -e /usr/pgsql-12/bin
    set -gx PATH "/usr/pgsql-12/bin:$PATH"

else if test -e /usr/pgsql-11/bin
    set -gx PATH "/usr/pgsql-11/bin:$PATH"

else if test -e /usr/pgsql-10/bin
    set -gx PATH "/usr/pgsql-10/bin:$PATH"
end
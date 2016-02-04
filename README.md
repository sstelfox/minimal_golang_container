# Minimal Docker Container

This is a dead simple docker container for GoLang projects. This requires you
having docker available but nothing else. The Go project itself is built
statically in a small GoLang container statically. The resulting binary is
stored in a separate small container for use and consumption.

One major thing to be aware of, this uses musl as it's libc instead of glibc.
Some projects may have difficulties using this, but CGO is still enabled and
available.

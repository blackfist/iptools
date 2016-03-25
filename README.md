# Iptools

A set of functions for working with IPv4 addresses.

* is_ipv4?(string) - checks if a string is an ipv4 address
* is_rfc1918?(string) - checks if a string is an RFC1918 reserved address
* is_reserved?(string) - checks if a string is any kind of reserved address.
complete than just RFC1918.
* to_integer(string) - convert ip address string to integer.
* is_between(string, string, string) - checks if the first ip address is
between the next two addresses (inclusive)

# Reserved IP addresses
You almost certainly want to use is_reserved? to find out if an ip address is
"normal" or not. There are a lot of reserved addresses, such as the 0.0.0.0/8
network which are not RFC1918 addresses. So unless you're **really** checking
for just RFC1918, use is_reserved?.

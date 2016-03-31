# Iptools

A set of functions for working with IPv4 addresses.

* `is_ipv4?(string)` - checks if a string is an ipv4 address
* `is_rfc1918?(string)` - checks if a string is an RFC1918 reserved address
* `is_reserved?(string)` - checks if a string is any kind of reserved address.
complete than just RFC1918.
* `to_integer(string)` - convert ip address string to integer.
* `is_between(string, string, string)` - checks if the first ip address is
between the next two addresses (inclusive)

There are also some functions for manipulating subnet masks

* `subnet_bit_string(string)` - converts subnet mask to string of ones and zeros
* `subnet_bit_count(string)` - converts subnet mask to integer count of bits.

# Reserved IP addresses
You almost certainly want to use `is_reserved?` to find out if an ip address is
"normal" or not. There are a lot of reserved addresses, such as the `0.0.0.0/8`
network which are not RFC1918 addresses. So unless you're **really** checking
for just RFC1918, use `is_reserved?`.

# Running tests
I've got 100% test coverage for the first time in my whole life! Run `mix test`
to see if they still pass.

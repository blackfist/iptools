# Iptools

<!-- MDOC !-->

[![Module Version](https://img.shields.io/hexpm/v/iptools.svg)](https://hex.pm/packages/iptools)
[![Hex Docs](https://img.shields.io/badge/hex-docs-lightgreen.svg)](https://hexdocs.pm/iptools/)
[![Total Download](https://img.shields.io/hexpm/dt/iptools.svg)](https://hex.pm/packages/iptools)
[![License](https://img.shields.io/hexpm/l/iptools.svg)](https://github.com/blackfist/iptools/blob/master/LICENSE)
[![Last Updated](https://img.shields.io/github/last-commit/blackfist/iptools.svg)](https://github.com/blackfist/iptools/commits/master)

A set of functions for working with IPv4 addresses.

- `is_ipv4?/1` - checks if a string is an IPv4 address.
- `is_rfc1918?/1` - checks if a string is an RFC1918 reserved address.
- `is_reserved?/1` - checks if a string is any kind of reserved address. More
  complete than just RFC1918.
- `to_integer/1` - convert IP address string to integer.
- `is_between?/3` - checks if the first IP address is between the next two
  addresses (inclusive).
- `parse_ipv4_address/1` - converts IP address to tuple for use with Erlang functions, e.g. :gen_tcp

There are also some functions for manipulating subnet masks.

- `subnet_bit_string/1` - converts subnet mask to string of ones and zeros.
- `subnet_bit_count/1` - converts subnet mask to integer count of bits.

# Reserved IP addresses

You almost certainly want to use `is_reserved?/1` to find out if an IP address is
"normal" or not. There are a lot of reserved addresses, such as the `0.0.0.0/8`
network which are not RFC1918 addresses. So unless you're **really** checking
for just RFC1918, use `is_reserved?/1`.

# Running tests

I've got 100% test coverage for the first time in my whole life! Run `mix test`
to see if they still pass.

# License

Copyright (c) 2016, Kevin Thompson.

This work is free. You can redistribute it and/or modify it under the terms of
the MIT License. See the [LICENSE.md](https://github.com/blackfist/iptools/blob/master/LICENSE.md) file for more details.

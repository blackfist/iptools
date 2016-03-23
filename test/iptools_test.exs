defmodule IptoolsTest do
  use ExUnit.Case
  doctest Iptools

  test "identifies RFC1918 ip addresses" do
    assert Iptools.is_rfc1918?("10.10.10.10") == true
    assert Iptools.is_rfc1918?("172.16.10.10") == true
    assert Iptools.is_rfc1918?("192.168.1.1") == true
    assert Iptools.is_rfc1918?("172.15.10.10") == false
    assert Iptools.is_rfc1918?("192.30.252.130") == false
  end

  test "converts dotted decimal ips to integers" do
    assert Iptools.to_integer("0.0.0.0") == 0
    assert Iptools.to_integer("0.10.0.0") == 655360
    assert Iptools.to_integer("0.0.10.0") == 2560
    assert Iptools.to_integer("0.0.0.10") == 10
    assert Iptools.to_integer("10.0.0.0") == 167772160
    assert Iptools.to_integer("204.14.239.82") == 3423530834
    assert Iptools.to_integer("255.255.255.255") == 4294967295
  end

  test "identifies if an ip address is between two others (inclusive)" do
    assert Iptools.is_between?("10.0.0.0", "10.0.0.0", "10.255.255.255") == true
    assert Iptools.is_between?("10.0.0.0", "10.0.0.1", "10.255.255.255") == false
    assert Iptools.is_between?("10.255.255.255", "10.0.0.1", "10.255.255.255") == true
    assert Iptools.is_between?("10.255.255.255", "10.0.0.1", "10.255.255.254") == false
  end
end

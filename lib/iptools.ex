defmodule Iptools do
  @rfc1918_ranges [
    {"10.0.0.0", "10.255.255.255"},
    {"192.168.0.0", "192.168.255.255"},
    {"172.16.0.0", "172.31.255.255"}
  ]

  @other_reserved_ranges [
    {"0.0.0.0", "0.255.255.255"},
    {"100.64.0.0", "100.127.255.255"},
    {"127.0.0.0", "127.255.255.255"},
    {"169.254.0.0", "169.254.255.255"},
    {"192.0.0.0", "192.0.0.255"},
    {"192.0.2.0", "192.0.2.255"},
    {"192.88.99.0", "192.88.99.255"},
    {"198.18.0.0", "198.19.255.255"},
    {"198.51.100.0", "198.51.100.255"},
    {"203.0.113.0", "203.0.113.255"},
    {"224.0.0.0", "255.255.255.255"}
  ]
  @doc """
  You probably want to use is_reserved?
  Determine if an ip address is an RFC1918 address. Reserved for local
  communications within a private network as specified by RFC 1918.
  Returns true if it is an RFC1918 address.
  """
  @spec is_rfc1918?(String.t) :: boolean()
  def is_rfc1918?(ip) do
    @rfc1918_ranges
    |> Enum.any?(fn({low, high}) -> is_between?(ip, low, high) end)
  end

  @doc """
  Checks to see if an IP address is reserved for special purposes. This includes
  all of the RFC 1918 addresses as well as other blocks that are reserved by
  IETF, and IANA for various reasons.
  https://en.wikipedia.org/wiki/Reserved_IP_addresses
  """
  @spec is_reserved?(String.t) :: boolean()
  def is_reserved?(ip) do
    case is_rfc1918?(ip) do
      true -> true
      false -> @other_reserved_ranges |> Enum.any?(fn({low, high}) -> is_between?(ip, low, high) end)
    end
  end


  @doc """
  convert an ip address represented as a dotted-decimal string to
  an integer
  """
  @spec to_integer(String.t) :: integer()
  def to_integer(inString) do
    # Example input "10.0.0.1"

    String.split(inString, ".") # ["10","0","0","1"]
    |> Enum.map(fn(x) -> String.to_integer(x) end) # [10,0,0,1]
    |> Enum.zip([3,2,1,0]) #[{10,3}, {0,2}, {0,1}, {1,0}]
    |> Enum.reduce(0, fn({value, exponent}, acc) -> acc + (value * :math.pow(256, exponent)) end) # 167772161.0
    |> round #167772161
  end

  @doc """
  Checks if a given ip address is between two other IP addresses (inclusive).
  If the given ip equals either of the other two IP addresses then it returns
  true
  """
  @spec is_between?(String.t, String.t, String.t) :: boolean()
  def is_between?(ip, low, high) do
    ip_int = to_integer(ip)
    low_int = to_integer(low)
    high_int = to_integer(high)
    min(low_int, high_int) <= ip_int && ip_int <= max(low_int, high_int)
  end
end

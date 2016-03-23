defmodule Iptools do
  @doc """
  Determine if an ip address is an RFC1918 address. Reserved for local
  communications within a private network as specified by RFC 1918.
  Returns true if it is an RFC1918 address
  """
  @spec is_rfc1918?(String.t) :: boolean()
  def is_rfc1918?(inString) do
    case String.split(inString, ".") do
      ["10",_,_,_] -> true
      ["192","168",_,_] -> true
      ["172",x,_,_] -> 16 <= String.to_integer(x) && String.to_integer(x) <= 31
      _ -> false
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

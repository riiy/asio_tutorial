#include <iostream>
#include <boost/asio.hpp>

void print(const boost::system::error_code& /*e*/)
{
  std::cout << "Hello, world!" << std::endl;
}

int main()
{
  boost::asio::io_context io;

  boost::asio::steady_timer t(io, boost::asio::chrono::seconds(5));
  t.async_wait(&print);
  std::cout << "Hello, world 1!" << std::endl;

  io.run();

  std::cout << "Hello, world 2!" << std::endl;
  return 0;
}

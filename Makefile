CXX = clang++
CXXFLAGS = -O2 -std=c++17 -Wall -Wextra -pthread -stdlib=libc++

PREFIX = /usr/local

OPENSSL_DIR = $(PREFIX)/opt/openssl@1.1
OPENSSL_SUPPORT = -DCPPHTTPLIB_OPENSSL_SUPPORT -I$(OPENSSL_DIR)/include -L$(OPENSSL_DIR)/lib -lssl -lcrypto

ZLIB_SUPPORT = -DCPPHTTPLIB_ZLIB_SUPPORT -lz

BROTLI_DIR = $(PREFIX)/opt/brotli
BROTLI_SUPPORT = -DCPPHTTPLIB_BROTLI_SUPPORT -I$(BROTLI_DIR)/include -L$(BROTLI_DIR)/lib -lbrotlicommon -lbrotlienc -lbrotlidec
all: t1 t2 t3 t4 t5

timer1 : timer1.cpp
	$(CXX) -o timer1.out $(CXXFLAGS) timer1.cpp
t1 : timer1
	./timer1.out

timer2 : timer2.cpp
	$(CXX) -o timer2.out $(CXXFLAGS) timer2.cpp
t2 : timer2
	./timer2.out

timer3 : timer3.cpp
	$(CXX) -o timer3.out $(CXXFLAGS) timer3.cpp
t3 : timer3
	./timer3.out

timer4 : timer4.cpp
	$(CXX) -o timer4.out $(CXXFLAGS) timer4.cpp
t4 : timer4
	./timer4.out
timer5 : timer5.cpp
	$(CXX) -o timer5.out $(CXXFLAGS) timer5.cpp -lboost_thread
t5 : timer5
	./timer5.out

daytime_server : daytime_server.cpp
	$(CXX) -o daytime_server.out $(CXXFLAGS) daytime_server.cpp -lboost_thread
ds : daytime_server
	./daytime_server.out &
daytime_server_async : daytime_server_async.cpp
	$(CXX) -o daytime_server_async.out $(CXXFLAGS) daytime_server_async.cpp -lboost_thread
dsa : daytime_server_async
	./daytime_server_async.out &

daytime_client : daytime_client.cpp
	$(CXX) -o daytime_client.out $(CXXFLAGS) daytime_client.cpp -lboost_thread

dc : ds daytime_client
	./daytime_client.out localhost

clean:
	rm -rf *.out
